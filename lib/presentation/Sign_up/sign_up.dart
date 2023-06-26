import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';
import 'package:varun_s_application20/database/signup_db.dart';
import 'package:varun_s_application20/presentation/one_screen/one_screen.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.blue200,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: usernameController,
                  onChanged: (value) {
                    // Handle username changes here
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorConstant.gray9007e,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    // Handle email changes here
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorConstant.gray9007e,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  onChanged: (value) {
                    // Handle password changes here
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorConstant.gray9007e,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  onChanged: (value) {
                    // Handle confirm password changes here
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorConstant.gray9007e,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: "SIGN UP",
                    context: context,
                    buttonColor: ColorConstant.blueA100,
                    onTap: () {
                      onTapSignUp(context);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onTapSignIn(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Poppins',
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
    );
  }

  void onTapSignUp(BuildContext context) {
    // Perform sign-up logic here
    if (areFieldsEmpty()) {
      showFieldsEmptySnackbar(
          context); // Display snackbar if any text fields are empty
    } else if (!doPasswordsMatch()) {
      showPasswordsDoNotMatchSnackbar(
          context); // Display snackbar if passwords do not match
    } else {
      addLoginData();
      showAccountCreatedSnackbar(
          context); // Display snackbar on successful sign-up
    }
  }

  void onTapSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OneScreen(),
      ),
    );
  }

  Future<void> addLoginData() async {
    final _username = usernameController.text;
    final _email = emailController.text;
    final _password = passwordController.text;
    if (_username.isEmpty) {
      return;
    }
    if (_email.isEmpty) {
      return;
    }
    if (_password.isEmpty) {
      return;
    }
    final _db = Signupdb(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      username: _username,
      email: _email,
      password: _password,
    );
    addLoginDetails(_db);
  }

  void addLoginDetails(Signupdb db) {
    // Add the login details to the database
  }

  bool areFieldsEmpty() {
    final _username = usernameController.text;
    final _email = emailController.text;
    final _password = passwordController.text;
    return _username.isEmpty || _email.isEmpty || _password.isEmpty;
  }

  bool doPasswordsMatch() {
    final _password = passwordController.text;
    final _confirmPassword = confirmPasswordController.text;
    return _password == _confirmPassword;
  }

  void showFieldsEmptySnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Please fill in all the required fields'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showPasswordsDoNotMatchSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Passwords do not match'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showAccountCreatedSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Account created successfully!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
