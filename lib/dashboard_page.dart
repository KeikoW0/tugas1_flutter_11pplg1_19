import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  int? hasil;

  void hitung(String operasi) {
    int? a = int.tryParse(angka1Controller.text);
    int? b = int.tryParse(angka2Controller.text);

    if (a == null || b == null) {
      setState(() {
        hasil = null;
      });
      return;
    }

    setState(() {
      switch (operasi) {
        case '+':
          hasil = a + b;
          break;
        case '-':
          hasil = a - b;
          break;
        case '×':
          hasil = a * b;
          break;
        case '÷':
          hasil = b != 0 ? a ~/ b : null; // pakai ~/ untuk pembagian tanpa koma
          break;
      }
    });
  }

  void reset() {
    angka1Controller.clear();
    angka2Controller.clear();
    setState(() {
      hasil = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: angka1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: angka2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => hitung('+'), child: Text('+')),
                ElevatedButton(onPressed: () => hitung('-'), child: Text('-')),
                ElevatedButton(onPressed: () => hitung('×'), child: Text('×')),
                ElevatedButton(onPressed: () => hitung('÷'), child: Text('÷')),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: ${hasil != null ? hasil.toString() : '-'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
