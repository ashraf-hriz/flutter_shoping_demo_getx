
import 'package:flutter_demo_task/controllers/cart_controller.dart';
import 'package:flutter_demo_task/controllers/home_controller.dart';
import 'package:get/get.dart';

Future<void> init()async{
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => CartController());
}