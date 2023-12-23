import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('App sem nome do boxa'),
      ),
      body: Column(
        children: [
          BarraMenu(),
          Spacer(),
          Container(
            alignment: Alignment.center,
            child: Text("Alguma mensagem motivacional kk"),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
