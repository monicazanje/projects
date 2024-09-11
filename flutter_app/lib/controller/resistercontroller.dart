import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/homescreen.dart';
import 'package:flutter_app/view/signupconf.dart';
import 'package:http/http.dart' as http;

class RegisterController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> otpcontroller =
      List.generate(6, (_) => TextEditingController());
  final TextEditingController passController = TextEditingController();
  final TextEditingController repassController = TextEditingController();
  final TextEditingController businessController = TextEditingController();
  final TextEditingController informalController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  String errormsg='';
  String? selectState;
  FormData? data;
  String selectedSize='';
  Set<String> selectTime = {};
  bool isLoading = false;
  Map<String, List<String>> businessHours = {
    "mon": [],
    "tue": [],
    "wed": [],
    "thu": [],
    "fri": [],
    "sat": [],
    "sun": []
  };
  String? getFileName() {
    if (data != null) {
      for (var entry in data!.files) {
        String fileName = entry.value.filename ?? 'No file selected';
        return fileName;
      }
    }
    return 'No file selected';
  }

  bool isValidPhoneNumber(String number) {
    return RegExp(r'^\d{10}$').hasMatch(number);
  }

    void handleOtpInput(int index, String value) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void toggleTimeSlot(String timeSlot) {
    if (selectTime.contains(timeSlot)) {
      selectTime.remove(timeSlot);
    } else {
      selectTime.add(timeSlot);
    }
    notifyListeners();  
  }
  
  bool allfieldfill() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        repassController.text.isNotEmpty;
  }
  bool allfieldfill2() {
    return businessController.text.isNotEmpty &&
        informalController.text.isNotEmpty &&
        streetController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        zipcodeController.text.isNotEmpty ;
  }
  bool allfieldfill3() {
    return selectedSize.isNotEmpty && selectTime.isNotEmpty;
  }

  Future<void> registerPostRequest(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    String baseUrl = 'https://sowlab.com';
    String endpoint = '/assignment/#/Login%2FRegister/post_user_register';
    String fullUrl = baseUrl + endpoint;

    Map<String, dynamic> requestData = {
      'full_name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passController.text,
      "role": "farmer",
      'business_name': businessController.text,
      'informal_name': informalController.text,
      'address': streetController.text,
      'city': cityController.text,
      'zip_code': zipcodeController.text,
      'state': selectState ?? '',
      'registration_proof': data != null ? getFileName() : null,
      'business_hours': businessHours,
      "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      "type":"email/facebook/google/apple",
      "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
    };

    try {
      final response = await http.post(
        Uri.parse(fullUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );
      if (response.statusCode == 200) {
        log('Success: ${response.body}');
        log('Registration Successfully');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Signupconf();
        }));
      } else {
        log('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      log('Exception: $e');
    }
  }
  Future uplodaepdf() async {
    // var dio=Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      String filename = file.path.split('/').last;
      String filepath = file.path;
      FormData data = FormData.fromMap({
        'pdffile': await MultipartFile.fromFile(filepath, filename: filename),
        'name': "user_resistration.pdf"
      });
      return data;
    } else {
      log("result is null");
    }
  }

    Future<void> loginUser(BuildContext context) async {
    final String email = emailController.text;
    final String password = passController.text;

    if (email.isEmpty || password.isEmpty) {
      errormsg = "Email and password cannot be empty!";
      notifyListeners();
      return;
    }

    String baseUrl = 'https://sowlab.com';
    String endpoint = '/assignment/#/Login%2FRegister/post_user_login';
    String url = baseUrl + endpoint;

    isLoading = true;
      errormsg= ''; 
      notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          errormsg = data['message'] ?? "Login failed!";
          notifyListeners();
        }
      } else {
        errormsg = "Invalid email or password!";
        notifyListeners();
      }
    } catch (e) {
      errormsg = "An error occurred. Please try again.";
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    repassController.dispose();
    businessController.dispose();
    informalController.dispose();
    streetController.dispose();
    cityController.dispose();
    zipcodeController.dispose();
    super.dispose();
  }
}
