import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_platform_test/component/custom_button.dart';
import 'package:new_platform_test/extension/color_extension.dart';
import 'package:new_platform_test/view/start/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Platform',
      theme: ThemeData(
        fontFamily: 'Rubik',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'static/img/Start.svg',
                    semanticsLabel: 'StartImg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  const Text(
                    'НОВАЯ ПЛАТФОРМА',
                    style: TextStyle(
                      fontFamily: 'Rubik-Bold',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorsNP.darkBlue,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Универсальная образовательная платформа',
                      style: TextStyle(
                        color: ColorsNP.darkPurple,
                        fontFamily: 'Rubik-Medium',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Center(
                  child: CustomButton(
                    title: 'вход',
                    mode: ButtonMode.outline,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
