import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({super.key, required this.controller});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .max,
      children: [
        Expanded(child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3')])),
        Expanded(child: Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6')])),
        Expanded(child: Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9')])),
        Expanded(
          child: Row(
            children: [
              _buildButton('.'),
              _buildButton('0'),
              _buildButton('⌫', onPressed: _backspace),
            ],
          ),
        ),
      ],
    );
  }

  // Individual keys
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed ?? () => _input(text),
        child: Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(offset: Offset(1, 1), color: Colors.black.withValues(alpha: 0.2))],
          ),
          child: Center(
            child: Text(text, style: TextStyleConstants.w600F20.copyWith(color: Colors.black.withValues(alpha: 0.6))),
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    final value = _controller.text + text;
    _controller.text = value;
    _controller.text = _controller.text.replaceAll(StringConstants.rupeeIcon, "");
    _controller.text += StringConstants.rupeeIcon;
  }

  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty && value.length != 1) {
      _controller.text = value.substring(0, value.length - 2);
      _controller.text += StringConstants.rupeeIcon;
    }
  }
}
