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
<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 21 22 PM" src="https://github.com/user-attachments/assets/56d6f8ee-7c63-4a86-b229-f32e2a0b8d8f" />
Home Screen

<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 21 25 PM" src="https://github.com/user-attachments/assets/8208a7c1-ba66-47e7-9773-2c739fec713b" />
<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 21 55 PM" src="https://github.com/user-attachments/assets/43fd7e2b-c432-4811-8c3e-56641aa9a6af" />
Add New Person

<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 26 04 PM" src="https://github.com/user-attachments/assets/4c6a0feb-b427-48c2-8d36-1175654f47fa" />
Home Screen After Add Peoples

<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 26 07 PM" src="https://github.com/user-attachments/assets/ba4a9356-bb3d-4ecd-896c-01998e86d39e" />
Friend List

<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 26 15 PM" src="https://github.com/user-attachments/assets/5fbb1141-ecbe-4938-8856-fe07e65edf1a" />
Search Bar

<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 26 25 PM" src="https://github.com/user-attachments/assets/d4d25006-0227-4c8d-9311-74c62a715a66" />
<img width="1470" height="956" alt="Screenshot 2026-09-02 at 12 26 20 PM" src="https://github.com/user-attachments/assets/54946a2f-3e6f-48f8-b894-baaa7bad782c" />
Friend Profile

## 🚀 How to Run
1. Ensure you have Flutter installed.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies (Riverpod, GoRouter, UUID).
4. Run `flutter run` to launch the app on an emulator or connected device.
