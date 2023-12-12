import 'package:flutter/material.dart';
import 'phone_book.dart';

void main() {
  runApp(PhoneBookApp());
}

class PhoneBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneBook(),
    );
  }
}
