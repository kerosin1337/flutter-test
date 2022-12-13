import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChange;
  final FormFieldValidator<String> validator;

  const CustomInput(
      {super.key,
      required this.labelText,
      this.keyboardType,
      this.obscureText = false,
      required this.onSaved,
      required this.onChange,
      required this.validator});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  // final FocusNode _focusNode = FocusNode();
  bool _secure = false;

  @override
  void initState() {
    super.initState();
    _secure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // focusNode: _focusNode,
      obscureText: _secure,
      onTap: () {
        Scrollable.ensureVisible(context);
      },
      onChanged: widget.onChange,
      onSaved: widget.onSaved,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
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
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: Color(
                states.contains(MaterialState.error) ? 0xffF45D3E : 0xff685D84),
          );
        }),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: Color(
                states.contains(MaterialState.error) ? 0xffF45D3E : 0xff8C63A9),
          );
        }),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(_secure ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xffABA1C5)),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _secure = !_secure;
                  });
                },
              )
            : null,
        errorStyle: const TextStyle(color: Color(0xffF45D3E)),
      ),
    );
  }
}
