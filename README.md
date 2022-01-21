[![Codemagic build status](https://api.codemagic.io/apps/6007c4971b08f3debda1f9e5/6007c4971b08f3debda1f9e4/status_badge.svg)](https://codemagic.io/apps/6007c4971b08f3debda1f9e5/6007c4971b08f3debda1f9e4/latest_build)

# Maka Shop Readme

## Getting Started

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://bitbucket.org/seadvocacy/drohealth-flutter
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor`
-> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add
the following patterns:

```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## App Features:

* Inventory
* LiveShow

### Common Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio) (For making http requests)
* [Bloc](https://pub.dev/packages/bloc) (State Management)
* [Flutter Bloc](https://pub.dev/packages/flutter_bloc) (to connect the reactive data of your
  application with the UI)
* [Dependency Injection](https://pub.dev/packages/get_it) (GetIt)

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we are using in this project

```
lib/
|- core/
|- features/
|- ui/
|- main.dart
|- injector_container.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- Core - Contains classes that are reused across the entire application, including our utils
2- features - This project follows the package by feature structure so each feature in the application
such as inventory for example is categorized into its own feature package to ensure its easier to maintain 
without having to touch other features in the application.
3 - UI - contains certain UI elements such as colors and the font mechanisms used across the application.
4 - main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Main

This is the starting point of the application. All the application level configurations are defined
in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:boilerplate/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(App());
  });
}
```

### Coding Guidelines


