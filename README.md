  🧪 Reto Técnico QA Backend – Automatización con Karate DSL
  ##  🎯 Objetivo del Reto Técnico

Automatizar los siguientes flujos de negocio relacionados con la gestión de usuarios en la API pública de Serverest:


- Listar usuarios registrados.
- Crear un nuevo usuario (válido y con errores).
- Buscar un usuario por ID.
- Actualizar un usuario existente.
- Eliminar un usuario existente.
---

##  🚀 Tecnologías usadas

- [Karate DSL](https://karatelabs.io/)
- Java 11 +
- Maven
- JSON Schema (para validación)
- Git y GitHub Actions (opcional para CI)
---

## ⚙️ Pasos Previos:
Antes de comenzar con el reto técnico,  asegúrate de tener las siguientes herramientas y configuraciones instaladas en tu entorno de desarrollo:
Antes de comenzar con el reto técnico, asegúrate de tener las siguientes herramientas y configuraciones instaladas en tu entorno de desarrollo:

🔧 **Java JDK (v17.0.11)**  
Descárgalo desde [Adoptium](https://adoptium.net/)

🔧 **Maven (v3.9.9)**  
Descárgalo desde [https://maven.apache.org/](https://maven.apache.org/)

🔧 **Git**  
Desde: [https://git-scm.com/](https://git-scm.com/)

🔧 **IDE recomendado**  
[IntelliJ IDEA](https://www.jetbrains.com/idea/) o [VS Code](https://code.visualstudio.com/) con la extensión “Karate”.

---
Ya con esto es suficiente para poder clonar el proyecto.
## 📦 Clonar el Repositorio:

1. Crear una carpeta con un nombre referente al proyecto pero de preferencia en Documentos: C:\Users\User\Documents

2. Un vez creada la carpeta, hacer click derecho en esta opción:  Open Git Bash Here

3. Ingresar estos comandos para clonar el repositorio.
```bash  
git init
 ```
 ```bash  
git clone https://github.com/giancarlotiradoarana/reto-tecnico-karate-backend.git
 ```
---

## 📥 Instalación de dependencias:

- Después de abrir el IntellijIdea, selecciona la carpeta donde se encuentra el proyecto clonado.

El proyecto utiliza Maven, por lo que solo debes ejecutar:


```bash  
mvn clean install
 ```

Esto descargará automáticamente todas las dependencias necesarias (incluido Karate).

---
## 📁 Estructura del Proyecto:
- El proyecto tiene la siguiente estructura, basada en el patrón de diseño POM (Page Object Model):

```bash
📁 src                            # Carpeta fuente principal del proyecto
 └── 📁 test                     # Carpeta de pruebas (por convención de Maven)
     └── 📁 java                 # Ubicación esperada por Maven para pruebas en Java
          ├── 📁 features        # Carpeta que contiene los escenarios funcionales escritos en Gherkin
          │    └── 📁 usuarios   # Agrupa todos los features relacionados a pruebas del endpoint /usuarios
          │         ├── listar_usuarios.feature       # Prueba para obtener todos los usuarios (GET /usuarios)
          │         ├── crear_usuario.feature         # Prueba para crear un nuevo usuario (POST /usuarios)
          │         ├── buscar_usuario.feature        # Prueba para buscar un usuario por ID (GET /usuarios/{id})
          │         ├── actualizar_usuario.feature    # Prueba para actualizar un usuario existente (PUT /usuarios/{id})
          │         └── eliminar_usuario.feature      # Prueba para eliminar un usuario existente (DELETE /usuarios/{id})

          ├── 📁 data              # Carpeta que contiene datos de prueba externos en formato JSON
          │     └── usuarios.json # Archivo con datos reutilizables (usuarios válidos, inválidos, duplicados, etc.)

          ├── 📁 schemas              # Carpeta para almacenar esquemas JSON para validar estructuras de respuesta
          │     └── usuario.schema.json # Schema usado para validar la estructura del JSON de usuario (ej: propiedades, tipos)

          ├── 📄 karate-config.js   # Archivo de configuración global de Karate (URLs base, headers, etc.)

          └── 📄 RunnerTest.java    # Clase en Java que lanza la ejecución de los tests Karate desde Maven o IDE
           
📄 pom.xml                        # Archivo de configuración de Maven: define dependencias (Karate, plugins, JUnit, etc.)
📄 README.md                      # Documentación principal del proyecto (setup, ejecución, estructura, etc.)
📄 STRATEGY.md                    # Informe técnico sobre la estrategia de automatización, patrones aplicados y convenciones
```
---

##  🧪 Ejecutar los casos de prueba::


Desde la terminal, en la raíz del proyecto, puedes ejecutar:

```bash  
mvn test
 ```

También puedes correr un feature específico:
```bash  
mvn test -Dkarate.options="classpath:features/usuarios/crear_usuario.feature"
 ```

O por tag:

```bash  
mvn test -Dkarate.options="--tags @positivo"
 ```
---

## 📊 Reporte de los casos de prueba:

Luego de ejecutar las pruebas, se genera un reporte automático de resultados:se ejecuta el comando.

```bash  
target/karate-reports/karate-summary.html
 ```
---

🔎 Ábrelo en tu navegador para visualizar los resultados detalladamente.
Copiar la ruta y pegarlo en la URL de cualquier navegador, con ello se mostrará el reporte.

Pasos para abrir el reporte:
- Dar click en karate-summary.html
- Aparecerá la opción Open In  ==> Browser ==> Chrome
---
## Informe sobre la estrategia de automatización y patrones utilizados.

El informe se encuentra en el proyecto, en la siguente Ruta:
```bash
📁 src             
 ├── 📄 STRATEGY.md  
  ```
  ---
- Se colocó en un archivo separado para evitar sobrecargar el README.md y seguir buenas prácticas de organización y mantenimiento de documentación técnica.

Para ver la estrategia de automatización y patrones utilizados, consulta el archivo: ==>  [STRATEGY.md](./STRATEGY.md)
