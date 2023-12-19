import 'dart:convert';

import 'package:app_musica/model/Musica.dart';
import 'package:app_musica/utils/storage/control_session.dart';
import 'package:app_musica/utils/storage/storage_constants.dart';
import 'package:app_musica/widgets/barra_menu.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class EdicaoMusicaView extends StatefulWidget {
  const EdicaoMusicaView({super.key});

  @override
  State<EdicaoMusicaView> createState() => _EdicaoMusicaViewState();
}

class _EdicaoMusicaViewState extends State<EdicaoMusicaView> {
  String textoEscrito = '';
  String titulo = '';
  bool barraN = false;
  bool barraRetaDoisPontos = false;
  String cifras =
      " A | A# | B | C | D | E | F | G | m | Am | Bm | Cm | Dm | Em | Fm | Gm | b | # | 7 | + | - | C# | D# | Eb | F# | Ab | Bb ";
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerMusica = TextEditingController();

  @override
  void initState() {
    controllerMusica = RichTextController(
      patternMatchMap: {
        RegExp(
          cifras,
        ): const TextStyle(color: Colors.orange),
        RegExp(
          '|:',
        ): const TextStyle(color: Colors.green),
      },
      onMatch: (List<String> matches) {},
    );
    controllerTitulo = TextEditingController();
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
                  List<Musica> musicas = await ControlSession.internal()
                          .get(StorageConstants().MUSICAS) ??
                      [];
                  // Musica? musica = musicas
                  //     .where((element) => element.titulo == titulo)
                  //     .first;

                  Musica musica = Musica(titulo: titulo, musica: textoEscrito);

                  musicas.add(musica);
                  await ControlSession.internal().set(
                      StorageConstants().MUSICAS,
                      jsonEncode(musicas.toString()));
                },
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('App sem nome do boxa'),
      ),
      body: Column(children: [
        BarraMenu(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.black)),
          child: TextField(
            controller: controllerTitulo,
            style: TextStyle(color: Colors.black),
            decoration: null,
            onChanged: (text) {
              setState(() {
                titulo = text;
              });
            },
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: controllerMusica,
                    style: TextStyle(color: Colors.black),
                    decoration: null,
                    maxLines: null,
                    minLines: null,
                    onChanged: (text) {
                      setState(() {
                        textoEscrito = text;
                        if (textoEscrito.endsWith('\n')) {
                          setState(() {
                            // refrao = true;
                          });
                        }
                        if (textoEscrito.contains('|:')) {}
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white)),
                  height: MediaQuery.of(context).size.height,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: null,
                    controller: controllerMusica,
                    maxLines: null,
                    minLines: null,
                    readOnly: true,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
