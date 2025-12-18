import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  bool _agreementChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор квадратов суммы'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Урюмцев В.Э.', 
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerA,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Число a',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите число a';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Введите корректное число';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _controllerB,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Число b',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите число b';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Введите корректное число';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text('Согласен на обработку данных'),
                value: _agreementChecked,
                onChanged: (value) {
                  setState(() {
                    _agreementChecked = value ?? false;
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (!_agreementChecked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Необходимо согласие на обработку данных'),
                        ),
                      );
                      return;
                    }
                    double a = double.parse(_controllerA.text);
                    double b = double.parse(_controllerB.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(a: a, b: b),
                      ),
                    );
                  }
                },
                child: Text('Рассчитать'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}