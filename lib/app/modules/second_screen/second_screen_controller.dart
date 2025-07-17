import 'package:get/get.dart';
import 'package:suitmedia/app/data/models/user_model.dart';
import 'package:suitmedia/app/routes/app_pages.dart';

class SecondScreenController extends GetxController {
  final name = ''.obs;
  final selectedUserName = 'Selected User Name'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      name.value = Get.arguments as String;
    }
  }

  void chooseUser() async {
    var result = await Get.toNamed(Routes.THIRD);

    if (result != null && result is User) {
      selectedUserName.value = result.fullName;
    }
  }
}