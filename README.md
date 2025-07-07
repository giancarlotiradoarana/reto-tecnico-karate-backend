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
- Git 
- GitHub
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
Desde: [https://www.jetbrains.com/idea/](https://www.jetbrains.com/idea/)

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

          ├── 📁 helpers              # Carpeta que contiene datos aleatorios
          │     └── generar-datos.json # Archivo con datos reutilizables
          
          ├── 📁 request               # Carpeta que contiene los cuerpos (JSON) de las peticiones
          │     └── actualizar_usuario201.json  # Request válido para actualización de usuario (HTTP 201)
          │     └── actualizar_usuario400.json  # Request válido para actualización de usuario (HTTP 400)
          │     └── crear_usuario201.json  # Request válido para creación de usuario (HTTP 201)
          │     └── crear_usuario400.json  # Request válido para creación de usuario (HTTP 201)

          ├── 📁 runner              # Carpeta que contiene datos aleatorios
          │   └──📄 RunnerTest.java    # Clase en Java que lanza la ejecución de los tests Karate desde Maven o IDE


          ├── 📁 schemas              # Carpeta para almacenar esquemas JSON para validar estructuras de respuesta
          │     └── actualizar_usuario.schema.json # Schema usado para validar la estructura del JSON de actualizar_usuario 
          │     └── buscar_usuario.schema.json # Schema usado para validar la estructura del JSON de buscar_usuario
          │     └── crear_usuario.schema.json # Schema usado para validar la estructura del JSON de crear_usuario 
          │     └── eliminar_usuario.schema.schema.json # Schema usado para validar la estructura del JSON de eliminar_usuario 
          │     └── listar_usuario.schema.schema.json # Schema usado para validar la estructura del JSON de listar_usuario 
          
          ├── 📄 karate-config.js   # Archivo de configuración global de Karate (URLs base, headers, etc.)
           
📄 pom.xml                        # Archivo de configuración de Maven: define dependencias (Karate, plugins, JUnit, etc.)
📄 README.md                      # Documentación principal del proyecto (setup, ejecución, estructura, etc.)
📄 STRATEGY.md                    # Informe técnico sobre la estrategia de automatización, patrones aplicados y convenciones
```
---

##  🧪 Ejecutar los casos de prueba:


Desde la terminal, en la raíz del proyecto, puedes ejecutar:

Hay dos maneras de ejecutar los casos: Por Scenario en específico o por .feature

- Por Scenario en específico, solo al final de comando se agrega el @Tag que se desea probar.


```bash  
mvn test -D'karate.options=--tags @AQUI AGREGAR EL TAG DEL CASO'
 ```
Ejemplo:   mvn test -D'karate.options=--tags @esc001_listar_usuarios'

También puedes correr un feature específico:
```bash  
mvn test -D'karate.options=classpath:features/usuarios/AQUI_PONER_EL_NOMBRE_DEL_FEATURE.feature'
 ```
Ejemplo:   mvn test -D'karate.options=classpath:features/usuarios/crear_usuario.feature'

## 📊 Reporte de los casos de prueba:

Luego de ejecutar las pruebas, se genera un reporte automático de resultados en la siguente ruta en el proeyecto.

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

---
# DEMOSTRACIÓN DEL PROYECTO EN VIDEO

En este video se muestra:
- La ejecución de las pruebas automatizadas
- La estructura del proyecto
- Explicación de la estrategia y herramientas utilizadas

Puedes ver la demostración del proyecto en el siguiente enlace:

📹 [VER VIDEO EN GOOGLE DRIVE](https://drive.google.com/drive/folders/1wzM0drAp-5DE5Ksu2uTBYcvXTGDaaz95?usp=sharing)

---
