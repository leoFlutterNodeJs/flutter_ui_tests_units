import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class InputText extends StatefulWidget {
  final Widget prefixIcon;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final bool Function(String) validator;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  InputText(
      {@required this.prefixIcon,
      @required this.validator,
      @required this.onChanged,
      this.onSubmitted,
      this.textInputAction,
      this.obscureText = false,
      this.textInputType = TextInputType.text});

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
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      obscureText: _isObscure,
      keyboardType: widget.textInputType,
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
