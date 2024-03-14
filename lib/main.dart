import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giải phương trình bậc 2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: QuadraticEquationSolver(),

    );
  }
}

class QuadraticEquationSolver extends StatefulWidget {
  @override
  _QuadraticEquationSolverState createState() => _QuadraticEquationSolverState();
}

class _QuadraticEquationSolverState extends State<QuadraticEquationSolver> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  TextEditingController _controllerC = TextEditingController();
  String _result = '';

  void _solveQuadraticEquation() {
    double a = double.tryParse(_controllerA.text) ?? 0;
    double b = double.tryParse(_controllerB.text) ?? 0;
    double c = double.tryParse(_controllerC.text) ?? 0;

    double delta = b * b - 4 * a * c;

    if (a == 0) {
      if (b == 0) {
        setState(() {
          _result = "Phương trình vô nghiệm";
        });
      } else {
        double x = -c / b;
        setState(() {
          _result = "Phương trình có một nghiệm kép: x = $x";
        });
      }
    } else if (delta < 0) {
      setState(() {
        _result = "Phương trình vô nghiệm";
      });
    } else if (delta == 0) {
      double x = -b / (2 * a);
      setState(() {
        _result = "Phương trình có nghiệm kép: x = $x";
      });
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      setState(() {
        _result = "Nghiệm của phương trình là: x1 = $x1, x2 = $x2";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giải phương trình bậc 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nhập hệ số a'),
            ),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nhập hệ số b'),
            ),
            TextField(
              controller: _controllerC,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nhập hệ số c'),
            ),
            SizedBox(height: 16),
         
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              onPressed: _solveQuadraticEquation,
              child: Text('Giải'),
            ),

            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}