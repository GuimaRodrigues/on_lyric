import 'dart:convert';

import 'package:on_lyric/model/Musica.dart';
import 'package:on_lyric/model/Repertorio.dart';
import 'package:on_lyric/utils/storage/control_session.dart';
import 'package:on_lyric/utils/storage/storage_constants.dart';
import 'package:on_lyric/view/edicao_repertorio.view.dart';
import 'package:on_lyric/widgets/app_bar.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';

class RepertoriosListView extends StatefulWidget {
  const RepertoriosListView({super.key});

  @override
  State<RepertoriosListView> createState() => _RepertoriosListViewState();
}

class _RepertoriosListViewState extends State<RepertoriosListView> {
  List<Repertorio> _repertorios = [];
  @override
  void initState() {
    carregarRepertorios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {},
                child: Text('Salvar'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {});
                },
                child: Text('Carregar'),
              ),
            ),
          ],
        ),
      ),
      appBar: OnLyricAppBar(),
      body: Column(
        children: [
          BarraMenu(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EdicaoRepertorioView(),
                ),
              );
            },
            child: Text("Novo repertório"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _repertorios.length,
              itemBuilder: (_, index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EdicaoRepertorioView(
                          repertorio: _repertorios[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          _repertorios[index].titulo.toString(),
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

  carregarRepertorios() async {
    List<dynamic>? repertoriosJson =
        await ControlSession.internal().get(StorageConstants().REPERTORIOS);
    List<Repertorio> repertorios = [];
    List<Musica> musicas = [];

    repertoriosJson?.forEach((element) {
      jsonDecode(element)['musicas'].forEach((musica) {
        musicas.add(Musica.fromMap(musica));
      });
      repertorios.add(
          Repertorio(titulo: jsonDecode(element)['titulo'], musicas: musicas));
      print(repertorios);
    });

    setState(() {
      _repertorios = repertorios;
    });
  }
}
