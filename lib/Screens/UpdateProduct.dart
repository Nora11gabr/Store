import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/productmodel.dart';
import 'package:store/sevices/Updateproduct.dart';
import 'package:store/widgets/Button.dart';
import 'package:store/widgets/textfield.dart';

class UpdateProd extends StatefulWidget {
  UpdateProd({super.key});
  static String id = 'UpdateProduct';

  @override
  State<UpdateProd> createState() => _UpdateProdState();
}

class _UpdateProdState extends State<UpdateProd> {
  bool isloading = false;

  String? desc, Pname, img;

  String? Price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customtextfeild(
                  onChanged: (data) {
                    Pname = data;
                  },
                  hinttext: 'Product Name',
                ),
                SizedBox(
                  height: 10,
                ),
                customtextfeild(
                    onChanged: (data) {
                      Price = data;
                    },
                    inputType: TextInputType.number,
                    hinttext: 'Price'),
                SizedBox(
                  height: 10,
                ),
                customtextfeild(
                    onChanged: (data) {
                      desc = data;
                    },
                    hinttext: 'description'),
                SizedBox(
                  height: 10,
                ),
                customtextfeild(
                    onChanged: (data) {
                      img = data;
                    },
                    hinttext: 'Image'),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                    ontap: () async {
                      isloading = true;
                      setState(() {});

                      try {
                        await Updatepro(product);
                      } catch (e) {
                        print(e.toString());
                      }
                      isloading = false;
                      setState(() {});
                    },
                    tex: 'Update')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Updatepro(ProductModel product) async {
    await UpdateProduct().updateproduct(
        id: product.id,
        title: Pname == null ? product.title : Pname!,
        price: Price == null ? product.price.toString() : Price!,
        desc: desc == null ? product.description : desc!,
        image: img == null ? product.image : img!,
        category: product.category);
  }
}
