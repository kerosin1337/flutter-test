import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:new_platform_test/view/main/bottom-tab.dart';
import 'package:new_platform_test/component/custom_input.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      show(context);
    });
  }

  void show(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    String email = "";
    String password = "";
    showModalBottomSheet(
      context: context,
      elevation: 10,
      enableDrag: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).viewInsets.bottom == 0
              ? screenHeight * 0.7
              : double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
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
                      fontFamily: 'Rubik-Bold',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: CustomInput(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? value) {
                        setState(() {
                          email = value!;
                        });
                        print(email);
                      },
                      onChange: (String value) {
                        setState(() {
                          email = value;
                        });
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
                        setState(() {
                          password = value!;
                        });
                        print(email);
                      },
                      onChange: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: ValidationBuilder(localeName: 'ru')
                          .minLength(8)
                          .maxLength(100)
                          .required()
                          .build(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: CustomButton(
                        onPressed: () async {
                          // if (_formKey.currentState!.validate()) {
                          //   print(email);
                          //   print(password);
                          //   // Navigator.of(context).push(
                          //   //   MaterialPageRoute(
                          //   //     builder: (context) => const IfTeacherAuth(),
                          //   //   ),
                          //   // );
                          //   final response = await Dio().post(
                          //     "https://api-dev.new-platform.ipst-dev.com/api/auth/login",
                          //     data: {'email': email, 'password': password},
                          //   );
                          //   print(response);
                          // }
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) => const BottomTab(),
                              ),
                              (route) => false);
                        },
                        title: "вход"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    String email = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xff685D84),
        ),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SvgPicture.asset(
            'static/img/Rhone.svg',
            semanticsLabel: 'Rhone',
            width: MediaQuery.of(context).size.width,
          ),
          // Column(
          //   children: [
          //     Expanded(flex: 2, child: Container()),
          //     Expanded(
          //         flex: 4,
          //         child: ),
          //   ],
          // )
        ],
      ),
    );
  }
}
