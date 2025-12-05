Cyberlog – Flutter Project
This repository contains a Flutter application, created as part of my mobile development learning process.

1. What I Learned
   
1.1 Native vs Cross-Platform Development -
   
Native development requires separate codebases for Android (Kotlin/Java) and iOS (Swift). It provides maximum performance and access to all device features but increases development effort and maintenance.

Cross-platform development allows building a single codebase that runs on multiple platforms. Flutter is an example of a cross-platform framework that compiles to native machine code and offers consistent UI across devices.

1.2 Hot Reload -
Hot Reload is one of Flutter’s core productivity features.
It injects code changes directly into the running app.
The app updates instantly without losing its current state.
It helps during UI building, layout adjustments, and minor logic changes.

1.3 Widgets -
Flutter uses a widget-based architecture.
Everything in Flutter is a widget (layout, text, padding, rows, columns, and the entire app itself).
Widgets can be stateless (no change at runtime) or stateful (dynamic).
This app uses fundamental widgets such as MaterialApp, Scaffold, AppBar, Center, and Text.

2. Steps Followed to Install and Set Up Flutter
   
2.1 Install the Flutter SDK -
Download the Flutter SDK from the official website: https://flutter.dev
Extract it to a simple directory (for example: C:\flutter).
Add the flutter/bin folder to the system PATH.
Open a new terminal and verify the installation using:
flutter --version

2.2 Install Android Studio -
Android Studio is required for:
Android SDK
ADB (Android Debug Bridge)
Platform tools and build tools
Emulator (AVD Manager)

Inside Android Studio, ensure the following are installed:
Android SDK
SDK Platform (for example, Android 14)
Android Virtual Device
Flutter and Dart plugins

2.3 Running flutter doctor -
This command checks if all tools and dependencies are installed correctly.
flutter doctor
It verifies:
Flutter SDK
Dart
Android Studio
Device/emulator availability
SDK tools and platform tools
Fix any issues marked with an X before proceeding.

3. Creating the Flutter Project -
   
The project was created using the following commands:
flutter create cyberlog
cd cyberlog
code .
This generated the basic Flutter folder structure, including the lib directory where the main Dart code is written.

4. Running the Application -
   
4.1 Using an Emulator
Open Android Studio.
Create and start an Android Virtual Device (AVD).
Run the app using:
flutter run

4.2 Running on a Physical Device -
Enable Developer Mode on the phone.
Turn on USB Debugging.
Connect the device via USB.
Verify connection using:
flutter devices
Run the app using:
flutter run

5. Developer Mode Setup (Physical Device) -
   
On an Android Device:
Go to Settings → About Phone.
Tap "Build Number" seven times to unlock Developer Options.
Go to Developer Options.
Enable USB Debugging.
