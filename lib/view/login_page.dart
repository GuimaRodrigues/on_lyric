import 'package:app_musica/utils/storage/control_session.dart';
import 'package:app_musica/utils/storage/storage_constants.dart';
import 'package:app_musica/view/home_page_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginAdm = 'admin';
  String senhaAdm = '1234';
  String login = '';
  String senha = '';

  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  void initState() {
    controllerLogin = TextEditingController();
    controllerSenha = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('App sem nome do boxa'),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.black)),
              child: TextField(
                controller: controllerLogin,
                style: TextStyle(color: Colors.black),
                onChanged: (text) {
                  setState(() {});
                },
              ),
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.black)),
              child: TextField(
                controller: controllerSenha,
                style: TextStyle(color: Colors.black),
                onChanged: (text) {
                  setState(() {});
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (controllerSenha.text == senhaAdm &&
                    controllerLogin.text == loginAdm) {
                  await ControlSession.internal()
                      .set(StorageConstants().USUARIO_LOGADO, true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              child: Text('Logar'),
            ),
          ],
        ),
      ),
    );
  }
}
