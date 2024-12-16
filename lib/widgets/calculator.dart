// lib/widgets/calculator/calculator_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_piscine/config/theme.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 520;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isNarrow
                    ? Column(
                        children: [
                          _buildInputFields(),
                          _buildNumberPad(),
                          _buildOperatorPad(),
                        ],
                      )
                    : Column(
                        children: [
                          _buildInputFields(),
                          _buildButtonRow(['7', '8', '9', 'C', 'AC']),
                          _buildButtonRow(['4', '5', '6', '+', '-']),
                          _buildButtonRow(['1', '2', '3', 'x', '/']),
                          _buildButtonRow(['0', '.', '00', '=', '']),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputFields() {
    return Padding(
      padding: EdgeInsets.all(AppTheme.spacing),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '수식을 입력하세요',
            ),
            readOnly: true,
            textAlign: TextAlign.right,
            controller: TextEditingController(text: '0'),
          ),
          SizedBox(height: AppTheme.spacing),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '결과',
            ),
            readOnly: true,
            textAlign: TextAlign.right,
            controller: TextEditingController(text: '0'),
          ),
        ],
      ),
    );
  }
}

Widget _buildNumberPad() {
  return Column(
    children: [
      _buildButtonRow(['7', '8', '9']),
      _buildButtonRow(['4', '5', '6']),
      _buildButtonRow(['1', '2', '3']),
      _buildButtonRow(['0', '.', '00']),
    ],
  );
}

Widget _buildOperatorPad() {
  return Column(
    children: [
      _buildButtonRow(['+', '-', 'x']),
      _buildButtonRow(['/', 'C', 'AC']),
      _buildButtonRow(['', '', '=']),
    ],
  );
}

Widget _buildButtonRow(List<String> buttons) {
  return SizedBox(
    height: 60,
    child: Row(
      children: buttons.map((button) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(4),
            child: button.isEmpty
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () => _onButtonPressed(button),
                    child: Text(
                      button,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
          ),
        );
      }).toList(),
    ),
  );
}

void _onButtonPressed(String button) {
  switch (button) {
    case 'AC':
      print('AC');
      break;
    case 'C':
      print('C');
      break;
    case '=':
      print('=');
      break;
    default:
      print(button);
  }
}
