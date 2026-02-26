# 🧠 Estrategia de Automatización – Backend con Karate DSL

Este documento resume la estrategia utilizada para automatizar pruebas de la API pública [Serverest.dev](https://serverest.dev) utilizando **Karate DSL**. Se han aplicado buenas prácticas en la organización, validación y mantenimiento del proyecto.

---

## 🔧 Enfoque del Proyecto

- El proyecto fue desarrollado con **Karate DSL**, un framework especializado para pruebas de APIs REST basado en Gherkin.
- Se utilizó una arquitectura modular y extensible con separación de responsabilidades por tipo de archivo (`features`, `data`, `schemas`, `config`, etc.).
- La automatización cubre **todas las operaciones CRUD** sobre el recurso `/usuarios`.

---

## 📁 Organización del Proyecto

- `features/usuarios/`: contiene los escenarios Gherkin divididos por funcionalidad (listar, crear, buscar, actualizar, eliminar).
- `data/usuarios.json`: contiene datos reutilizables y parametrizables para pruebas.
- `schemas/usuario.schema.json`: se usa para validar la estructura de la respuesta (contract testing).
- `karate-config.js`: maneja configuración global como `baseUrl` y headers.
- `RunnerTest.java`: clase encargada de ejecutar los archivos `.feature`.

---

## 🧪 Tipos de pruebas cubiertos

### ✅ Escenarios Positivos
- Crear un usuario con datos válidos.
- Obtener lista de usuarios.
- Buscar un usuario por ID.
- Actualizar correctamente un usuario existente.
- Eliminar un usuario registrado.

### ❌ Escenarios Negativos
- Crear usuario con campos vacíos o ya registrados.
- Buscar usuario con ID inválido o inexistente.
- Actualizar usuario con datos inválidos.
- Eliminar usuario inexistente.

---

## 📦 Manejo de datos

- Se utilizó un archivo JSON externo para mantener **datos de prueba separados del código** (`data/usuarios.json`).
- También se generaron datos aleatorios en ciertos casos para evitar colisiones (duplicidad de emails, por ejemplo).
- La creación de usuarios incluye validación para evitar registros repetidos.

---

## 🧰 Validaciones aplicadas

- **Status code** (`200`, `201`, `400`, `404`, `409`, etc.)
- **Body**: validaciones con `match` en campos clave
- **Esquema de respuesta**: validaciones estructurales usando `match response == schema`

---

## 🔖 Tags utilizados

Se usaron tags Gherkin para facilitar la ejecución segmentada:

- `@positivo`: pruebas exitosas
- `@negativo`: pruebas con errores
- `@regresion`: pruebas clave para regresión

---

## 🛠️ Ejecución del proyecto

- Las pruebas se ejecutan con Maven: `mvn test`
- También pueden ejecutarse por archivo o tag
- Los reportes generados (`karate-summary.html`) permiten inspeccionar resultados con detalle
---

## 📌 Consideraciones finales

- Se aplicaron principios de mantenimiento como **reutilización**, **modularidad** y **separación de capas**.
- El proyecto es fácilmente escalable y puede extenderse a otros endpoints como `/produtos`, `/login`, etc.
- Se siguieron prácticas alineadas a un entorno real de trabajo en equipos de QA y automatización.


