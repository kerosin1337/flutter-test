import 'package:flutter/material.dart';

enum ButtonMode {
  outline,
  contained,
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonMode mode;
  final String title;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.mode = ButtonMode.contained,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: () {
          switch (mode) {
            case ButtonMode.outline:
              return ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                      color: Color(0xff8C63A9),
                      width: 2,
                      style: BorderStyle.solid),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(
                  const Color(0xffF2EDF4),
                ),
              );
            case ButtonMode.contained:
              return ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                      color: Color(0xff8C63A9),
                      width: 2,
                      style: BorderStyle.solid),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(
                  const Color(0xff9d81ba),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff8C63A9),
                ),
              );
          }
        }(),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: () {
                switch (mode) {
                  case ButtonMode.outline:
                    return const Color(0xff8C63A9);
                  case ButtonMode.contained:
                    return Colors.white;
                  default:
                    return Colors.black;
                }
              }(),
              fontFamily: 'Rubik-Bold',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
