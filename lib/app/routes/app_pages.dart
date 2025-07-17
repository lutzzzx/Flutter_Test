import 'package:get/get.dart';
import 'package:suitmedia/app/modules/first_screen/first_screen_controller.dart';
import 'package:suitmedia/app/modules/first_screen/first_screen_view.dart';
import 'package:suitmedia/app/modules/second_screen/second_screen_controller.dart';
import 'package:suitmedia/app/modules/second_screen/second_screen_view.dart';
import 'package:suitmedia/app/modules/third_screen/third_screen_controller.dart';
import 'package:suitmedia/app/modules/third_screen/third_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.FIRST,
      page: () => FirstScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<FirstScreenController>(() => FirstScreenController());
      }),
    ),
    GetPage(
      name: Routes.SECOND,
      page: () => SecondScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SecondScreenController>(() => SecondScreenController());
      }),
    ),
    GetPage(
      name: Routes.THIRD,
      page: () => ThirdScreenView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ThirdScreenController>(() => ThirdScreenController());
      }),
    ),
  ];
}