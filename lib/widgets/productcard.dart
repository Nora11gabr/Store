import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Screens/UpdateProduct.dart';
import 'package:store/models/productmodel.dart';
import 'package:store/sevices/Updateproduct.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProd.id, arguments: product);
      },
      child: Center(
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10))
            ]),
            height: 130,
            width: 210,
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.title.substring(0, 6),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price}',
                          style: TextStyle(color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.heart))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            right: 30,
            child: Container(
              child: Image(
                  width: 100, height: 100, image: NetworkImage(product.image)),
            ),
          )
        ]),
      ),
    );
  }
}
