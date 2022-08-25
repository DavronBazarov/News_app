import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(

            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: 12),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  color: Colors.green,
                  width: 10,
                ),
              ),
            ),
            child: Column(children: [Text("Samsung Galaxy F22 launched in India")],),);
        }),);
  }

}
