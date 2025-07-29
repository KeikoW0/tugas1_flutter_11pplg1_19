import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();

  String? selectedGender;

  void _register() {
    final nama = namaController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final tanggalLahir = tanggalLahirController.text;

    print("Nama: $nama");
    print("Email: $email");
    print("Password: $password");
    print("Jenis Kelamin: $selectedGender");
    print("Tanggal Lahir: $tanggalLahir");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Register berhasil!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(label: "Nama", controller: namaController),
            CustomTextField(
              label: "Email / Username",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              label: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            Text(
              "Jenis Kelamin",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Laki-laki"),
                    value: "Laki-laki",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Perempuan"),
                    value: "Perempuan",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            CustomTextField(
              label: "Tanggal Lahir (DD/MM/YYYY)",
              controller: tanggalLahirController,
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _register,
                child: Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// REUSABLE TEXT FIELD COMPONENT
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
