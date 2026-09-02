# BdayBash 🎂

A complete mobile solution tailored for managing birthday reminder entries, built with Flutter and Material 3 design principles. 

**Assignment Details:**
- **Topic Focus:** Birthday Reminder (Case Study 24)
- **Assigned Roll No:** 150096724089

## 🌟 Key Features
* **Scoreboard Dashboard:** View a countdown of upcoming birthdays sorted by proximity.
* **Smart Calculations:** Automatically calculates the age the person is turning and the exact days remaining until their next birthday.
* **Search Functionality:** Quickly filter through saved contacts on the main screen.
* **Detailed Records:** Stores full names, birth dates, relationships, and gift preferences.
* **Friend List:** A dedicated screen to view all saved birthday entries.
* **Modern UI/UX:** Built using Material 3 components, including glassmorphic floating bars, urgency color-coding, and custom badge chips.

## 🛠 Tech Stack & Architecture
* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** Dart (Enforcing null-safety rules: `?`, `!`, `late`, `??`)
* **State Management:** Riverpod 2.0 (`Notifier` and `NotifierProvider`)
* **Routing:** GoRouter (Paths: `/`, `/friends`, `/add`, `/details/:id`)
* **Form Validation:** Managed via `GlobalKey<FormState>`

## 📱 Screenshots
*(You can upload your screenshots to GitHub and link them here)*

## 🚀 How to Run
1. Ensure you have Flutter installed.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies (Riverpod, GoRouter, UUID).
4. Run `flutter run` to launch the app on an emulator or connected device.
