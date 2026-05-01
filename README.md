# 🐾 AppMóvilesDev — Aplicación de Veterinaria

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![GetX](https://img.shields.io/badge/GetX-6C63FF?style=for-the-badge&logo=flutter&logoColor=white)](https://github.com/jonataslaw/getx)
[![Hive](https://img.shields.io/badge/Hive-F5C518?style=for-the-badge&logo=database&logoColor=black)](https://hivedb.dev)

**Proyecto educativo de la clase de Aplicaciones Móviles — Universidad Autónoma de Tamaulipas**

[Características](#-características) · [Arquitectura](#-arquitectura) · [Instalación](#-instalación)

</div>

---

## 💡 ¿Qué es este proyecto?

**AppMóvilesDev** es un proyecto académico desarrollado para la clase de **Aplicaciones Móviles** de la UAT. Tiene como objetivo ir **enriqueciendo progresivamente** los conocimientos de desarrollo móvil, aplicando conceptos avanzados de Flutter en un contexto real: una **aplicación de veterinaria**.

El proyecto parte de una base sencilla y se va expandiendo con nuevas funcionalidades, patrones de arquitectura y tecnologías a medida que avanza el curso.

> 🎓 **Propósito educativo:** Aprender Flutter, patrones de diseño, persistencia local y arquitectura limpia mediante un caso de uso práctico.

---

## ✨ Características Actuales

### 🐶 Gestión de Mascotas (CRUD Completo)
- **Registrar mascotas:** Nombre, especie y edad.
- **Listar mascotas:** Vista tipo lista con todas las mascotas guardadas.
- **Editar mascotas:** Actualizar datos en tiempo real.
- **Eliminar mascotas:** Remover registros con confirmación.

### 💾 Persistencia Local con Hive
- Base de datos local **NoSQL** para almacenar mascotas sin internet.
- Adaptadores generados automáticamente para serialización de objetos.
- Operaciones rápidas de lectura/escritura.

### 🎨 Temas y UI
- **Tema personalizado** con Material 3.
- **Colores, textos y estilos** centralizados en capa `core/`.
- **Internacionalización:** Estructura preparada para múltiples idiomas.
- **Utilidades responsive** para adaptación a diferentes tamaños de pantalla.

### 🏗️ Arquitectura GetX Pattern
- **State management** con GetX (`obs`, `Obx`, `GetView`).
- **Inyección de dependencias** mediante Bindings.
- **Patrón repositorio** separando providers de controllers.
- **Rutas nombradas** con navegación declarativa.

---

## 🏗️ Arquitectura

```text
lib/
├── app/
│   ├── core/
│   │   ├── theme/           # AppTheme, ColorTheme, TextTheme
│   │   ├── utils/           # Extensiones, helpers, funciones responsive
│   │   └── values/          # Colores, strings, idiomas (i18n)
│   ├── data/
│   │   ├── model/           # Modelos de datos (Mascota con Hive)
│   │   ├── provider/        # Fuentes de datos (Hive, API, Storage)
│   │   └── services/        # Repositorios (MascotaRepository)
│   ├── modules/
│   │   └── mascota/         # Página, Controller y Binding del módulo
│   └── routes/              # Rutas y páginas de la app
└── main.dart
```

### Tech Stack
- **Flutter 3.10+** — Framework UI multiplataforma
- **GetX** — State management, routing y DI
- **Hive** — Base de datos local NoSQL ultrarrápida
- **Material 3** — Componentes de UI modernos

---

## 🚀 Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/ebravo-dev/appmovilesdev.git
cd appmovilesdev

# 2. Instalar dependencias
flutter pub get

# 3. Generar código Hive (adaptadores)
dart run build_runner build

# 4. Ejecutar
flutter run
```

### Requisitos
- Flutter SDK `^3.10.1`
- Dart `^3.0.0`

---

## 📚 Aprendizajes Aplicados

| Concepto | Implementación |
|----------|---------------|
| **State Management** | GetX con variables reactivas (`.obs`) |
| **Patrón MVC/MVVM** | Separación de UI, lógica y datos |
| **Persistencia Local** | Hive con adaptadores auto-generados |
| **Dependency Injection** | GetX Bindings para inyección de controllers |
| **Patrón Repository** | Abstracción entre providers y controllers |
| **Responsive Design** | Utilidades para móviles y tablets |
| **i18n** | Estructura de idiomas lista para expansiones |

---

## 🛣️ Roadmap del Curso

- [x] Proyecto base con GetX Pattern
- [x] CRUD de mascotas con Hive
- [x] Temas personalizados y UI responsive
- [ ] Gestión de dueños/clientes
- [ ] Citas y agenda veterinaria
- [ ] Historial médico de mascotas
- [ ] Notificaciones locales
- [ ] Integración con API externa
- [ ] Autenticación de usuarios
- [ ] Sincronización en la nube

---

## 🎓 Contexto Académico

Este repositorio es parte de la materia **Aplicaciones Móviles** de la:

**Universidad Autónoma de Tamaulipas (UAT)**  
Facultad de Ingeniería y Ciencias

> El contenido y la estructura del proyecto evolucionan conforme avanzan las unidades del curso.

---

## 📄 Licencia

Proyecto académico con fines educativos.  
Desarrollado por [Eder J. G. Bravo](https://github.com/ebravo-dev).

---

> *"Aprender haciendo: cada commit es una lección."* 🐾
