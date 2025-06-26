# screen shoot
![WhatsApp Image 2025-06-26 at 22 02 48](https://github.com/user-attachments/assets/abdbc38b-a6d7-4e4e-80e9-92beb3cd914e)
![WhatsApp Image 2025-06-26 at 22 02 48 (1)](https://github.com/user-attachments/assets/c0dddd27-0aa3-4cbd-ac50-5c8713d864b0)
![WhatsApp Image 2025-06-26 at 22 02 48 (2)](https://github.com/user-attachments/assets/6abc636d-ef8e-4de5-9fde-f0a52b365f90)

# Project Setup Guide

This project is built using a base Flutter architecture with clean separation of concerns following Clean Architecture principles.

## 🚀 Getting Started

To create a new project based on this structure:

1. Clone this repository or copy the base project files.
2. Open your terminal and navigate to the project directory.
3. Run the following commands:

```bash
flutter clean
flutter pub get
flutter run
```

These steps ensure all packages are properly installed before running the app.

> **Note:** If you add or update any packages, you must repeat the above commands to ensure everything is up-to-date.

---

## 🧱 Architecture Overview

This project follows the **Clean Architecture** pattern. Each feature is divided into the following layers:

* `data` – Handles data sources and models.
* `domain` – Contains business logic and use cases.
* `presentation` – Manages the UI and state.

### 📂 Presentation Layer Structure

Each feature's `presentation` folder includes:

* **`screen/`** – The main UI screens.
* **`widget/`** – Contains smaller UI components (stateless/stateful) extracted from screens.
* **`manager/`** – Handles state management using **Cubit**.

This modular structure ensures scalability, maintainability, and clean code separation.

---

## ✅ Notes

* Always run `flutter clean` and `flutter pub get` after adding or updating packages.
* Follow the feature-based structure strictly for consistency and readability.
* To build the APK for release, run the following command:

```bash
flutter build apk
```
