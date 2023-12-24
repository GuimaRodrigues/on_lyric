import 'dart:convert';

import 'package:on_lyric/model/Musica.dart';
import 'package:on_lyric/utils/storage/control_session.dart';
import 'package:on_lyric/utils/storage/storage_constants.dart';
import 'package:on_lyric/widgets/app_bar.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class EdicaoMusicaView extends StatefulWidget {
  EdicaoMusicaView({super.key, this.titulo = '', this.textoEscrito = ''});
  String textoEscrito;
  String titulo;
  @override
  State<EdicaoMusicaView> createState() => _EdicaoMusicaViewState();
}

class _EdicaoMusicaViewState extends State<EdicaoMusicaView> {
  bool barraN = false;
  bool barraRetaDoisPontos = false;
  String cifras =
      " A | A# | B | C | D | E | F | G | m | Am | Bm | Cm | Dm | Em | Fm | Gm | b | # | 7 | + | - | C# | D# | Eb | F# | Ab | Bb ";
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerMusica = TextEditingController();

  @override
  void initState() {
    controllerMusica = RichTextController(
      text: widget.textoEscrito,
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
    controllerTitulo = TextEditingController(text: widget.titulo);
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
                  List<dynamic> musicas = await ControlSession.internal()
                          .get(StorageConstants().MUSICAS) ??
                      [];
                  // Musica? musica = musicas
                  //     .where((element) => element.titulo == titulo)
                  //     .first;

                  Musica musica = Musica(
                      titulo: widget.titulo, escrita: widget.textoEscrito);

                  musicas.add(musica.toJson());
                  await ControlSession.internal()
                      .set(StorageConstants().MUSICAS, jsonEncode(musicas));
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
        Container(
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.black)),
          child: TextField(
            controller: controllerTitulo,
            style: TextStyle(color: Colors.black),
            decoration: null,
            onChanged: (text) {
              setState(() {
                widget.titulo = text;
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
                        widget.textoEscrito = text;
                        if (widget.textoEscrito.endsWith('\n')) {
                          setState(() {
                            // refrao = true;
                          });
                        }
                        if (widget.textoEscrito.contains('|:')) {}
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
