import 'package:app_musica/main.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                onPressed: () {
                  storage.setItem('usuario', textoEscrito);
                },
                child: Text('Salvar'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  String textoSalvo = storage.getItem('usuario');
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
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
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
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
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
