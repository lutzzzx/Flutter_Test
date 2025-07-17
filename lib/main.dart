import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Suitmedia Test App",
      initialRoute: Routes.FIRST,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}