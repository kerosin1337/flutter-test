import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:new_platform_test/view/main/bottom-tab.dart';
import 'package:new_platform_test/component/custom_input.dart';
import '../../extension/color_extension.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }

class SignIn extends HookWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey();

  const SignIn({super.key});

  void show(BuildContext context, ValueNotifier<String> email,
      ValueNotifier<String> password) {
    final double screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      elevation: 10,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).viewInsets.bottom == 0
              ? screenHeight * 0.7
              : double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        color: ColorsNP.gray,
                        width: 40,
                        height: 5,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    child: const Text(
                      'Войти в систему',
                      style: TextStyle(
                        color: ColorsNP.darkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: 'Rubik-Bold',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: CustomInput(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? value) {
                        email.value = value!;
                      },
                      onChange: (String value) {
                        email.value = value;
                      },
                      value: email.value,
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
                        password.value = value!;
                      },
                      value: password.value,
                      onChange: (String value) {
                        password.value = value;
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
                        if (_formKey.currentState!.validate()) {
                          print(email.value);
                          print(password.value);
                          final response = await Dio().post(
                            "https://api-dev.new-platform.ipst-dev.com/api/auth/login",
                            data: {
                              'email': email.value,
                              'password': password.value
                            },
                          );
                          print(response.statusCode);
                          if (response.statusCode == 201) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) => BottomTab(),
                              ),
                              (route) => false,
                            );
                          }
                        }
                      },
                      title: "вход",
                    ),
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
    final email = useState("zkerov9@gmail.com");
    final password = useState("qweasd123");

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        show(context, email, password);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: ColorsNP.purple,
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
        ],
      ),
    );
  }
}
