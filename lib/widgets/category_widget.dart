import 'package:flutter/material.dart';
import 'package:flutter_demo_task/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 56.w,
            width: 56.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.cat1Color,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            category.name!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 10.sp,
                  color: MyColors.subTitleColor,
                ),
          ),
        ],
      ),
    );
  }
}
