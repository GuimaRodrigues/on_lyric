import 'dart:convert';

import 'package:on_lyric/model/Musica.dart';
import 'package:on_lyric/model/Repertorio.dart';
import 'package:on_lyric/utils/storage/control_session.dart';
import 'package:on_lyric/utils/storage/storage_constants.dart';
import 'package:on_lyric/view/repertorios_list_view.dart';
import 'package:on_lyric/widgets/app_bar.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';

class EdicaoRepertorioView extends StatefulWidget {
  EdicaoRepertorioView({this.repertorio, super.key});

  Repertorio? repertorio;
  @override
  State<EdicaoRepertorioView> createState() => _EdicaoRepertorioViewState();
}

class _EdicaoRepertorioViewState extends State<EdicaoRepertorioView> {
  List<Musica> _musicas = [];
  List<Musica> _musicasRepertorio = [];
  @override
  void initState() {
    carregarMusicas();
    _musicasRepertorio =
        (widget.repertorio == null ? [] : widget.repertorio?.musicas)!;
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
                onPressed: () async {
                  List<dynamic> repertorios = await ControlSession.internal()
                          .get(StorageConstants().REPERTORIOS) ??
                      [];

                  Repertorio repertorio = Repertorio(
                      musicas: _musicasRepertorio, titulo: "Repertorio");

                  repertorios.add(repertorio.toJson());
                  print(repertorio);
                  print(repertorios);
                  await ControlSession.internal().set(
                      StorageConstants().REPERTORIOS, jsonEncode(repertorios));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RepertoriosListView()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
      appBar: OnLyricAppBar(),
      body: Column(children: [
        BarraMenu(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Container(child: Text('Minhas musicas')),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _musicas.length,
                          itemBuilder: (_, index) {
                            return TextButton(
                              style:
                                  ButtonStyle(alignment: Alignment.centerLeft),
                              onPressed: () {
                                adicionarMusicasRepertorio(_musicas[index]);
                              },
                              child: Text(_musicas[index].titulo.toString()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(child: Text('Musicas do repertorio')),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _musicasRepertorio?.length,
                          itemBuilder: (_, index) {
                            return TextButton(
                              style:
                                  ButtonStyle(alignment: Alignment.centerLeft),
                              onPressed: () {
                                removerMusicasRepertorio(
                                    _musicasRepertorio[index]);
                              },
                              child: Text(
                                  _musicasRepertorio[index].titulo.toString()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
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

  adicionarMusicasRepertorio(Musica musica) {
    if (!_musicasRepertorio.contains(musica)) {
      _musicasRepertorio.add(musica);
    }

    setState(() {});
  }

  removerMusicasRepertorio(Musica musica) {
    if (_musicasRepertorio.contains(musica)) {
      _musicasRepertorio.remove(musica);
    }

    setState(() {});
  }
}
