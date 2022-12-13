import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 131.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.cat4Color,
      ),
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mega',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: MyColors.mainColor),
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(letterSpacing: 0),
                  children: [
                    TextSpan(
                      text: 'WHOP',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Color(0xff21114B),
                          fontSize: 31.sp,
                          letterSpacing: 1.5),
                    ),
                    TextSpan(
                      text: 'P',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Color(0xff21114B),
                          fontSize: 31.sp,
                          letterSpacing: -10),
                    ),
                    TextSpan(
                      text: 'E',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: MyColors.mainColor,
                            fontSize: 31.sp,
                          ),
                    ),
                    TextSpan(
                      text: 'R',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Color(0xff21114B),
                            fontSize: 31.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 60.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '\$ 17',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: MyColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  '\$ 50',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.white,
                      fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
