import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:new_platform_test/component/custom_input.dart';
import 'package:new_platform_test/extension/color_extension.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

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
              // TODO: empty
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.5,
              //   child: const Center(
              //     child: Text(
              //       'Вы пока не состоите ни в одной группе',
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.w500,
              //         color: ColorsNP.darkPurple,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              // Column(
              //   children: [
              //     CustomButton(onPressed: () {}, title: "добавить группу"),
              //     Container(
              //       margin: const EdgeInsets.only(top: 20),
              //       child: CustomButton(
              //         onPressed: () {},
              //         title: "инструкция",
              //         mode: ButtonMode.outline,
              //       ),
              //     ),
              //   ],
              // )
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Мои группы",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ColorsNP.darkBlue,
                            ),
                          ),
                          TouchableOpacity(
                            child: const Icon(
                              Icons.add_box_outlined,
                              color: ColorsNP.purple,
                              size: 25,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Вступить в группу по коду'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 20),
                                    content: CustomInput(
                                      labelText: "Введите код группы",
                                      onSaved: (value) {},
                                      onChange: (value) {},
                                      validator:
                                          ValidationBuilder(localeName: 'ru')
                                              .maxLength(100)
                                              .required()
                                              .build(),
                                      value: "",
                                    ),
                                    actionsPadding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: 20,
                                    ),
                                    actions: <Widget>[
                                      CustomButton(
                                        title: "вступить в группу",
                                        onPressed: () {},
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        border: Border.all(
                          color: ColorsNP.purple,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: const Text(
                                  "482",
                                  style: TextStyle(
                                    color: ColorsNP.darkBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              // TODO: have subjects
                              // Column(
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Container(
                              //           constraints:
                              //               const BoxConstraints(minWidth: 20),
                              //           child: const Text(
                              //             "●",
                              //             style: TextStyle(
                              //               color: ColorsNP.darkPurple,
                              //             ),
                              //             textAlign: TextAlign.center,
                              //           ),
                              //         ),
                              //         const Text(
                              //           "Математика",
                              //           style: TextStyle(
                              //               color: ColorsNP.darkPurple,
                              //               fontSize: 14,
                              //               fontWeight: FontWeight.w400),
                              //         ),
                              //       ],
                              //     )
                              //   ],
                              // ),
                              const Text(
                                "В данной группе пока нет предметов",
                                style: TextStyle(
                                  color: ColorsNP.tomato,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      child: const Icon(
                                        Icons.group,
                                        color: ColorsNP.lightPurple,
                                      ),
                                    ),
                                    const Text(
                                      "23 студента",
                                      style: TextStyle(
                                        color: ColorsNP.lightPurple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
