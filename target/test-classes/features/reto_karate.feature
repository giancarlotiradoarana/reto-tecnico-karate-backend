Feature: Obtener usuario específico - Reto Karate Giancarlo

  Background: url
    * url 'https://reqres.in/api'
    * configure ssl = true

  @ejercicio1_obtener_usuario_especifico_reqres
  Scenario: Validar que se puede obtener un usuario específico de la API Reqres.in
    Given path '/users/2'
    When method get
    Then status 200
    And assert response.data != null
    And match response.data.id == '#number'

  @ejercicio2_crear_usuario_reqres
  Scenario: Validar la creación de un usuario en la API Reqres.in
    Given path '/users'
    And request
      """
     {
    "name": "Carlos",
    "job": "QA Engineer"
      }
     """
    When method post
    Then status 201
    And match response.name == "Carlos"
    And match response.job == "QA Engineer"
    And match response.id == '#string'
    And match response.createdAt == '#string'

  @ejercicio3_actualizar_usuario_reqres
  Scenario: Validar la actualización de un usuario en la API Reqres.in
    Given path '/users/2'
    And request
       """
     {
    "name": "Carlos",
    "job": "Senior QA Engineer"
      }
       """
    When method put
    Then status 200
    And match response.name == "Carlos"
    And match response.job == "Senior QA Engineer"
    And match response.updatedAt == '#string'
