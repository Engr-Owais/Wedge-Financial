# Wedge Financial Application - Flutter Task

## 📱 Overview

This Flutter app was developed as part of a technical task for Hoxton Wealth. It features an onboarding flow and a carousel that displays the top 5 articles fetched from an API. The app follows clean architecture principles using **Provider** for state management and **Dio** for HTTP requests.

## ✨ Features

- Animated onboarding screen (based on Figma design)
- Carousel section displaying articles fetched from an API
- Clean separation of UI and business logic
- Modern state management using `Provider`
- API integration with `Dio`
- Platform support: ✅ Android | ✅ iOS

## 🔗 API Used

- **Endpoint**: `GET https://api-qa.getwedge.com/mock-server/v1/articles`
- The top 5 articles are fetched and shown in a horizontal carousel with dummy images.

## 🧱 Tech Stack

- **Flutter**
- **Provider** – for state management
- **Dio** – for API calls
- **Figma** – for design reference

## 🛠️ Getting Started

### 📋 Prerequisites

- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Git
- A suitable IDE (VS Code or Android Studio)

### ⚙️ Installation

```bash
git clone https://github.com/yourusername/wedge-financial-app.git
cd wedge-financial-app
flutter pub get
flutter run


### 📂 Folder Structure

lib/
│
├── core/               # Constants, themes, utilities
├── models/             # Data models for API
├── providers/          # Provider classes and logic
├── screens/            # Onboarding and article carousel screens
├── services/           # API service using Dio
├── widgets/            # Reusable widgets
└── main.dart

### 📸 UI Screens

Design based on:
https://www.figma.com/design/CAYTNras9uqNtlDQCtmNUf/Onboarding-interview?node-id=11594-87674&p=f&t=Y4ulJrtHcIuJwJUp-0

### 🧪 Testing
The app has been tested on:

Android Emulator (Pixel 5 – Android 13)
iOS Simulator (iPhone 14 – iOS 16)



