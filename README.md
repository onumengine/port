# port

An appointment booking app

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

This app creates appointments and sends them to a remote server.

It is built using the BLoC arhitecture with help from the flutter_bloc package and it heavily relies on 
reactive widgets and StreamBuilders.

This app constantly fetches data with the API and populates UI elements, saves data entered by the user
in SharedPreferences to persist it across screens and eventually reads the dat from shared prefs, creates 
a http post request body with it and sends it to the server.

State management for empty and populated screen states is handled well and this app features a datepicker
widget that waas built from scratch by me! Eventually, the date picker will be optimized and coverted to an 
open source widget but for now, it's part of the app.

Hope you like it!
