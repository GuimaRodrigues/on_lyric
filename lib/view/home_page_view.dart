import 'package:app_musica/utils/storage/control_session.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('App sem nome do boxa'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.lime, border: Border.all(color: Colors.black)),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Músicas'),
                ),
                TextButton(
                  onPressed: () {},
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
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            child: Text("Alguma mensagem motivacional kk"),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
