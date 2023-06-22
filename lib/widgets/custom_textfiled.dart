import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({super.key, this.hintText,this.change,this.isPassword=false,this.inputType});
  String? hintText;
  Function(String)? change;
  bool? isPassword;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:inputType ,
      obscureText: isPassword! ,
      onChanged: change,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
