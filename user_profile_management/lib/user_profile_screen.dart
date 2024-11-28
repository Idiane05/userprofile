import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: Obx(() {
        // Show a loading message while data is being retrieved
        if (userController.name.value == "Loading...") {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Update Your Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Name TextField
              TextField(
                decoration: const InputDecoration(labelText: "Name"),
                onChanged: (value) => userController.changeName(value),
              ),
              const SizedBox(height: 10),

              // Email TextField
              TextField(
                decoration: const InputDecoration(labelText: "Email"),
                onChanged: (value) => userController.changeEmail(value),
              ),
              const SizedBox(height: 10),

              // Age TextField
              TextField(
                decoration: const InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty && int.tryParse(value) != null) {
                    userController.changeAge(int.parse(value));
                  } else {
                    Get.snackbar("Error", "Age must be a valid number!",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
              ),
              const SizedBox(height: 20),

              // Display Updated Information
              Obx(() => Text(
                    "Name: ${userController.name.value}\n"
                    "Email: ${userController.email.value}\n"
                    "Age: ${userController.age.value}",
                    style: const TextStyle(fontSize: 16),
                  )),

              const SizedBox(height: 20),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Profile Updated",
                    "Changes saved successfully!",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        );
      }),
    );
  }
}