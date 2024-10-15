# Backend de Entrenamos.uy

Este es el backend de la plataforma **Entrenamos.uy**, una solución para la gestión social de actividades deportivas a través de Internet.

## Tecnologías Utilizadas

- **Java 8**
- **Hibernate**
- **PostgreSQL**
- **JUnit** para pruebas
- **Maven** para la gestión de dependencias
- **Web Services SOAP**


## Requisitos

- **JDK 8** o superior
- **PostgreSQL 42.6.0** o superior
- **Maven** instalado
- **Hibernate** (configurado en el proyecto)

- ## Instalación

Sigue estos pasos para descargar y configurar el proyecto:

1. Clonar el repositorio
2. Crea una base de datos PostgreSQL: Inicia sesión en PostgreSQL y crea una base de datos llamada "entrenate"
3. Configura las credenciales del usuario:
   Usuario: postgres
   Contraseña: lapass
4. Actualiza el archivo de configuración (persistence.xml)  con las credenciales de la base de datos
5. Compila y ejecuta el proyecto como una Java Application. (Utiliza Maven para compilar)

- ## NOTA
- Para ejecutar el servidor web, asegúrate de que el backend esté levantado, ya que se consumirán las funciones publicadas mediante Web Services.
