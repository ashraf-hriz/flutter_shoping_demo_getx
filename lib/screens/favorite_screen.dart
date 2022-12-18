import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/favourite_item.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter custom clipper example"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: 123,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                      Text(
                        'Mostafa st.',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black38,
                    style: BorderStyle.solid,
                  ),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var bRadius = 1.0;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      //..cubicTo(size.width, bRadius, size.width, size.height * 0.6, bRadius, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.6 - bRadius)
      //..cubicTo(size.width , size.height * 0.6 - bRadius, size.width , size.height * 0.6, size.width * 0.75, bRadius)
      ..lineTo(size.width * 0.75, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  var controller = Get.find<HomeController>();

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
              'Favourites',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.favProducts.length,
              itemBuilder: (context, index) {
                return FavouriteItem(
                  product: controller.products[controller.favProducts[index]],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
