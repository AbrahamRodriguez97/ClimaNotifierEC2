# Proyecto: Notificador Diario del Clima con Twilio y AWS EC2

## Resumen del Proyecto:
Este proyecto de Ingeniería de Datos y DevOps automatiza la descarga diaria de pronósticos del clima (usando WeatherAPI) y envía notificaciones instantáneas vía SMS (usando Twilio). El proyecto está desplegado en un servidor virtual en la nube (AWS EC2) y programado para ejecutarse diariamente usando `cron`.

---

## Arquitectura y Stack Tecnológico:

| Componente | Tecnología/Herramienta | Propósito |
| :--- | :--- | :--- |
| **Lenguaje** | Python 3.x | Lógica principal y procesamiento de datos. |
| **Servidor** | AWS EC2 (Ubuntu) | Servidor de producción para el despliegue del script. |
| **Control de Versiones** | Git / GitHub | Almacenamiento seguro del código y control de versiones. |
| **APIs** | Twilio API | Servicio de mensajería (SMS). |
| **API de Datos** | WeatherAPI | Fuente de datos para el pronóstico del clima. |
| **Automatización** | Linux `cron` | Programación de la ejecución diaria del script. |
| **Librerías Clave** | Pandas, Requests, bs4 | Procesamiento de datos y peticiones HTTP. |

---

## ⚙️ Proceso de Desarrollo y Despliegue

### A. Desarrollo y Seguridad de Credenciales
El proyecto se desarrolló inicialmente en un Jupyter Notebook y se migró a un script de Python ejecutable. La fase crucial fue la seguridad:

1.  **Limpieza de Historial:** Se eliminaron las claves secretas (Twilio, WeatherAPI) del código fuente y del historial de Git, asegurando un repositorio limpio.
2.  **Manejo Seguro:** Se implementó el estándar de **Variables de Entorno (`os.environ.get`)** para que el código leyera las claves directamente del sistema operativo, nunca almacenándolas en el repositorio.
3.  **Dependencias:** Se creó el archivo `requirements.txt` para asegurar la portabilidad del entorno.

### B. Despliegue en AWS EC2
1.  **Preparación:** Se clonó el repositorio en una instancia EC2 (Ubuntu) y se configuró un **entorno virtual (`venv`)**.
2.  **Inyección de Secretos:** Se crearon las variables de entorno (`TWILIO_ACCOUNT_SID`, etc.) para inyectar las credenciales que el script esperaba.
3.  **Depuración y Ejecución:** Se depuraron los errores finales de importación y se confirmó la ejecución exitosa del script, resultando en un SMS de prueba.

### C. Automatización con `cron`
1.  **Persistencia de Secretos:** Se creó un archivo **`.env`** para almacenar las credenciales de forma permanente, ya que `cron` no hereda las variables de la sesión de `export`.
2.  **Script Wrapper:** Se diseñó un script de shell (`run_notifier.sh`) para cargar el entorno virtual y las variables de `.env` antes de ejecutar el script principal de Python.
3.  **Programación Diaria:** Se configuró un **`cron job`** para llamar al *wrapper script* diariamente a una hora específica, garantizando el funcionamiento desatendido del sistema.

---

## Cómo Replicar el Proyecto (Instrucciones)
1.  **Clonar el repositorio:** `git clone https://docs.github.com/en/repositories/creating-and-managing-repositories/deleting-a-repository`
2.  **Configurar el Entorno:** `python3 -m venv venv` y `source venv/bin/activate`
3.  **Instalar dependencias:** `pip install -r requirements.txt`
4.  **Configurar Variables:** Crear el archivo `.env` con las claves necesarias (`TWILIO_ACCOUNT_SID`, `WEATHER_API_KEY`, etc.).
5.  **Programar:** Configurar el `crontab -e` usando la ruta absoluta al script `run_notifier.sh` para la automatización.

---