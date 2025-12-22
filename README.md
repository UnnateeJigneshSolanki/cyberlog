Cyberlog – Flutter Sessions.

This repository contains things I have learnt as a part of my Flutter Development process.

Session 1 - Basics

1.1 Native vs Cross-Platform Development -
Native development requires separate codebases for Android (Kotlin/Java) and iOS (Swift). It provides maximum performance and access to all device features but increases development effort and maintenance.
Cross-platform development allows building a single codebase that runs on multiple platforms. Flutter is an example of a cross-platform framework that compiles to native machine code and offers consistent UI across devices.

1.2 Hot Reload -
● Hot Reload is one of Flutter’s core productivity features.
● It injects code changes directly into the running app.
● The app updates instantly without losing its current state.
● It helps during UI building, layout adjustments, and minor logic changes.

1.3 Widgets -
● Flutter uses a widget based architecture.
● Everything in Flutter is a widget (layout, text, padding, rows, columns, and the entire app itself).
● Widgets can be stateless (no change at runtime) or stateful (dynamic).
● Apps uses fundamental widgets such as MaterialApp, Scaffold, AppBar, Center, and Text.

1.4 Steps to follow to install and setup Flutter
   
1.4.1 Install the Flutter SDK -
● Download the Flutter SDK from the official website: https://flutter.dev
● Extract it to a simple directory (for example: C:\flutter).
Add the flutter/bin folder to the system PATH.
● Open a new terminal and verify the installation using:
flutter --version

1.4.2 Install Android Studio -
Android Studio is required for:
- Android SDK
- ADB (Android Debug Bridge)
- Platform tools and build tools
- Emulator (AVD Manager)
Inside Android Studio, ensure the following are installed:
- Android SDK
- SDK Platform (for example, Android 14)
- Android Virtual Device
- Flutter and Dart plugins

1.4.3 Running flutter doctor -
This command checks if all tools and dependencies are installed correctly.
flutter doctor
It verifies:
Flutter SDK
Dart
Android Studio
Device/emulator availability
SDK tools and platform tools
Fix any issues marked with an X before proceeding.

1.5 Creating the Flutter Project -
   
Create a project using the following commands:
flutter create cyberlog
cd cyberlog
code .
This generates the basic Flutter folder structure, including the lib directory where the main Dart code is written.

1.5.1 - Running the Application -
Using an Emulator
Open Android Studio.
Create and start an Android Virtual Device (AVD).
Run the app using:
flutter run

1.5.2 - Running on a Physical Device -
Enable Developer Mode on the phone.
Turn on USB Debugging.
Connect the device via USB.
Verify connection using:
flutter devices
Run the app using:
flutter run

1.5.3 - Developer Mode Setup (Physical Device) -
On an Android Device:
Go to Settings → About Phone.
Tap "Build Number" seven times to unlock Developer Options.
Go to Developer Options.
Enable USB Debugging.


Session 2 – Dart Programming & Logic in Flutter

Inntroduction to Dart programming and how application logic is written and used inside Flutter apps. Dart acts as the brain of the application, controlling how data is stored, processed, and displayed on the screen.

2.1 - The main concepts covered include:
1) Variables: Used to store values in memory so they can be reused and updated during app execution.
2) Data Types: Dart uses data types such as String, int, double, bool, and num to ensure data is handled correctly.
3) String Interpolation: Allows variables and expressions to be inserted directly into text using $, making UI text dynamic and readable.
4) Conditionals (if–else): Enable the app to make decisions based on conditions, such as checking user input or changing UI behavior.
5) Loops: Used to repeat actions and dynamically generate multiple widgets from data.
6) Functions: Reusable blocks of code that help organize logic and reduce repetition.
7) Logic inside UI: Dart logic directly controls Flutter widgets, allowing the UI to change dynamically based on conditions, loops, and function results.
These concepts together form the foundation of interactive Flutter applications.

2.2 - JIT vs AOT Compilation

