import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extension/color_extension.dart';

// class CustomInput extends StatefulWidget {
//   final String labelText;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final FormFieldSetter<String> onSaved;
//   final ValueChanged<String> onChange;
//   final FormFieldValidator<String> validator;
//
//   const CustomInput(
//       {super.key,
//       required this.labelText,
//       this.keyboardType,
//       this.obscureText = false,
//       required this.onSaved,
//       required this.onChange,
//       required this.validator});
//
//   @override
//   State<CustomInput> createState() => _CustomInputState();
// }

class CustomInput extends HookWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChange;
  final FormFieldValidator<String> validator;
  final String value;

  const CustomInput({
    super.key,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    required this.onSaved,
    required this.onChange,
    required this.validator,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    final secure = useState(false);

    useEffect(() {
      secure.value = obscureText;
      return null;
    }, []);

    return TextFormField(
      // focusNode: _focusNode,
      obscureText: secure.value,
      onTap: () {
        Scrollable.ensureVisible(context);
      },
      onChanged: onChange,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      initialValue: value,
      decoration: InputDecoration(
        errorMaxLines: 10,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF9F9F9), width: 0),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsNP.purple),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        labelText: labelText,
        fillColor: const Color(0xffF9F9F9),
        filled: true,
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: states.contains(MaterialState.error)
                ? ColorsNP.tomato
                : ColorsNP.darkPurple,
          );
        }),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: states.contains(MaterialState.error)
                ? ColorsNP.tomato
                : ColorsNP.purple,
          );
        }),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(secure.value ? Icons.visibility : Icons.visibility_off,
                    color: ColorsNP.lightPurple),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  secure.value = !secure.value;
                },
              )
            : null,
        errorStyle: const TextStyle(color: ColorsNP.tomato),
      ),
    );
  }
}
