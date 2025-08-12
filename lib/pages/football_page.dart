import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import 'football_edit_page.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});
  final FootballController footballController = Get.put(FootballController());

  final Color backgroundColor = Colors.green[900]!;
  final Color textColor = const Color(0xFFFFFDD0); // cream

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("My Football Players", style: TextStyle(color: textColor)),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: footballController.players.length,
          itemBuilder: (context, index) {
            final player = footballController.players[index];
            return Card(
              color: backgroundColor.withOpacity(0.8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(player.profileImage),
                ),
                title: Text(player.name, style: TextStyle(color: textColor)),
                subtitle: Text(
                  "${player.position} • #${player.number}",
                  style: TextStyle(color: textColor.withOpacity(0.8)),
                ),
                trailing: Icon(Icons.edit, color: textColor),
                onTap: () {
                  Get.to(() => FootballEditPage(index: index));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
