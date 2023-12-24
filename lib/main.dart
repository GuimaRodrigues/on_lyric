import 'package:on_lyric/utils/storage/control_session.dart';
import 'package:on_lyric/utils/storage/storage_constants.dart';
import 'package:on_lyric/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:on_lyric/view/musicas_list_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnLyric',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: verificarState(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const MusicasListView();
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
