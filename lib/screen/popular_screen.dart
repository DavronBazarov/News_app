import 'package:flutter/material.dart';



void main() {
  runApp(MyAppUrl());
}

class MyAppUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UrlLauncher'),
        ),
        body: const Center(
         child: Text("Politics"),
          ),
        ),
    );
  }

}