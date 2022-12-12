import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:new_platform_test/component/CustomInput.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static final GlobalKey<FormState> _formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;


    String email = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xff685D84)),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SvgPicture.asset(
            'static/img/Rhone.svg',
            semanticsLabel: 'Rhone',
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          Column(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      padding:
                      const EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: screenWidth,
                            maxHeight:
                            MediaQuery
                                .of(context)
                                .viewInsets
                                .bottom == 0
                                ? double.infinity
                                : screenHeight * 0.8),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text(
                                'Войти в систему',
                                style: TextStyle(
                                    color: Color(0xff251450),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    fontFamily: 'Rubik-Bold'),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: CustomInput(
                                  labelText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (String? value) {
                                    email = value!;
                                  },
                                  validator: ValidationBuilder(localeName: 'ru')
                                      .email()
                                      .minLength(8)
                                      .maxLength(100)
                                      .required()
                                      .build(),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: CustomInput(
                                    labelText: "Пароль",
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    onSaved: (String? value) {
                                      password = value!;
                                    },
                                    validator: ValidationBuilder(
                                        localeName: 'ru')
                                        .minLength(8)
                                        .maxLength(100)
                                        .required()
                                        .build()
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 60),
                                child: OutlinedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        print(email);
                                        print(password);
                                      }
                                    },
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                color: Color(0xff8C63A9),
                                                width: 2,
                                                style: BorderStyle.solid)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            )),
                                        overlayColor: MaterialStateProperty.all(
                                            const Color(0xff9d81ba)),
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            const Color(0xff8C63A9))),
                                    child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: const Text(
                                          'ВХОД',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Rubik-Bold',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
