import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class InputText extends StatefulWidget {
  final Widget prefixIcon;
  final void Function(String) onChanged;
  final bool Function(String) validator;
  final bool obscureText;
  InputText({
    @required this.prefixIcon,
    @required this.validator,
    @required this.onChanged,
    this.obscureText = false,
  });

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool _isOk = false;
  bool _isObscure = false;

  @override
  void initState() {
    _isObscure = widget.obscureText;
    super.initState();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _isOk = widget.validator(text);
      setState(() {});
    }

    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  void _onVisibleChanged() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      obscureText: _isObscure,
      decoration: InputDecoration(
          fillColor: primaryColor,
          prefixIcon: this.widget.prefixIcon,
          suffixIcon: widget.obscureText
              ? CupertinoButton(
                  minSize: 25,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _onVisibleChanged,
                )
              : Icon(
                  Icons.check_circle,
                  color: _isOk ? primaryColor : Colors.grey,
                )),
    );
  }
}
