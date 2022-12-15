import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:new_platform_test/main.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import '../../../extension/color_extension.dart';

class Profile extends HookWidget {
  const Profile({super.key});

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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Вы точно хотите выйти?'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            // content: SingleChildScrollView(
                            //   child: ListBody(
                            //     children: const <Widget>[
                            //       Text('This is a demo alert dialog.'),
                            //       Text(
                            //         'Would you like to approve of this message?',
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            actionsPadding: const EdgeInsets.only(
                              right: 15,
                              bottom: 15,
                            ),
                            actions: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TouchableOpacity(
                                  child: const Text(
                                    'Нет',
                                    style: TextStyle(color: ColorsNP.purple),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TouchableOpacity(
                                  child: const Text(
                                    'Да',
                                    style: TextStyle(color: ColorsNP.tomato),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MyHomePage(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
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
                              fontWeight: FontWeight.w400,
                            ),
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
