import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              image: DecorationImage(
                image:NetworkImage
                  ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWom1sPogoUjGO6VShJ16ASIMle1P8wSFM3Q&usqp=CAU"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 220,
            child: CircleAvatar(
              backgroundColor: Colors.white54,
              radius: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('home_page');
                },
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
