import 'package:flutter/material.dart';
import 'package:store/Screens/UpdateProduct.dart';

import 'package:store/Screens/home.dart';
import 'package:store/sevices/Updateproduct.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProd.id: (context) => UpdateProd(),
      },
      home: HomePage(),
    );
  }
}
