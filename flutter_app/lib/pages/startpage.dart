import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detail_page.dart';

class Startpage extends StatelessWidget {
  const Startpage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(body: Center(child: Column(children: [Row(children: [Text("月曜日一限"),Text("月曜日二限"),Text("月曜日三限"),Text("月曜日四限"),Text("月曜日五限"),Text("月曜日六限")],),
    Row(children: [Text("火曜日一限"),Text("火曜日二限"),Text("火曜日三限"),Text("火曜日四限"),Text("火曜日五限"),Text("火曜日六限")],),
    Row(children: [Text("水曜日一限"),Text("水曜日二限"),Text("水曜日三限"),Text("水曜日四限"),Text("水曜日五限"),Text("水曜日六限")],),
    Row(children: [Text("木曜日一限"),Text("木曜日二限"),Text("木曜日三限"),Text("木曜日四限"),Text("木曜日五限"),Text("木曜日六限")],),
    Row(children: [Text("金曜日一限"),Text("金曜日二限"),Text("金曜日三限"),Text("金曜日四限"),Text("金曜日五限"),Text("金曜日六限")],),
    Row(children: [Text("土曜日一限"),Text("土曜日二限"),Text("土曜日三限"),Text("土曜日四限"),Text("土曜日五限"),Text("土曜日六限")],),
                                                               ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                },
                child: const Text('ボタン'))]),),);
  }
}
