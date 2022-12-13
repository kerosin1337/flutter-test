import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IfTeacherAuth extends StatelessWidget {
  const IfTeacherAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Дорогой преподаватель!",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    "Данное приложение предназначено для студентов. Для работы на платформе рекомендуется использовать компьютер.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SvgPicture.asset(
                  'static/img/TeacherAuth.svg',
                  semanticsLabel: 'StartImg',
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
