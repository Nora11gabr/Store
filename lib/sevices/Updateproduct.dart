import 'package:store/helper/api.dart';

import '../models/productmodel.dart';

class UpdateProduct {
  Future<ProductModel> updateproduct(
      {required String title,
      required dynamic price,
      required String desc,
      required String image,
      required dynamic id,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().put(URL: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(data);
  }
}
