import 'package:flutter/cupertino.dart';

class MyNews extends StatefulWidget {
  const MyNews({Key? key}) : super(key: key);

  @override
  State<MyNews> createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("My News"),);
  }
}
