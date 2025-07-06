@buscar_usuario @R1
Feature: Buscar usuario por ID
  Como administrador del sistema,
  Quiero buscar la información del usuario por ID, mediante la API
  Para gestionar correctamente la base de datos de usuarios

  Background: Definir la URL base de la API Serverest
    * url _baseUrl
    * def headers = { accept: 'application/json', 'Content-Type': 'application/json' }

  @esc001_buscar_usuario @positivo @R1
  Scenario: Buscar usuario por ID
    Given path 'usuarios', 'JZlsgdFRT4yKGx9R'
    And headers headers
    When method GET
    Then status 200
    * def schema = read('classpath:schemas/buscar_usuario.schema.json')
    * match response == schema

  @esc002_buscar_usuario_error @negativo @R1
  Scenario: Buscar usuario por ID inválido y validar el mensaje de error
    Given path 'usuarios', 'abcdefghijklmnop'
    And headers headers
    When method GET
    Then status 400
    And match response.message == 'Usuário não encontrado'
