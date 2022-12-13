import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/product_model.dart';

class CartItemWidget extends StatelessWidget {
  CartItemWidget(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(bottom: 12.h),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 66.r,
                height: 66.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: MyColors.cat1Color,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '137 Grams',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '\$ ${controller.productSubtotal[index]}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: MyColors.mainColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: (){
                  controller.removeProduct(product);
                },
                child: Container(
                  width: 33.r,
                  height: 33.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: MyColors.cat2Color,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/minus_icon.svg',
                      width: 23.w,
                      color: Color(0xff49B7DA),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                '$quantity',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                width: 8.w,
              ),
              InkWell(
                onTap: (){
                  controller.addProduct(product);
                },
                child: Container(
                  width: 33.r,
                  height: 33.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: MyColors.cat2Color,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/add_icon.svg',
                      color: Color(0xff49B7DA),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
