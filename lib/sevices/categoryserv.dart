import 'package:store/helper/api.dart';

import '../models/productmodel.dart';

class CategoryServices {
  Future<List<ProductModel>> Getcategory({required String CategoryName}) async {
    List<dynamic> data = await Api()
        .get(URL: "https://fakestoreapi.com/products/category/$CategoryName");

    List<ProductModel> ProductList = [];
    for (var i = 0; i < data.length; i++) {
      ProductList.add(ProductModel.fromJson(data[i]));
    }
    return ProductList;
  }
}
