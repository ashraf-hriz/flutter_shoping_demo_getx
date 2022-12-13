import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppTheme{
  static ThemeData theme(){
    return ThemeData(
      backgroundColor: MyColors.backgroundColor,
      primaryColor: MyColors.mainColor,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.bold,
          fontSize: 36.sp,
        ),
        headline2: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
        ),
        headline3: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        headline4: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
        headline5: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
        headline6: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
        ),
        bodyText1: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
        ),
        bodyText2: TextStyle(
          color: MyColors.subTitleColor,
          fontWeight: FontWeight.normal,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}