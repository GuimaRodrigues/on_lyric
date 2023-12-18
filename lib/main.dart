import 'package:app_musica/home_page.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('alan_bortot');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP que vai bombar em 2029',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
