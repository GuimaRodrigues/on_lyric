import 'package:on_lyric/utils/storage/control_session.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class EdicaoRepertorioView extends StatefulWidget {
  const EdicaoRepertorioView({super.key});

  @override
  State<EdicaoRepertorioView> createState() => _EdicaoRepertorioViewState();
}

class _EdicaoRepertorioViewState extends State<EdicaoRepertorioView> {
  String textoEscrito = '';
  bool barraN = false;
  bool barraRetaDoisPontos = false;
  String cifras =
      " A | A# | B | C | D | E | F | G | m | Am | Bm | Cm | Dm | Em | Fm | Gm | b | # | 7 | + | - | C# | D# | Eb | F# | Ab | Bb ";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller = RichTextController(
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
                  await ControlSession.internal().set('musica', textoEscrito);
                },
                child: Text('Salvar'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  String textoSalvo =
                      await ControlSession.internal().get('musica');
                  ;
                  setState(() {
                    textoEscrito = textoSalvo;
                    controller.text = textoEscrito;
                  });
                },
                child: Text('Carregar'),
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
                    controller: controller,
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
                    controller: controller,
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
