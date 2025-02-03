import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.indigo),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
          bodyMedium: const TextStyle(fontSize: 16),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,  // Fill the input field with a color
          fillColor: Colors.white,  // Set the background to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.teal, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2),
          ),
          labelStyle: TextStyle(color: Colors.teal),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: LoginPage(),
    );
  }
}
