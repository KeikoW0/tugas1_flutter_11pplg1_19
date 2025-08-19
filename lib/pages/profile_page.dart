import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final Color backgroundColor = Colors.green[900]!;
  final Color textColor = const Color(0xFFFFFDD0); // cream

  final String userName = "Keiko Shafira Wiyana";
  final String userAbsen = "19";
  final String userKelas = "11 PPLG 1";
  final String userImage = "assets/images/loginicon.png"; // ganti sesuai asetmu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("My Profile", style: TextStyle(color: textColor)),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertikal center
          crossAxisAlignment: CrossAxisAlignment.center, // horizontal center
          children: [
            CircleAvatar(radius: 60, backgroundImage: AssetImage(userImage)),
            const SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Absen: $userAbsen",
              style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Kelas: $userKelas",
              style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
