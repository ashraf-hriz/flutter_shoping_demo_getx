import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeadingAppBarWidget extends StatelessWidget {
  const LeadingAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              /*SvgPicture.asset(
                'assets/icons/top_container_icon.svg',
                width: 123.w,
                height: 34.h,
              ),*/

              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: 133.w,
                  height: 44.h,
                  padding: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(

                    color: Color(0xffEE6B60),
                  ),
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
              ),
             /* Positioned(
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
              ),*/
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
  var bRadius = 20.0;

  @override
  Path getClip(Size size) {
    final path = Path()
      //blew left corner curve
      ..lineTo(0, size.height - bRadius)
      ..quadraticBezierTo(0, size.height, bRadius, size.height)
      //blew right corner curve
      ..lineTo(size.width - bRadius *0.8, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width  , size.height - bRadius *0.8)

      //line segment from right to top
      ..lineTo(size.width , size.height * 0.6 +3)
      ..quadraticBezierTo(
          size.width, size.height * 0.6, size.width - 3, size.height * 0.6 - 3)
      ..lineTo(size.width * 0.75 + 5, 2)
      ..quadraticBezierTo(size.width * 0.75, 0, size.width * 0.75 - 5, 0)

      //top left corner
      ..lineTo(bRadius, 0)
      ..quadraticBezierTo(0, 0,  0,  bRadius)
      //..lineTo(size.width * 0.75, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
