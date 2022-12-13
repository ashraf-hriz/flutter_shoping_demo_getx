import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressWidget extends StatelessWidget {
  final title;
  final subTitle;

  const AddressWidget({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.w,
      height: 49.h,
      alignment: Alignment.center,
      //margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.borderColor),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 6,
        ),
        dense: true,
        visualDensity: VisualDensity(vertical: 2),
        leading: Container(
          width: 45.w,
          height: 40.h,
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.addressColor,
          ),
        ),
        title: Text(
          '$title',
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          '$subTitle',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
