import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class CategoriesServies {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categorieName}) async {
    http.Response response = await http.get(Uri.parse(
        "https://fakestoreapi.com/products/category/:$categorieName"));

    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(data[i]);
    }
    return productsList;
  }
}
