import 'package:on_lyric/widgets/app_bar.dart';
import 'package:on_lyric/widgets/barra_menu.dart';
import 'package:flutter/material.dart';

class RepertoriosListView extends StatefulWidget {
  const RepertoriosListView({super.key});

  @override
  State<RepertoriosListView> createState() => _RepertoriosListViewState();
}

class _RepertoriosListViewState extends State<RepertoriosListView> {
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
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {});
                },
                child: Text('Carregar'),
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
                      border: Border.all(color: Colors.black)),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white)),
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