Flutter uses two compilation techniques to balance development speed and runtime performance.
2.2.1 - Just-In-Time (JIT) Compilation:
● Used during development while running the app on an emulator or device
● Compiles code while the application is running
● Enables Hot Reload, allowing instant UI and logic updates
● Helps developers test changes quickly without restarting the app
2.2.2 - Ahead-Of-Time (AOT) Compilation:
● Used for release builds submitted to the Play Store or App Store
● Compiles Dart code into optimized native machine code before execution
● Results in faster startup time and smoother performance
● Improves efficiency and user experience in production.

- Flutter uses JIT to improve developer productivity and AOT to ensure high performance for end users.

2.3 - Code Implementation – Even/Odd Checker App
The Even/Odd Checker App implements the concepts learned in Session 2.

The implementation includes:
● A TextField to accept a numeric value from the user
● An ElevatedButton to trigger the even/odd check
● Conversion of user input from String to integer
● Use of if-else conditional logic to check whether the number is divisible by 2
● Storage of the result message in a String variable
● Display of the result using a Text widget
● Use of string interpolation to format the output message dynamically
This implementation demonstrates how Dart logic interacts with Flutter UI components to create a simple, interactive application.

(screenshots)- ![session2](https://github.com/user-attachments/assets/64345476-3f6f-48b6-a198-38beb9895dfc)
![session2(1)](https://github.com/user-attachments/assets/48033e9c-a980-4a60-b92e-e1ed9a84490d)


Session 3 – Data Structures, Classes & State Management in Flutter

3.1 - The main concepts covered were:

1) Lists: Ordered collections used to store multiple values of the same type. Lists are commonly used to represent repeating data such as logs, messages, or items displayed on the screen.
2) Maps: Key–value data structures used to store related information, often matching real-world data formats like JSON.
3) Classes & Objects: Classes act as blueprints for organizing related data and behavior, while objects are real instances created from those classes.
4) Object-Oriented Programming (OOP): Helps structure complex data in a clean, reusable, and maintainable way.
5) Loops for UI Rendering: Lists are iterated using loops to dynamically generate multiple widgets instead of hardcoding UI elements.
6) Asynchronous Programming (Future, async/await): Used to handle time-consuming tasks without freezing the UI.
7) StatefulWidget & setState(): Enables dynamic UI updates when data changes during app execution.
These concepts allow Flutter apps to handle real-world data and update the UI efficiently.

3.2 - Code Implementation 

In this implementation, a Log class was created to store log-related data.
Each Log object contains three values: action, timestamp, and status, which represent a single log entry.
Inside the build method, a List<Log> was created with sample log objects.
Each object represents user activity such as sign-in or logout along with its time and status.
To display the logs on the screen, the list is iterated using the map() method instead of manually writing multiple Text widgets.
For each log object in the list:
The action and timestamp are displayed under the “LOGS” heading
The status is displayed separately under the “STATUS” heading
The spread operator (...) is used to insert the generated widgets directly into the Column.
Text color for the status is decided using a conditional check, where:
“Active” status is shown in green
Other statuses are shown in blue
This approach keeps the UI dynamic, readable, and easy to scale, as adding more logs only requires adding new objects to the list without changing the UI structure.

3.3 - Use of Classes and List Iteration
Classes are used to organize the log related data in a structured way.The Log class acts as a blueprint that defines what information each log entry should contain, such as the action performed, the timestamp, and the current status. This makes the data easier to manage, understand, and reuse.
List iteration was used to render multiple widgets efficiently.Instead of creating separate widgets for each log entry, all Log objects were stored inside a List<Log>. The list is then traversed using a loop (map()), and for each log object, a corresponding Text widget is generated dynamically.
The final log details were stored and displayed as a formatted string.


Session 4 – Flutter UI and Widgets

4.1 - The main concepts covered include:
1) Widgets: In Flutter, everything is a widget. Text, buttons, icons, padding, layout, and even the full screen are all widgets.
2) Widget Tree: Flutter UI is built using a tree structure where widgets are placed inside other widgets.
3) StatelessWidget: Used when the UI does not change. Once built, the UI remains the same.
4) StatefulWidget: Used when the UI needs to change during runtime, such as when a button is pressed or text is entered.
5) State and setState(): State is the data that affects UI. When the state changes, setState() is used to rebuild the UI.
6) Scaffold: Provides the basic structure of a screen such as AppBar and body.
7) AppBar: The top bar of the screen used to show the title.
8) Layout Widgets:
   i) Column: Places widgets one below the other.
  ii) Row: Places widgets side by side.
 iii) SizedBox: Used to give space between widgets.

