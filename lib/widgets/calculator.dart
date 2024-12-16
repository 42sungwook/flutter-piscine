// lib/widgets/calculator/calculator_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_piscine/config/theme.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String _expression = '0';
  String _result = '0';
  bool _shouldResetInput = false;

  final TextEditingController _expressionController =
      TextEditingController(text: '0');
  final TextEditingController _resultController =
      TextEditingController(text: '0');

  void _onButtonPressed(String button) {
    setState(() {
      switch (button) {
        case 'AC':
          _expression = '0';
          _result = '0';
          break;
        case 'C':
          _expression = _expression.length > 1
              ? _expression.substring(0, _expression.length - 1)
              : '0';
          break;
        case '=':
          try {
            _result = _calculateResult();
            _shouldResetInput = true;
          } catch (e) {
            _result = '오류';
          }
          break;
        default:
          bool isOperator = ['+', '-', 'x', '/'].contains(button);
          bool lastIsOperator = _expression.isNotEmpty &&
              ['+', '-', 'x', '/']
                  .contains(_expression[_expression.length - 1]);

          if (_shouldResetInput) {
            _expression = button;
            _shouldResetInput = false;
          } else if (isOperator && lastIsOperator) {
            _expression =
                _expression.substring(0, _expression.length - 1) + button;
          } else {
            _expression = _expression == '0' ? button : _expression + button;
          }
      }

      _expressionController.text = _expression;
      _resultController.text = _result;
    });
  }

  String _calculateResult() {
    String expression = _expression.replaceAll('x', '*');

    List<String> numbers = expression.split(RegExp(r'[+\-*/]'));
    List<String> operators = expression
        .split(RegExp(r'[0-9.]+'))
        .where((e) => e.isNotEmpty)
        .toList();

    if (numbers.isEmpty) return '0';

    double result = double.parse(numbers[0]);

    for (int i = 0; i < operators.length; i++) {
      double nextNum = double.parse(numbers[i + 1]);
      switch (operators[i]) {
        case '+':
          result += nextNum;
          break;
        case '-':
          result -= nextNum;
          break;
        case '*':
          result *= nextNum;
          break;
        case '/':
          if (nextNum == 0) throw Exception('0으로 나눌 수 없습니다');
          result /= nextNum;
          break;
      }
    }

    if (result == result.roundToDouble()) {
      return result.toInt().toString();
    }
    return result.toString();
  }

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
            controller: _expressionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '수식을 입력하세요',
            ),
            readOnly: true,
            textAlign: TextAlign.right,
          ),
          SizedBox(height: AppTheme.spacing),
          TextField(
            controller: _resultController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '결과',
            ),
            readOnly: true,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
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
}
