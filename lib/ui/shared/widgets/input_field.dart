import 'package:flutter/material.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class InputField extends StatefulWidget {
  final String placeholder;
  final IconData icon;
  final TextEditingController controllerField;
  final TextInputType keyboardType;
  final bool isObscure;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final bool autoFocus;

  const InputField({
    @required this.placeholder,
    @required this.icon,
    @required this.controllerField,
    @required this.keyboardType,
    @required this.textInputAction,
    @required this.focusNode,
    @required this.nextFocusNode,
    this.autoFocus = false,
    this.isObscure = false,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      width: 330,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/frames/field.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 300,
        child: TextFormField(
          autofocus: widget.autoFocus,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          },
          focusNode: widget.focusNode,
          obscureText: widget.isObscure,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: widget.keyboardType,
          controller: widget.controllerField,
          style: TextStyle(color: GameColors.textColor, fontSize: 14),
          cursorColor: GameColors.textColor,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              color: GameColors.placeholderColor,
              fontSize: 14,
            ),
            prefixIcon: Icon(
              widget.icon,
              size: 18,
              color: GameColors.placeholderColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
