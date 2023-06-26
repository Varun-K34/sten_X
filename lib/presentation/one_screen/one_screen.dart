import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';
import 'package:varun_s_application20/database/signup_db.dart';

class OneScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141034), // Background color AAB7FF
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Image.asset(
                ImageConstant.imgLogo,
                height: 180,
                width: 180,
                // fit: BoxFit.fitHeight, // Fit the image to cover the available space
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFFAAB7FF), // Text color
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: const Color.fromARGB(255, 212, 212, 212),
                    thickness: 4,
                    height: 4,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        onChanged: (value) {
                          // Handle username changes here
                        },
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          color: Color(0xFFAAB7FF), // Text color
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_box,
                            color: Color(0xFFAAB7FF), // Icon color
                          ),
                          hintText: "Username",
                          hintStyle: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            color: Color(0xFFAAB7FF), // Hint text color
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 209, 208, 208),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        onChanged: (value) {
                          // Handle password changes here
                        },
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          color: Color(0xFFAAB7FF), // Text color
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xFFAAB7FF), // Icon color
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            // Text color
                            color: Color(0xFFAAB7FF), // Hint text color
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 221, 220, 220),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              onTapForgotPassword(
                                  context); // Handle "forgot password?" button press
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Poppins',

                                color: Color(0xFFAAB7FF), // Text color
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              onTapSignUp(
                                  context); // Handle "Sign Up" button press
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Poppins',
                                color: Color(0xFFAAB7FF), // Text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  onTapLoginOne(context);
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFAAB7FF), // Button color 141034
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Button shape
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapLoginOne(BuildContext context) async {
    final _username = usernameController.text;
    final _password = passwordController.text;
    if (_username.isEmpty || _password.isEmpty) {
      showFieldsEmptyDialog(context);
      return;
    }
    List<Signupdb> dbValues = await getlogindetails();
    bool isUserFound = false;
    for (var item in dbValues) {
      if ((_username == item.username) && (_password == item.password)) {
        isUserFound = true;
        break;
      }
    }
    if (isUserFound) {
      Navigator.pushNamed(context, AppRoutes.twoScreen);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Incorrect Username/Password"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void onTapSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(), // Navigate to SignUpPage
      ),
    );
  }

  void onTapForgotPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Forgot Password?"),
          content: Text("Please sign up to create a new account."),
          actions: [
            TextButton(
              onPressed: () {
                onTapSignUp(context); // Navigate to sign up page
              },
              child: Text("Sign Up"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void showFieldsEmptyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fields Empty"),
          content: Text("Please fill in all the required fields"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
