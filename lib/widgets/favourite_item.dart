import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controllers/home_controller.dart';
import 'package:flutter_demo_task/models/product_model.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class FavouriteItem extends StatelessWidget {
   FavouriteItem({Key? key,required this.product,}) : super(key: key);

  final Product product;


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
                    '\$ ${product.price}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: MyColors.mainColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
