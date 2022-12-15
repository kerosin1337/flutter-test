import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:new_platform_test/extension/color_extension.dart';

class Main extends HookWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsNP.purple,
                ),
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Привет, Андрей!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12, bottom: 8),
                          child: const Text(
                            "Чем займемся сегодня?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'static/img/MicroMan.svg',
                      semanticsLabel: 'StartImg',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(
                  child: Text(
                    'Вы пока не состоите ни в одной группе',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorsNP.darkPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Column(
                children: [
                  CustomButton(onPressed: () {}, title: "добавить группу"),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: CustomButton(
                      onPressed: () {},
                      title: "инструкция",
                      mode: ButtonMode.outline,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
