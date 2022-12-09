import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String labelText;

  const CustomInput({super.key, required this.labelText});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      obscureText: true,
      onTap: () {
        Scrollable.ensureVisible(context);
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF9F9F9), width: 0),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8C63A9)),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          labelText: widget.labelText,
          fillColor: const Color(0xffF9F9F9),
          filled: true,
          labelStyle: TextStyle(
              color:
                  _focusNode.hasFocus ? Color(0xff8C63A9) : Color(0xff685D84))),
    );
  }
}
