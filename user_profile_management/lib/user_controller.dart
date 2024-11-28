import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  // Observables
  var name = "Your Name".obs;
  var email = "your.email@example.com".obs;
  var age = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load data when the app starts
  }

  // Update name
  void changeName(String newName) {
    if (newName.isNotEmpty) {
      name.value = newName;
      saveUserData(); // Save after update
    } else {
      Get.snackbar("Error", "Name cannot be empty!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Update email
  void changeEmail(String newEmail) {
    if (newEmail.isEmail) { // Validate email format
      email.value = newEmail;
      saveUserData(); // Save after update
    } else {
      Get.snackbar("Error", "Invalid email format!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Update age
  void changeAge(int newAge) {
    if (newAge >= 0) {
      age.value = newAge;
      saveUserData(); // Save after update
    } else {
      Get.snackbar("Error", "Age must be a positive number!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Save user data to shared_preferences
  Future<void> saveUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name.value);
      await prefs.setString('email', email.value);
      await prefs.setInt('age', age.value);
    } catch (e) {
      Get.snackbar("Error", "Failed to save user data!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Load user data from shared_preferences
  Future<void> loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      name.value = prefs.getString('name') ?? "Your Name";
      email.value = prefs.getString('email') ?? "youremail@gmail.com";
      age.value = prefs.getInt('age') ?? 0;
    } catch (e) {
      Get.snackbar("Error", "Failed to load user data!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

// Guided by Proverbs 27:17