import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'register_page.dart';

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
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // isian password, style : hint, hidden char for password
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: TextField(
                controller: passwordController,
                obscureText: true, // Menyembunyikan karakter
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password', // hint
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // button login, stylenya bebas
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // jika username dan password adalah admin maka muncul snackbar sukses login
                  if (usernameController.text == "Admin" &&
                      passwordController.text == "admin") {
                    setState(() {
                      statusLogin = "Login Sukses";
                      print(statusLogin);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    });
                  } else {
                    setState(() {
                      statusLogin = "Login Gagal";
                      print(statusLogin);
                    });
                  }
                },
                child: Text("Login"),
              ),
            ),
            Text(statusLogin),

            // button register
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: Text(
                  "Register",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
