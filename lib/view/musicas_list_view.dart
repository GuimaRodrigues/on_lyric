import 'dart:convert';

import 'package:on_lyric/model/Musica.dart';
import 'package:on_lyric/utils/storage/control_session.dart';
import 'package:on_lyric/utils/storage/storage_constants.dart';
import 'package:on_lyric/view/edicao_musica.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';

class MusicasListView extends StatefulWidget {
  const MusicasListView({super.key});

  @override
  State<MusicasListView> createState() => _MusicasListViewState();
}

class _MusicasListViewState extends State<MusicasListView> {
  List _musicas = [];
  @override
  void initState() {
    carregarMusicas();

    super.initState();
  }

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
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EdicaoMusicaView()),
                );
              },
              child: Text("Nova Musica")),
          Expanded(
            child: ListView.builder(
              itemCount: _musicas.length,
              itemBuilder: (_, index) {
                return ElevatedButton(
                  onPressed: () {
                    _musicas[index];
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EdicaoMusicaView(
                              titulo: _musicas[index].titulo,
                              textoEscrito: _musicas[index].escrita)),
                    );
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          _musicas[index].titulo.toString(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  carregarMusicas() async {
    dynamic musicasJson =
        await ControlSession.internal().get(StorageConstants().MUSICAS);
    List<Musica> musicas = [];
    musicasJson?.forEach((element) {
      musicas
          .add(Musica(titulo: element['titulo'], escrita: element['escrita']));
    });

    setState(() {
      _musicas = musicas;
    });
  }
}
