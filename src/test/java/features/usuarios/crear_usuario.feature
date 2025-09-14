@crear_usuario @R1
Feature: Crear nuevo usuario en Serverest
  Como administrador del sistema,
  Quiero registrar usuarios mediante la API
  Para gestionar correctamente la base de datos de usuarios

  Background: Definir la URL base de la API Serverest
    * url _baseUrl
    * def headers = { accept: 'application/json', 'Content-Type': 'application/json' }

  @esc001_crear_usuario @positivo @R1
  Scenario: Crear usuario con datos válidos y validar contrato de respuesta
  # Se genera un correo aleatorio para evitar duplicados, mediante los helpers
  # Esto es necesario porque si se reutiliza el mismo email en ejecuciones posteriores,
  # la API devolverá un error indicando que el email ya está registrado.

    * def email = call read('classpath:helpers/generar-datos.js')
    * def requestBody = read('classpath:request/crear_usuario201.json')
    * set requestBody.email = email
    Given path 'usuarios'
    And headers headers
    And request requestBody
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    * print response
    And match response._id != null
    # Validación de contrato para el caso válido (Crear usuario)
    * def schema = read('classpath:schemas/crear_usuario.schema.json')
    * match response == schema

  @esc002_crear_usuario_error @negativo @R1
  Scenario Outline: Crear usuario con errores y validar el mensaje de error
    * def email = call read('classpath:helpers/generar-datos.js')
    * def requestBody = read('classpath:request/crear_usuario400.json')
    * set requestBody.nome = "<nome>"
    * set requestBody.email = email
    * set requestBody.password = "<password>"
    Given path 'usuarios'
    And headers headers
    And request requestBody
    When method POST
    Then status 400
    And match response.<campo> == '<mensajeError>'

    Examples: Campos con errores
      | nome             | password | campo    | mensajeError                      |
      |                  | hola1234 | nome     | nome não pode ficar em branco     |
      | Giancarlo Tirado |          | password | password não pode ficar em branco |
