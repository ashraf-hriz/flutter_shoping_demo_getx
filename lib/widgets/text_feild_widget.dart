
import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.textFieldColor,
          prefixIcon:  Icon(Icons.search,color: Theme.of(Get.context!).primaryColor,),
          hintText: 'search in thousands of products',
          contentPadding: const EdgeInsets.only(left: 20,bottom: 5,right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: MyColors.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: MyColors.borderColor),
          ),
        ),
      ),
    );
  }
}
