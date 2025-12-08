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


2] ODD/EVEN CHECKER

Even/Odd Checker App – README Update
Integration
The Even/Odd Checker App from the classroom assignment has been added to the main Flutter project inside the existing cyberlog application.
The updated main.dart file now includes:
A TextField for number input
An ElevatedButton to trigger the check
Conditional logic to determine even or odd
A Text widget to display the result
String interpolation for formatting output

JIT vs AOT Compilation
Dart uses two different compilation strategies depending on the stage of development:

JIT (Just-in-Time) Compilation
Used during development when running the app through an emulator or device.
Allows Hot Reload by compiling code while the program is running.
Helps in quickly testing UI changes and updating logic without restarting the entire application.

AOT (Ahead-of-Time) Compilation
Used for release builds that are deployed to the Play Store or App Store.
Converts Dart code into optimized native machine code before execution.
Provides fast startup time and smooth performance in production.
Flutter uses JIT for development speed and AOT for runtime performance.

Use of Conditionals for Even/Odd Logic
The Even/Odd logic in the app uses Dart's if-else conditional structure.
After reading the number from the TextField and converting it into an integer, the condition:
if (number % 2 == 0)
checks whether the remainder is zero.
If true, the number is even; otherwise, it is odd.
The result is stored in a String variable and displayed on the UI.
Use of String Interpolation
To display a clean result message to the user, Dart’s string interpolation feature was used:
"The number $number is Even."
Using $number inserts the actual value directly into the message without needing concatenation.
This makes the final output text simple, readable, and dynamic.








