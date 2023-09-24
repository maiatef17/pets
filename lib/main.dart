import 'package:flutter/material.dart';
import 'package:pets_app/presentations/pages/form_page.dart';
import 'package:pets_app/presentations/pages/pets_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: petsPage(),
    );
  }
}
