import 'package:on_lyric/view/musicas_list_view.dart';
import 'package:on_lyric/view/repertorios_list_view.dart';
import 'package:flutter/material.dart';

class BarraMenu extends StatelessWidget {
  const BarraMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lime, border: Border.all(color: Colors.black)),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicasListView(),
                ),
              );
            },
            child: Text('Músicas'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RepertoriosListView(),
                ),
              );
            },
            child: Text('Repertórios'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Minha conta'),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
