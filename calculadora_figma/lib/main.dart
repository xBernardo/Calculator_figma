import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

// ignore: use_key_in_widget_constructors
class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraHome(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CalculadoraHome extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraHomeState createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operation = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _currentInput = "";
      _num1 = 0;
      _num2 = 0;
      _operation = "";
    } else if (buttonText == "+/-") {
      if (_currentInput.isNotEmpty) {
        _currentInput = (-double.parse(_currentInput)).toString();
        _output = _currentInput;
      }
    } else if (buttonText == "%") {
      if (_currentInput.isNotEmpty) {
        _currentInput = (double.parse(_currentInput) / 100).toString();
        _output = _currentInput;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_currentInput);
      if (_operation == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operation == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operation == "x") {
        _output = (_num1 * _num2).toString();
      } else if (_operation == "÷") {
        _output = (_num1 / _num2).toString();
      }
      _num1 = 0;
      _num2 = 0;
      _operation = "";
      _currentInput = _output;
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "÷") {
      _num1 = double.parse(_currentInput);
      _operation = buttonText;
      _currentInput = "";
    } else {
      _currentInput += buttonText;
      _output = _currentInput;
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, {Color color = Colors.white, Color textColor = Colors.black}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor, backgroundColor: color,
            padding: EdgeInsets.all(24.0),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("C", color: Colors.grey),
                  _buildButton("+/-", color: Colors.grey),
                  _buildButton("%", color: Colors.grey),
                  _buildButton("÷", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("x", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("-", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("+", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("0"),
                  _buildButton("."),
                  _buildButton("=", color: Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}