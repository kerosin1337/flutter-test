import 'package:flutter/material.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../../extension/color_extension.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePage();
}

class _ProfilePage extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: ColorsNP.gray,
                      child: Icon(
                        Icons.person_rounded,
                        size: 90,
                        color: ColorsNP.purple,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const Text(
                        "Андрей Петров",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: CustomButton(
                    onPressed: () {},
                    title: "Настройки профиля",
                    mode: ButtonMode.outline,
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsNP.lightPurple,
                    ),
                    titleColor: ColorsNP.darkBlue,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomButton(
                    onPressed: () {},
                    title: "Инструкции",
                    mode: ButtonMode.outline,
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsNP.lightPurple,
                    ),
                    titleColor: ColorsNP.darkBlue,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomButton(
                    onPressed: () {},
                    title: "Тех.поддержка",
                    mode: ButtonMode.outline,
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsNP.lightPurple,
                    ),
                    titleColor: ColorsNP.darkBlue,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: TouchableOpacity(
                    onTap: () {
                      print('logout');
                    },
                    activeOpacity: 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.exit_to_app_rounded,
                          color: ColorsNP.tomato,
                          size: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text(
                            "Выйти из профиля",
                            style: TextStyle(
                                color: ColorsNP.tomato,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
