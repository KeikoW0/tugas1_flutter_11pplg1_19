import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg/pages/calculator_page.dart';
import 'package:latihan1_11pplg/pages/football_edit_page.dart';
import 'package:latihan1_11pplg/pages/football_page.dart';
import 'package:latihan1_11pplg/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(
      name: AppRoutes.footballeditplayers,
      page: () {
        final index = Get.arguments as int;
        return FootballEditPage(index: index);
      },
    ),
  ];
}
