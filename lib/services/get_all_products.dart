import 'package:store_app/helper/api.dart';
import '../models/product_model.dart';

class GetAllProducts {

Future <List<ProductModel>> getAllProducts()async{

  List<dynamic> data=await Api().get(url: "https://fakestoreapi.com/products");

  List<ProductModel> productsList=[];

  for(int i=0;i<data.length;i++){
   productsList.add(data[i]);
  }
return productsList;
 }

}