4.2 - Stateless and Stateful
Flutter separates UI into two main widget types to improve performance and control updates.

1) StatelessWidget is used when the UI does not change after it is rendered.
2) StatefulWidget is used when the UI needs to update dynamically, such as reading user input from text fields or responding to button clicks.
3) setState() is used inside a StatefulWidget to notify Flutter that data has changed and the UI should rebuild.

4.3 - Code Implementation

A Scaffold, used to create the basic structure of the HomeScreen.
An AppBar at the top of the screen.
The dashboard content was placed inside the body of the Scaffold.
A SingleChildScrollView is used to allow scrolling when multiple containers are present.
Scrolling also helps prevent overflow on smaller screen sizes.
A Column widget is used to arrange all UI elements vertically.
Multiple Container widgets, used like small boxes to display user information.
Padding and spacing were applied to make the layout clean and readable.
(screenshots)- ![session4](https://github.com/user-attachments/assets/7b222982-b9bd-45b7-86b9-2fc4c56c95b3)


Session 5 - Flutter Layouts 

5.1 - Concepts 

Flutter Layout System works on the rule:
   Parent sets constraints → Child chooses size → Parent places the child.
Layout widgets control how UI elements are arranged, spaced, and sized.
1) Column is used to arrange widgets vertically from top to bottom.
2) Row is used to arrange widgets horizontally side by side.
3) Container is used for styling and layout control such as color, size, padding, and border radius.
4) Padding is used to add space inside widgets so content does not touch screen edges.
5) GridView is used to create multi-column layouts and scrollable dashboards. GridView is commonly used for home screens and dashboards in real apps.
Flutter supports data-driven UI. These layout concepts help in building responsive and professional UI screens.

5.2 - Code Implementation 

Cyberlog Dashboard:
A Scaffold, used to create the main structure of the dashboard screen.
An AppBar to addthe title CyberLog Dashboard.
A GridView.count widget to display items in a two-column layout.
A list of dashboard titlesto represent different features such as Daily Log, Cyber Tips, Device Security, and Notes.
A Container widget was used for each card to apply styling.
BoxDecoration was used to add background color and rounded corners.
A Column inside each card was used to place the icon and text vertically.
(screenshots)- ![session5](https://github.com/user-attachments/assets/39aec036-49ac-431b-ac08-cd275df7cf14)

Session 6 - Navigation

6.1 - Overview of few main concepts.

Navigation in Flutter (and mobile apps) means moving between different screens in an app. Navigation controls how a user goes from one screen to another and back again.

Flutter apps consist of multiple screens connected through navigation.
Flutter uses a Navigator system to control how screens move inside the app.
Navigation is based on a stack data structure that follows Last-In-First-Out (LIFO).

1) Navigator.push() opens a new screen and places it on top of the navigation stack.
2) Navigator.pop() removes the current screen and returns to the previous screen.
3) MaterialPageRoute defines how a new screen is created and controls the transition animation between screens.
4) The context helps Flutter identify which Navigator handles the navigation action.
5) BottomNavigationBar switches between main app sections like Home, Logs, and Settings. Bottom navigation works by changing an index value instead of using push and pop.
6) Named routes provide a centralized, organized way to manage navigation. It improves readability, scalability, and structure in larger applications.

6.2 - Code Implementation

6.2.1 - Bottom Navigation:
BottomNavigationBar is used to navigate between main sections of the app.
The app contains three main screens: Home, Logs, and Settings.
A StatefulWidget manages navigation state.
An integer variable currentIndex tracks the selected tab.
A List<Widget> stores the three screen widgets.
The Scaffold body displays the selected screen using: body: screens[currentIndex]
When a navigation icon is tapped, onTap updates currentIndex.
setState() rebuilds the UI and switches the screen instantly.

