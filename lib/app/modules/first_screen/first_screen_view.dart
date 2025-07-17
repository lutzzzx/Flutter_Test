import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/widgets/custom_button.dart';
import 'package:suitmedia/app/widgets/custom_text_field.dart';
import 'first_screen_controller.dart';

class FirstScreenView extends GetView<FirstScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Icon(
                    Icons.person_add_alt_1,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                SizedBox(height: 60),

                // input nama
                CustomTextField(
                  controller: controller.nameController,
                  hintText: 'name',
                ),
                SizedBox(height: 20),

                // input Palindrome
                CustomTextField(
                  controller: controller.sentenceController,
                  hintText: 'Palindrome',
                ),
                SizedBox(height: 60),

                // Tombol Check
                CustomButton(
                  label: 'CHECK',
                  onPressed: controller.checkPalindrome,
                ),
                SizedBox(height: 20),

                // Tombol Next
                CustomButton(
                  label: 'NEXT',
                  onPressed: controller.goToNextScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
