import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/detail_page.dart';
import 'package:furniture_app/utils/home_page.dart';

import 'Screens/cart_page.dart';
import 'Screens/home_photo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MainPage(),
        'home_page': (context) => HomePage(),
        'detail_page': (context) => Detail_Scereen(),
        'cart_page': (context) => Cart_Page(),
      },
    ),
  );
}
