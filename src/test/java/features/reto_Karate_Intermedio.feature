Feature: Crear y validar un usuario en la API https://reqres.in/.
  Background: urlBase y variables
    * url baseUrl
    * def userPayload = { "name": "morpheus", "job": "leader" }
    * def usuarios =
    """
    [
      {"name": "Neo", "job": "The One"},
      {"name": "Trinity", "job": "Hacker"},
      {"name": "Morpheus", "job": "Captain"}
    ]
    """
    * def idUsuarios = []
    * karate.set('idUsuarios', idUsuarios)

  @ejercicio1_crear_validar_usuario_reqres
  Scenario: Crear un usuario y validar los datos en la pagina reqres.in
    Given path '/users'
    And request userPayload
    When method POST
    Then status 201
    And match response.name == userPayload.name
    And match response.job == userPayload.job
    And match response.id != null
    * karate.set('userId', response.id)

   # con karate.set(Guardo userId, como variable global, luego en el segundo escenario,
   # solo lo invoco y lo borro)

  @ejercicio1_eliminar_usuario_reqres
  Scenario: Eliminar el usuario creado en la pagina reqres.in
    Given path '/users/ + userId'
    When method DELETE
    Then status 204

  @ejercicio2_crear_multiples_usuarios_reqres
  Scenario Outline: Crear múltiples usuarios y validar respuesta en la pagina reqres.in
    Given path '/users'
    And request { "name": '<name>', "job": '<job>' }
    When method POST
    Then status 201
    And match response.name == '<name>'
    And match response.job == '<job>'
    And match response.id != null
      # Agregar ID al array global
    * eval idUsuarios.push(response.id)
    * karate.set('idUsuarios', idUsuarios)
    * print 'IDs generados hasta ahora:', idUsuarios

    Examples: lista de los usuarios
      | name     | job     |
      | Neo      | The One |
      | Trinity  | Hacker  |
      | Morpheus | Captain |