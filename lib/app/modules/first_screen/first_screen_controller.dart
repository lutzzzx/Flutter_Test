import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/routes/app_pages.dart';

class FirstScreenController extends GetxController {
  final nameController = TextEditingController();
  final sentenceController = TextEditingController();

  void checkPalindrome() {
    if (sentenceController.text.isEmpty) {
      Get.snackbar("Error", "Sentence cannot be empty", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    String original = sentenceController.text.toLowerCase().replaceAll(' ', '');
    String reversed = original.split('').reversed.join('');

    Get.defaultDialog(
      title: "Palindrome Check",
      middleText: original == reversed ? "isPalindrome" : "not palindrome",
      textConfirm: "OK",
      onConfirm: () => Get.back(),
    );
  }

  void goToNextScreen() {
    if (nameController.text.isEmpty) {
      Get.snackbar("Error", "Name cannot be empty", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    Get.toNamed(Routes.SECOND, arguments: nameController.text);
  }

  @override
  void onClose() {
    nameController.dispose();
    sentenceController.dispose();
    super.onClose();
  }
}