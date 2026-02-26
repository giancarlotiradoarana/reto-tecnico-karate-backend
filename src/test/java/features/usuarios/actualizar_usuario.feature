@actualizar_usuario @R1
Feature: Actualizar usuario existente
  Como administrador del sistema,
  Quiero Atualizar la información del usuario mediante la API
  Para gestionar correctamente la base de datos de usuarios

  Background: Definir la URL base de la API Serverest
    * url _baseUrl
    * def headers = { accept: 'application/json', 'Content-Type': 'application/json' }

  @esc001_actualizar_usuario @positivo @R1
  Scenario Outline: Actualizar la información del usuario y validar contrato de respuesta
    * def email = call read('classpath:helpers/generar-datos.js')
    * def requestBody = read('classpath:request/actualizar_usuario201.json')
    * set requestBody.nome = '<nome>'
    * set requestBody.email = email
    * set requestBody.password = '<password>'
    Given path 'usuarios/<id>'
    And headers headers
    And request requestBody
    When method PUT
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id != null
    # Validación de contrato para el caso válido (Crear usuario)
    * def schema = read('classpath:schemas/actualizar_usuario.schema.json')
    * match response == schema

    Examples: Modificación de los campos del usuario
      | id | nome             | password     |
      | 1  | Giancarlo Tirado | hola124@     |
      | 2  | Juan Perez       | juancito2025 |

  @esc002_actualizar_usuario_error @negativo @R1
  Scenario Outline: Actualizar la información del usuario con errores y validar el mensaje de error
    * def email = call read('classpath:helpers/generar-datos.js')
    * def requestBody = read('classpath:request/actualizar_usuario400.json')
    * set requestBody.nome = "<nome>"
    * set requestBody.email = email
    * set requestBody.password = "<password>"
    Given path 'usuarios/<id>'
    And headers headers
    And request requestBody
    When method PUT
    Then status 400
    And match response.<campo> == '<mensajeError>'

    Examples: Campos con errores
      | id | nome             | password | campo    | mensajeError                      |
      | 1  |                  | hola1234 | nome     | nome não pode ficar em branco     |
      | 2  | Giancarlo Tirado |          | password | password não pode ficar em branco |
