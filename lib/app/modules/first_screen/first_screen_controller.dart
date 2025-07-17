import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/routes/app_pages.dart';
import 'package:suitmedia/app/widgets/custom_dialog.dart';

class FirstScreenController extends GetxController {
  final nameController = TextEditingController();
  final sentenceController = TextEditingController();

  void checkPalindrome() {
    final input = sentenceController.text;

    if (input.isEmpty) {
      Get.snackbar(
        "Error",
        "Sentence cannot be empty",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    String original = input.toLowerCase().replaceAll(' ', '');
    String reversed = original.split('').reversed.join('');
    bool isPalindrome = original == reversed;

    Get.dialog(
      CustomDialog(
        title: "Palindrome Check",
        content: isPalindrome ? "isPalindrome" : "not palindrome",
        confirmLabel: "OK",
        onConfirm: () => Get.back(),
      ),
      barrierDismissible: false,
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