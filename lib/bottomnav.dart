import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg/pages/calculator_page.dart';
import 'package:latihan1_11pplg/pages/football_page.dart';
import 'package:latihan1_11pplg/pages/profile_page.dart';
import 'controllers/bottomnav_controller.dart';

class BottomNavExample extends StatelessWidget {
  final BottomnavController controller = Get.put(BottomnavController());

  final List<Widget> pages = [CalculatorPage(), FootballPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Football',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
