import 'package:store_app/helper/api.dart';
import '../models/product_model.dart';

class CategoriesServies {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categorieName}) async {

    List<dynamic> data =await Api().get(url:"https://fakestoreapi.com/products/category/$categorieName" );

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(data[i]);
    }
    return productsList;
  }
}
