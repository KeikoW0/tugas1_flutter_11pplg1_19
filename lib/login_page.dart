import 'package:flutter/material.dart';
import 'package:latihan1_11pplg/register_page.dart';
import 'package:latihan1_11pplg/widget/widget_button.dart';
import 'package:latihan1_11pplg/widget/widget_textfield.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Our First App",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Please Login Using Your Email and Password"),

            // image dari resource
            Center(
              child: Image.asset(
                'assets/images/loginicon.png',
                width: 100,
                height: 100,
              ),
            ),

            // isian username
            Container(
              margin: EdgeInsets.only(top: 20),
              child: MyTextField(
                textEditingController: usernameController,
                labelText: "Input username",
              ),
            ),

            MyTextField(
              textEditingController: passwordController,
              labelText: "Input password",
            ),

            // button login, stylenya bebas
            Center(
              child: CustomButton(
                text: "Login",
                textColor: Colors.red,
                onPressed: () {
                  if (usernameController.text == "Admin" &&
                      passwordController.text == "admin") {
                    print("Sukses login, pindah tampilan");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage(),
                      ),
                    );
                  } else {
                    print("Gagal login");
                  }
                },
              ),
            ),
            Text(statusLogin),

            // button register
            Center(
              child: CustomButton(
                text: "Register",
                textColor: Colors.green,
                onPressed: () {
                  print("Register");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
