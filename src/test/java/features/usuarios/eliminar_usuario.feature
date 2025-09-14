@eliminar_usuario @R1
Feature: Eliminar usuario
  Como administrador del sistema,
  Quiero eliminar la información del usuario, mediante la API
  Para gestionar correctamente la base de datos de usuarios

  Background: Definir la URL base de la API Serverest
    * url _baseUrl
    * def headers = { accept: 'application/json', 'Content-Type': 'application/json' }

  @esc001_eliminar_usuario @positivo @R1
  Scenario: Excluir usuário existente
    #Se puede utilizar estos _id: para furutas pruedas del caso de DELETE, reemplazar en la linea 18 en el ID
    #  rIRGjTqashdXHNjR
    #  uEb4sdsOUhTybGSh

    Given path 'usuarios','G0QxXXCe9ZkZGCSu'
    And headers headers
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'
    * def schema = read('classpath:schemas/eliminar_usuario.schema.json')
    * match response == schema

  @esc002_eliminar_usuario_error @negativo @R1
  Scenario Outline: Eliminar usuario con errores y validar el mensaje de error
    Given path 'usuarios','<id>'
    And headers headers
    When method DELETE
    Then status 200
    And match response.message == '<mensajeError>'

    Examples: Campos con errores
      | id               | mensajeError             |
      | qdJwagdra9nGVIeF | Nenhum registro excluído |
      | abcdefghijklmnop | Nenhum registro excluído |




