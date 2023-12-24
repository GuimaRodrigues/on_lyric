import 'package:on_lyric/widgets/app_bar.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';

class EdicaoRepertorioView extends StatefulWidget {
  const EdicaoRepertorioView({super.key});

  @override
  State<EdicaoRepertorioView> createState() => _EdicaoRepertorioViewState();
}

class _EdicaoRepertorioViewState extends State<EdicaoRepertorioView> {
  @override
  void initState() {
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
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return TextButton(
                              style:
                                  ButtonStyle(alignment: Alignment.centerLeft),
                              onPressed: () {},
                              child: Text('nome da musica'),
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
                          itemCount: 0,
                          itemBuilder: (_, index) {
                            return TextButton(
                              style:
                                  ButtonStyle(alignment: Alignment.centerLeft),
                              onPressed: () {},
                              child: Text('nome da musica'),
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
}
