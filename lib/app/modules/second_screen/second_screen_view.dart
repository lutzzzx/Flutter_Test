import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/widgets/custom_button.dart';
import 'second_screen_controller.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(fontSize: 16)),
            Obx(() => Text(
              controller.name.value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )),
            Expanded(child: Center(
              child: Obx(() => Text(
                controller.selectedUserName.value,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )),
            )),
            CustomButton(
              label: 'Choose a User',
              onPressed: controller.chooseUser,
            ),
          ],
        ),
      ),
    );
  }
}