import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controllers/home_controller.dart';
import 'package:flutter_demo_task/screens/home_screen.dart';
import 'package:flutter_demo_task/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_demo_task/get_di.dart' as di;
void main() async{

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 790),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(),
          home: HomeScreen(),
        );
      },
    );
  }
}
