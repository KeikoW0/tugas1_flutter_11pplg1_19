import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/football_model.dart';

class FootballEditPage extends StatelessWidget {
  final int index;
  FootballEditPage({super.key, required this.index});

  final footballController = Get.find<FootballController>();

  final Color backgroundColor = Colors.green[900]!;
  final Color textColor = const Color(0xFFFFFDD0); // cream

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: textColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: textColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: textColor, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = footballController.players[index];

    final nameController = TextEditingController(text: player.name);
    final positionController = TextEditingController(text: player.position);
    final numberController = TextEditingController(
      text: player.number.toString(),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Edit Player", style: TextStyle(color: textColor)),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(player.profileImage),
            ),
            SizedBox(height: 20),

            TextField(
              controller: nameController,
              style: TextStyle(color: textColor),
              decoration: inputDecoration("Name"),
            ),
            SizedBox(height: 12),
            TextField(
              controller: positionController,
              style: TextStyle(color: textColor),
              decoration: inputDecoration("Position"),
            ),
            SizedBox(height: 12),
            TextField(
              controller: numberController,
              style: TextStyle(color: textColor),
              decoration: inputDecoration("Number"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: textColor,
                foregroundColor: backgroundColor,
              ),
              onPressed: () {
                footballController.updatePlayer(
                  index,
                  Player(
                    profileImage: player.profileImage, // tetap sama
                    name: nameController.text,
                    position: positionController.text,
                    number:
                        int.tryParse(numberController.text) ?? player.number,
                  ),
                );
                Get.back();
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
