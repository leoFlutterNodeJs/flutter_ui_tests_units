import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

import 'custom_form.dart';

class InputText extends StatefulWidget {
  final Widget prefixIcon;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final String Function(String) validator;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String labelText;
  InputText(
      {@required this.prefixIcon,
      @required this.onChanged,
      this.validator,
      this.onSubmitted,
      this.textInputAction,
      this.labelText,
      this.obscureText = false,
      this.textInputType = TextInputType.text});

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String _errorText = '';
  bool _isObscure = false;
  CustomFormState _formState;

  String get errorText => _errorText;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formState = CustomForm.of(context);
      _formState?.register(this);
    });
  }

  @override
  void deactivate() {
    _formState?.remove(this);
    super.deactivate();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator(text);
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
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          labelText: widget.labelText,
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
                  color: _errorText == null ? primaryColor : Colors.grey,
                )),
    );
  }
}
