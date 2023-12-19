import 'package:app_musica/model/Musica.dart';
import 'package:app_musica/utils/storage/control_session.dart';
import 'package:app_musica/utils/storage/storage_constants.dart';
import 'package:app_musica/view/edicao_musica.dart';
import 'package:app_musica/widgets/barra_menu.dart';
import 'package:flutter/material.dart';

class MusicasListView extends StatefulWidget {
  const MusicasListView({super.key});

  @override
  State<MusicasListView> createState() => _MusicasListViewState();
}

class _MusicasListViewState extends State<MusicasListView> {
  List<Musica> _musicas = [];
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
                  MaterialPageRoute(
                      builder: (context) => const EdicaoMusicaView()),
                );
              },
              child: Text("Nova Musica")),
          Expanded(
            child: ListView.builder(
              itemCount: _musicas.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Row(
                    children: [
                      Text(
                        _musicas[index].titulo.toString(),
                      ),
                    ],
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
    List<Musica>? musicas =
        await ControlSession.internal().get(StorageConstants().MUSICAS);
    setState(() {
      _musicas = musicas ?? [];
    });
  }
}
