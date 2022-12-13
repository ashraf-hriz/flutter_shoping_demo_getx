import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controllers/cart_controller.dart';
import 'package:flutter_demo_task/controllers/home_controller.dart';
import 'package:flutter_demo_task/repositories/home_repository.dart';
import 'package:flutter_demo_task/screens/cart_screen.dart';
import 'package:flutter_demo_task/screens/favorite_screen.dart';
import 'package:flutter_demo_task/screens/grocary_screen.dart';
import 'package:flutter_demo_task/screens/news_screen.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_demo_task/widgets/location_top_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final pages = [GroceryScreen(), NewsScreen(), FavoriteScreen(), CartScreen()];
  final homeController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: LeadingAppBarWidget(),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => pages[homeController.pageIndex.value],
      ),
      floatingActionButton: PersonalAssetWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: MyColors.navBottomColor,
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigationItem(
                  title: 'Grocery',
                  icon: 'grocery_icon.svg',
                  selected: homeController.pageIndex.value == 0,
                  index: 0,
                ),
                BottomNavigationItem(
                  title: 'News',
                  icon: 'bell_icon.svg',
                  selected: homeController.pageIndex.value == 1,
                  index: 1,
                ),
                SizedBox(
                  width: 40.w,
                ),
                BottomNavigationItem(
                  title: 'Favorite',
                  icon: 'favorite-icon.svg',
                  selected: homeController.pageIndex.value == 2,
                  index: 2,
                ),
                BottomNavigationItem(
                  title: 'Cart',
                  icon: 'wallet_icon.svg',
                  selected: homeController.pageIndex.value == 3,
                  index: 3,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.selected,
      required this.index})
      : super(key: key);

  final String icon;
  final String title;
  final bool selected;
  final int index;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return InkWell(
      onTap: () => homeController.changPageIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40.w,
            child: SvgPicture.asset(
              "assets/icons/$icon",
              color: selected ? MyColors.mainColor : MyColors.inActiveColor,
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 10,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                color: selected ? MyColors.mainColor : MyColors.inActiveColor),
          )
        ],
      ),
    );
  }
}

class PersonalAssetWidget extends StatelessWidget {
   PersonalAssetWidget({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: MyColors.mainColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(7),
          child: FloatingActionButton(
            onPressed: null,
            elevation: 0,
            backgroundColor: MyColors.mainColor,
            child: Stack(
              children: [
               Obx((){
                 return Positioned(
                   left: 10.w,
                   bottom: 25.h,
                   child: Text(
                     '\$ ${cartController.totalPrice}',
                     style: Theme.of(context)
                         .textTheme
                         .bodyText2!
                         .copyWith(color: Colors.white),
                   ),
                 );
               }),
                Positioned(
                  bottom: 10.h,
                  left: 8.w,
                  child: SvgPicture.asset(
                    "assets/icons/center_cart_icon.svg",
                    color: Colors.white,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
