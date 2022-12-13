import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controllers/cart_controller.dart';

import 'package:flutter_demo_task/controllers/home_controller.dart';
import 'package:flutter_demo_task/models/product_model.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {Key? key,
      required this.product,
      required this.index,
      required this.controller})
      : super(key: key);
  final Product product;
  final index;

  final HomeController controller;
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 12,
      ),
      height: 90.h,
      width: Get.width * 0.8,
      child: Row(
        children: [
          Container(
            height: 90.w,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: MyColors.deal1Color,
            ),
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -5,
                  left: -5,
                  child: Container(
                    height: 24.w,
                    width: 24.w,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.changFavouriteStatus(index);
                      },
                      icon: Icon(
                        (product.favorite!)
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_sharp,
                        color: (product.favorite!)
                            ? MyColors.mainColor
                            : MyColors.inActiveColor,
                      ),
                      iconSize: 12.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
              child: Column(
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
                    'peices ${product.numPeices!}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_icon.svg',
                        width: 6.w,
                        height: 8.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '${product.distance} min away',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '\$ ${product.price!}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: MyColors.mainColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          '\$ 50',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(decoration: TextDecoration.lineThrough,),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Obx(()=>IconButton(
                          onPressed: () {
                            cartController.addProductFromHome(product);
                          },
                          icon: Icon(
                            (cartController.products.containsKey(product))?Icons.remove_shopping_cart:Icons.add_shopping_cart,
                            color: (cartController.products.containsKey(product))
                                ? MyColors.mainColor
                                : Colors.greenAccent,
                          ),
                          iconSize: 18.w,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
