import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double a;
  final double b;

  SecondScreen({required this.a, required this.b});

  double _calculateSquareOfSum() {
    return (a + b) * (a + b);
  }

  @override
  Widget build(BuildContext context) {
    double result = _calculateSquareOfSum();

    return Scaffold(
      appBar: AppBar(
        title: Text('Результат расчёта'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Введённые данные:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('a = $a', style: TextStyle(fontSize: 16)),
            Text('b = $b', style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            Text(
              'Результат:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '(a + b)² = ($a + $b)² = $result',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Назад'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}