import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfiled.dart';

import '../services/update_product_service.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen();

  static String id = "UpdateProduc";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image, price;
  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading!,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Update Product", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextFormFiled(
                  change: (data) {
                    productName = data;
                  },
                  hintText: "Product Name",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  change: (data) {
                    desc = data;
                  },
                  hintText: "Description",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  inputType: TextInputType.number,
                  change: (data) {
                    price = data;
                  },
                  hintText: "Price",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  change: (data) {
                    image = data;
                  },
                  hintText: "Image",
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "Update",
                  onTab: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print("success");
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = true;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
   await UpdateProductService().updateProduct(
        id: product.id,
        title: productName != null ? productName! : product.title,
        price: price != null ? price! : product.price.toString(),
        description: desc != null ? desc! : product.description,
        image: image != null ? image! : product.image,
        category: product.category);
  }
}
