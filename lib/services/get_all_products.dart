import 'dart:convert';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProducts {

Future <List<ProductModel>> getAllProducts()async{

  http.Response response=await http.get(Uri.parse("https://fakestoreapi.com/products"));

  List<dynamic> data=jsonDecode(response.body);

  List<ProductModel> productsList=[];

  for(int i=0;i<data.length;i++){
   productsList.add(data[i]);
  }
return productsList;
 }

}