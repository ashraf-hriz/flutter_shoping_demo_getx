import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeadingAppBarWidget extends StatelessWidget {
  const LeadingAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/icons/top_container_icon.svg',
                width: 123.w,
                height: 34.h,
              ),
              Positioned(
                left: 10.w,
                top: 8.h,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location_icon.svg',
                      width: 12.w,
                      height: 16.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Mustafa st.',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 35.r,
            height: 35.r,
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
    );
    /*ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: 123,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );*/
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
