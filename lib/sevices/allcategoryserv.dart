import 'package:store/helper/api.dart';

class allCategoryServices {
  Future<List<dynamic>> getallcatogries() async {
    List<dynamic> data =
        await Api().get(URL: "https://fakestoreapi.com/products/categories");

    return data;
  }
}
