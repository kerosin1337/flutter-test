import 'package:flutter/material.dart';
import 'package:new_platform_test/extension/color_extension.dart';

enum ButtonMode {
  outline,
  contained,
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonMode mode;
  final String? title;
  final Color titleColor;
  final Icon? icon;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.mode = ButtonMode.contained,
    this.title,
    this.icon,
    this.titleColor = ColorsNP.purple,
    this.child,
  })  : assert(title != null && child == null || title == null && child != null);

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
                    color: ColorsNP.purple,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(
                  ColorsNP.gray,
                ),
              );
            case ButtonMode.contained:
              return ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                      color: ColorsNP.purple,
                      width: 0,
                      style: BorderStyle.solid),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(
                  ColorsNP.lightPurple,
                ),
                backgroundColor: MaterialStateProperty.all(
                  ColorsNP.purple,
                ),
              );
          }
        }(),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: title == null
              ? child
              : Row(
                  mainAxisAlignment: icon != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    Text(
                      title!.toUpperCase(),
                      style: TextStyle(
                        color: () {
                          switch (mode) {
                            case ButtonMode.outline:
                              return titleColor;
                            case ButtonMode.contained:
                              return Colors.white;
                          }
                        }(),
                        fontFamily: 'Rubik-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    icon != null ? icon! : const SizedBox.shrink()
                  ],
                ),
        ),
      ),
    );
  }
}
