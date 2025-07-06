Feature: Listar usuarios
  Como administrador del sistema,
  Quiero listar la información del usuario, mediante la API
  Para gestionar correctamente la base de datos de usuarios

  Background: Definir la URL base de la API Serverest
    * url _baseUrl
    * def headers = { accept: 'application/json', 'Content-Type': 'application/json' }

  @esc001_listar_usuarios @positivo @R1
  Scenario: Listar todos los usuarios de la API Serverest
    Given path 'usuarios'
    And headers headers
    When method GET
    Then status 200
    * print response
    * def schema = read('classpath:schemas/listar_usuarios.schema.json')
    * match response.quantidade == '#number'
    * match each response.usuarios == schema