6.2.2 - Screens and UI of the app:
1) Home Screen:
The Home screen is the main dashboard of the app.
It uses GridView.count to display a 2 - column layout.
Each grid item is created using a Container. Icons and text are placed using a Column to keep them centered.
BoxShadow is used on the container to give a glowing look.
2) Logs Screen
The Logs screen shows activity messages in a list.
A List<String> is used to store the log data.
ListView.builder is used to display the list so it can scroll.
ListTile is used because it already provides a clean row layout with icon and text.
3) Settings Screen
The Settings screen options like account and privacy.
A Column is used to arrange all items vertically. A Row is used at the top to show the user icon and name.
settingsTile, a helper method is used to reuse the same ListTile design as in the Logscreen
4) ThemeData 
ThemeData is used to apply same colors across the app.
It is to control the background color, AppBar color, and bottom navigation colors.

(screenshots)- ![session6(3)](https://github.com/user-attachments/assets/bc6bef8a-e2bb-4d08-9682-f8846c56699b)
![session6(2)](https://github.com/user-attachments/assets/c7f528bc-f794-4be3-bc7c-9463fc16686f)
![session6(1)](https://github.com/user-attachments/assets/070247df-13d5-4058-a518-1feab6966c50)


Session 7 - Provider State Management

---

7.1 - What is Provider in State Management?

Need of state management
* Mobile apps must remember changing data like counters, logs, settings, and user actions.
* This changing data is called state
* Flutter rebuilds UI frequently, so state must be handled carefully.
* Poor state handling causes UI resets, lost data, and inconsistent behavior.

What is Provider?
* Provider is a Flutter state management library.
* It stores state outside the UI.
* It shares state across multiple widgets.
* It automatically rebuilds UI when data changes.

Core Concepts of Provider
* ChangeNotifier A class that holds state and notifies the UI when state changes.
* notifyListeners(): Tells Flutter to rebuild widgets that are listening to the state.
* ChangeNotifierProvider: Makes the state available to widgets below it in the widget tree.
* MultiProvider: Used when the app has more than one provider.

Why Provider Over setState?
* setState works only inside one widget.
* Provider allows state sharing across screens.
* Provider scales better for real-world apps.

7.2 - Portfolio Assignment – CyberLog Implementation

Provider Setup
* MultiProvider is used to manage multiple states.
* LogsProvider manages user activity logs.
* SettingsProvider manages app settings.
LogsProvider
* Stores logs in a List<String>.
* addLog() method adds new logs dynamically.
* notifyListeners() updates the Logs screen automatically.
SettingsProvider
* Manages settings like Notifications, Privacy, and Dark Mode.
* Each setting is stored as a boolean.
* When a setting is toggled, a log entry is added.
* notifyListeners() refreshes the Settings UI.
Runtime Interaction Between Settings and Logs
* When a user enables or disables a setting:
  * The setting state changes.
  * A corresponding log is added (example: "Notifications disabled").
  * Logs screen updates instantly.
* This demonstrates real-time state management using Provider.
Bottom Navigation
* setState is used only to switch tabs.
* App data (logs and settings) is managed using Provider.

7.3 - Key Learning

* Provider is created once at the top of the app.
* State is accessed anywhere without passing data manually.
* UI updates automatically when state changes.

(screenshots) :
![session7(6)](https://github.com/user-attachments/assets/1ce64086-0994-4f7b-a107-423b461cd2be)
![session7(5)](https://github.com/user-attachments/assets/3487643e-a028-4061-bd70-6e5bbec3a8f8)
![session7(4)](https://github.com/user-attachments/assets/925cca8d-1c5f-48de-bd87-0fa92ea6aec6)
![session7(3)](https://github.com/user-attachments/assets/7c15e3a7-ec0f-49d3-a96a-2b1f2ffae791)
![session7(2)](https://github.com/user-attachments/assets/5f2f77cc-62c4-4dad-9557-f22547ff2d38)
![session7(1)](https://github.com/user-attachments/assets/8e745496-2f01-4c89-8a0c-e842d20c3f6b)


## Session 8 – Working with APIs in Flutter

### 1. Why APIs Are Important
- Apps containing only static UI, local logic, and fixed content are not realtime
- Real-world apps do not work in isolation
- Real apps fetch live data, update content dynamically, and communicate with servers
- APIs help transform a Flutter app from a UI-only app into a real, data-driven application

---

### 2. Client–Server Architecture
Every modern app has two main parts:
- **Client (Flutter App):** Handles UI, user interaction, and data display
- **Server (API):** Handles data storage, processing, and logic

Flow:
- The Flutter app sends a request to the server
- The server sends back a response
- The app reads the data and displays it on the screen

---

### 3. What Is an API
- API stands for **Application Programming Interface**
- In simple terms, an API allows apps to talk to other apps
- An API works like a middleman between the app and the server

Common examples:
- Weather apps use Weather APIs
- Social media apps use platform APIs
- Cybersecurity apps use threat intelligence APIs

---

### 4. HTTP Basics
- HTTP is the protocol used to send and receive data over the internet
- Flutter apps use HTTP to communicate with APIs

Common HTTP methods:
- **GET:** Fetch data from the server
- **POST:** Send data to the server
- **PUT:** Update existing data
- **DELETE:** Remove data

---

### 5. Using HTTP in Flutter
- Flutter does not access the internet by default
- The `http` package is used to make network requests

Steps followed:
- Add http dependency in `pubspec.yaml`
- Run `flutter pub get`
- Import the package using  
  `import 'package:http/http.dart' as http;`

---

### 6. JSON Data Format
- Most APIs return data in JSON format
- JSON is structured key–value data
- In Dart, JSON is converted into a `Map<String, dynamic>`
- Values are accessed using keys, for example: `json['fact']`

---

### 7. Model Classes
- Using raw JSON directly makes code messy and hard to manage
- Model classes represent structured data in Dart
- A model class converts JSON into a Dart object
- This improves code readability, reduces bugs, and keeps UI clean
- Model classes follow industry-standard practices

---

### 8. API Call Flow
- Button press triggers an async function
- An HTTP GET request is sent to the server
- The server sends a response
- JSON data is decoded
- UI updates using `setState()`

---

### 9. Async Programming
- API calls take time to complete
- `async` and `await` prevent the UI from freezing
- `Future` handles operations that complete later
- UI updates only after data is received

----
### Code Implementation – Cyber Tip of the Day (API Integration)

This implementation shows how an API is used in the CyberLog app to fetch live data from the internet and display it on the screen.

---

#### StatefulWidget and Data Storage
- The screen is created using a `StatefulWidget` because the data on the screen changes after the API call.
- A String variable `cyberTip` is used to store the text shown in the UI.
- Initially, the variable contains a message asking the user to press the button.

---

#### Fetching Data from an API
- The function `fetchTip()` is used to fetch data from the API.
- The function is marked `async` because internet calls take time.
- `await` is used so the app waits for the response without freezing the UI.
- `http.get()` sends a GET request to the API URL.
- The API response is in JSON format.

---

#### JSON Decoding and Data Access
- `json.decode(response.body)` converts the JSON response into a Dart Map.
- The required data is accessed using keys:
  - `data['slip']['advice']`
- The fetched advice is stored in the `cyberTip` variable.
- `setState()` is used to update the UI with the new data.

---

#### User Interface Overview
- `Scaffold` provides the basic screen structure.
- `AppBar` displays the title **CyberLog Dashboard**.
- A centered `Column` is used to arrange UI elements vertically.
- A `Container` displays the cyber tip card:
  - Icon for visual context
  - Title text
  - Dynamic text fetched from the API
- An `ElevatedButton` triggers the API call.
- On button press, `fetchTip()` executes and updates the UI instantly.

---

#### Result
- Live data is fetched from the internet.
- The UI updates dynamically when the button is pressed.
- The app demonstrates real-world API usage using HTTP and JSON.
- This feature makes the CyberLog app data-driven instead of static.

----
(screenshots)
![session8](https://github.com/user-attachments/assets/23853cb0-85c9-42b2-ab74-df1fefafa94d)
![session8(3)](https://github.com/user-attachments/assets/7da8e962-b7a8-466d-948c-51dd628cfe84)
![session8(2)](https://github.com/user-attachments/assets/cc2014dd-2fbd-4eba-8de2-d6db23f27f79)

