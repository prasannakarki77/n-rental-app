# N-Rental

## Project Description

N-Rental is a vehicle rental service providing android application. It allows users to rent vehicles such as Car, Bike, Van, and Bus. It consists of different features which assists user with the main task of booking a vehicle for rent. This application is built through an extensive research, prototyping, planning, development and testing process following agile scrum methodology. N-Rental app provides rental service for different kinds of vehicle for any kind of traveling purpose. It allows anyone to book a vehicle for rent from anywhere through the application. With an attractive and responsive UI, N-Rental provide a greater user experience.

### Features

- User Registration and Login
- Advanced search option to search vehicles and filter by vehicle category
- Option to add/remove vehicles to Favorites list
- User can book vehicles for rent, update booking details as well as cancel booking
- Give Ratings and Reviews
- Read articles and blogs featured on the app.
- Sensors used for easy navigation and logout.
- WearOS implementation for connected wearables.

### Technologies Used

- [Flutter](https://flutter.dev/)
  It is a software development kit used to develop cross platform applications. It is used to build and design N-Rental android application. Since, flutter with a single code base, has many useful packages, UI components, hot reload functionality, it has faster code development time which makes it perfect for this project.

  dependencies:

  - flutter:
    - sdk: flutter
  - image_picker: ^0.8.5+3
  - permission_handler: ^9.2.0
  - dio: ^4.0.6
  - json_serializable: ^4.1.4
  - motion_toast: ^2.1.6
  - flutter_svg: ^1.0.3
  - mime: ^1.0.2
  - google_maps_flutter: ^2.1.8
  - shared_preferences: ^2.0.15
  - awesome_notifications: ^0.6.21
  - wear: ^1.1.0
  - fluttertoast: ^8.0.9
  - flutter_rating_bar: ^4.0.1
  - all_sensors2: ^1.0.1
  - shake: ^2.1.0
  - api_cache_manager: ^1.0.2
  - dio_http_cache: ^0.3.0
  - curved_navigation_bar: ^1.0.3

  dev_dependencies:

  - flutter_test:
    - sdk: flutter
  - integration_test:
    - sdk: flutter
  - build_runner: ^2.1.10
  - flutter_lints: ^1.0.0

- [NodeJS](https://nodejs.org/en/)
  It is an opensource development platform for executing JavaScript code server-side. It is used to built REST API for N-Rental. It is very lightweight, fast and scalable which can be beneficial for future works on the app

- [ExpressJS](https://expressjs.com/)
  It is a nodejs web application framework that provides broad features for building web and mobile applications. It's a layer built on the top of the NodeJS that helps manage servers and routes for faster server-side development

- [MongoDB](https://www.mongodb.com/)
  It is a document-oriented NoSQL that stores data as collections and documents consisting of key-value pairs. It is schema-less, flexible, scalable and has dynamic data.

### Project Challenges

Throughout project development, there were various problems and challenges which had to be overcome to build this application. During the UI design process in flutter, the hash size and renderflex overflowed occurred frequently. Incorrect use of parent widget also was a common error. This was fixed either by wrapping the widget by Expanded, SinglechildScrollView or changing the widget height/width. There were Dio errors also while trying to post, put, get, or delete data from database through the API. In some cases of merging the branches in git/GitHub, merge conflict also occurred. So, all these errors, and problems were fixed through debugging and searching for solutions on the internet.

### Future Works

To make N-Rental more effective in providing easy vehicle renting service to users, various additional advancement can be made. For instance, currently the user can book vehicle that are listed in the app by the admin or a management personnel. To expand the userbase, the option to list personal vehicles by user for rent can be added in the future. A GPS tracking system showing the location of rented vehicle could also increase the vehicle’s safety and security

## Project Architecture

![MVVM design pattern](/assets/images/mvvm.jpg)

In this project, MVVM (Model View ViewModel) design pattern is implemented. The MVVM architecture in flutter provides uniform distribution of data with benefits of flexibility and reusability of the code. In this design pattern, the “View Model” is in the center which receives data form the model and provides it to the view. It makes the Model hold the data and view part holds the formatted data with the controller as an interface between them. The “Model” represents the actual data, and the “View” represents the interactive user interface of the application. The MVVM architecture solves a tight coupling issue and ensures easy testability, code sharing and usability in N-Rental application.

## Appendix

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
