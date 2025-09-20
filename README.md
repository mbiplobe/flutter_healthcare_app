## flutter_healthcare_app 
This application is designed to provide healthcare-related services. It originated as a fork of the Flutter Healthcare App and has since been extensively restructured and redesigned. While the initial project served as a benchmark reference, significant improvements and modifications have been introduced to enhance functionality, maintainability, and scalability.
Originally developed using a simple Model-View (MV) architecture, the project has now been migrated to a more robust Model-View-ViewModel (MVVM) architecture. This transition ensures better separation of concerns, improved testability, and easier code maintenance.
The primary focus of this project is to deliver a modern, efficient, and well-structured healthcare service platform built with Flutter, while maintaining flexibility for future growth and feature expansion.
## Android Screenshots

  HomePage                 |    Detail Page        
:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_healthcare_app/blob/master/screenshots/screenshot_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_healthcare_app/blob/master/screenshots/screenshot_2.jpg?raw=true)

## iOS Screenshots
  HomePage                 |    Detail Page      
:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_healthcare_app/blob/master/screenshots/screenshot_ios_1.png?raw=true)|![](https://github.com/TheAlphamerc/flutter_healthcare_app/blob/master/screenshots/screenshot_ios_2.png?raw=true)

## Directory Structure
```
|-- lib
|   |-- main.dart
|   '-- src
|       |-- config
|       |   '-- route.dart
|       |-- model
|       |   |-- dactor_model.dart
|       |   '-- data.dart
|       |-- pages
|       |   |-- detail_page.dart
|       |   |-- home_page.dart
|       |   '-- splash_page.dart
|       |-- theme
|       |   |-- extention.dart
|       |   |-- light_color.dart
|       |   |-- text_styles.dart
|       |   '-- theme.dart
|       '-- widgets
|           |-- coustom_route.dart
|           |-- progress_widget.dart
|           '-- rating_start.dart
|           
|-- pubspec.yaml
|-- screenshots
|   |-- HealthcareMobileApp.png
|   |-- screenshot_1.jpg
|   |-- screenshot_2.jpg
|   |-- screenshot_ios_1.png
|   '-- screenshot_ios_2.png
'-- test
    '-- widget_test.dart
```
## Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request.



