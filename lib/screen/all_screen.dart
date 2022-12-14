import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/class_model/politics_dart.dart';
import 'package:news_app/screen/description_screen.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}
class _AllState extends State<All> {

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    const String url = "https://gist.githubusercontent.com/DavronBazarov/2e23f82d0a0c7c592c9b1dc3ce701ccb/raw/87c9c2373749fa89d1061327aa031ed0a98eb89c/gistfile1.txt";
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    print(response.body);
    if (body is List) {
      return body.map((e) => Autogenerated.fromJson(e)).toList();
    } else {
      return [].cast<Autogenerated>();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Autogenerated> data = snapshot.data!;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                return buildItems(title: data[index].title, image: data[index].image, description: data[index].description, time: data[index].date);
              });
        },
      ),
    );
  }

  Widget buildItems({String? title, image, description, time,}  ) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  Description(title!, image, description)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: const EdgeInsets.only(left: 4, top: 4),
            color: Colors.white,
            height: 130,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.network(image, fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      width: 225,
                      child: Column(
                        children: [
                          Text(
                            title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(time),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: Colors.black,
                                    height: 15,
                                    width: 1.5,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Sport"),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.save_alt),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
