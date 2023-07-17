import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/productmodel.dart';
import 'package:store/sevices/allproducts_serv.dart';
import 'package:store/widgets/productcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'New Treand',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().GetAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                padding: EdgeInsets.only(top: 50, right: 16, left: 16),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return ProductCard(product: products[index]);
                }),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
