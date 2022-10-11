import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class PasswordField extends StatefulWidget {
  PasswordField({
    Key? key,
    required TextEditingController emailController,
    required this.labelText,
    required this.visible,
    this.inputFieldIcon,
    required this.focusNode,
  })  : _controller = emailController,
        super(key: key);

  final TextEditingController _controller;
  final String labelText;
  final bool visible;
  Icon? inputFieldIcon;
  FocusNode focusNode;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;
  // Focus Input Field
  // FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      obscureText: _isHidden,
      controller: widget._controller,
      focusNode: widget.focusNode,
      cursorColor: widget.focusNode.hasFocus
          ? ColorManager.primaryColor
          : ColorManager.textColorDark,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: widget.focusNode.hasFocus
                ? ColorManager.primaryColor
                : Color(0xff49454F)),
        hintText: "Input",
        suffix: InkWell(
          onTap: textVisible,
          child: Icon(
            _isHidden ? Icons.visibility_off_rounded : Icons.visibility,
            color: Color(0xff49454F),
          ),
          // if(_is)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorManager.primaryColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: ColorManager.primaryColor, width: 1.5)),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  void textVisible() {
    setState(() {
      _isHidden = !_isHidden;

      // FocusScope.of(context).requestFocus(widget.focusNode);
    });
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(widget.focusNode);
    });
  }
}
