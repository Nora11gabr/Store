import 'package:store/helper/api.dart';

import '../models/productmodel.dart';

class AllProductServices {
  Future<List<ProductModel>> GetAllProducts() async {
    List<dynamic> data =
        await Api().get(URL: "https://fakestoreapi.com/products");
    List<ProductModel> ProductList = [];
    for (var i = 0; i < data.length; i++) {
      ProductList.add(ProductModel.fromJson(data[i]));
    }
    return ProductList;
  }
}
