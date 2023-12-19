import 'package:app_musica/utils/storage/control_session.dart';
import 'package:app_musica/utils/storage/storage_constants.dart';
import 'package:app_musica/view/home_page_view.dart';
import 'package:app_musica/view/login_page.dart';
import 'package:flutter/material.dart';

void main() async {
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
      home: FutureBuilder(
        future: verificarState(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }

  verificarState() async {
    return await ControlSession().get(StorageConstants().USUARIO_LOGADO);
  }
}
