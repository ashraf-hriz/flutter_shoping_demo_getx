import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_demo_task/widgets/cart_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text(
              'Cart',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),

          Obx(()=> ListView.builder(
            shrinkWrap: true,
            itemCount: cartController.products.length,
            itemBuilder: (context, index) {
              return CartItemWidget(controller: cartController,
                product: cartController.products.keys.toList()[index],
                quantity: cartController.products.values.toList()[index],
                index: index,);
            },
          ),),

        ],
      ),
    );
  }
}
