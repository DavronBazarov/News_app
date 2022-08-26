import 'package:flutter/material.dart';
import 'package:news_app/screen/all_screen.dart';
import 'package:news_app/screen/description_screen.dart';
import 'package:news_app/screen/my_news.dart';
import 'package:news_app/screen/popular_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.09,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            "assets/ic_logo.png",
            height: 40,
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 28,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                  size: 28,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.black,size: 28,)),
          ],
   bottom: const TabBar(
     indicatorColor: Colors.red,
     tabs: [
       Tab(child: Text("All"),),
       Tab(child: Text("Football"),),
       Tab(child: Text("Politics"),),
       Tab(child: Text("LIve"),),
   ],),
        ),
        body:  TabBarView(children: [
            All(),
            MyNews(),
            MyAppUrl(),
            Description("", "", ""),
          ]),
        
      ),
    );
  }
}
