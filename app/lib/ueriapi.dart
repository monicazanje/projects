import 'dart:convert'; // For JSON encoding/decoding
import 'dart:developer';
import 'package:app/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApiExample extends StatefulWidget {
  @override
  _UserApiExampleState createState() => _UserApiExampleState();
}

class _UserApiExampleState extends State<UserApiExample> {
  Future<User?> fetchUser() async {
    final response = await http.get(Uri.parse('https://sowlab.com/assignment/#/Login%2FRegister/post_user_register'));

    if (response.statusCode == 200) {
      // Parse the JSON response and return the user
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
    // log(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data API'),
      ),
      body: Center(
        child: FutureBuilder<User?>(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No Data');
            } else {
              User? user = snapshot.data;
              return user != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name: ${user.name}'),
                        Text('Email: ${user.email}'),
                      ],
                    )
                  : Text('User not found');
            }
          },
        ),
      ),
    );
  }
}
