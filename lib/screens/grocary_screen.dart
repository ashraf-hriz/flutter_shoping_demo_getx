import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_demo_task/widgets/address_widget.dart';
import 'package:flutter_demo_task/widgets/category_widget.dart';
import 'package:flutter_demo_task/widgets/footer_widget.dart';
import 'package:flutter_demo_task/widgets/product_widget.dart';
import 'package:flutter_demo_task/widgets/text_feild_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: ListView(
        shrinkWrap: true,
        children: [
          TextFieldWidget(),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddressWidget(
                title: 'Home Address',
                subTitle: 'Mostafa street No.2 street x12',
              ),
              AddressWidget(
                title: 'Work Address',
                subTitle: 'Mostafa street No.2 street x12',
              ),
            ],
          ).paddingSymmetric(horizontal: 12),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore by category',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'See All(53)',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 10),
              ),
            ],
          ).marginSymmetric(horizontal: 12, vertical: 14),
          Obx(
            () {
              print('loadval ${homeController.categoryLoading.value}');
              return (!homeController.categoryLoading.value)
                  ? SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.categories.length,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                            category: homeController.categories[index],
                          );
                        },
                      ),
                    )
                  : Container();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deals of the day',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ).marginSymmetric(horizontal: 12, vertical: 14),
          Obx(
            () {
              print('loadval ${homeController.categoryLoading.value}');
              return (!homeController.productLoading.value)
                  ? SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ProductWidget(
                                product: homeController.products[index],
                                index: index,
                                controller: homeController,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Container();
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          FooterWidget(),
        ],
      ),
    );
  }
}
