import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';
import 'user_profile_screen.dart';

void main() {
  // Initialize GetX Controller
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserProfileScreen(),
    );
  }
}