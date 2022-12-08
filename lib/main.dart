import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'Rubik',
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
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
                SvgPicture.asset('static/img/Start.svg',
                    semanticsLabel: 'StartImg',),
                const Text(
                  'НОВАЯ ПЛАТФОРМА',
                  style: TextStyle(
                      fontFamily: 'Rubik-Bold',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff251450)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Универсальная образовательная платформа',
                    style: TextStyle(
                      color: Color(0xff685D84),
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
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Color(0xff8C63A9),
                              width: 2,
                              style: BorderStyle.solid)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                          overlayColor:
                              MaterialStateProperty.all(Color(0xffF2EDF4))),
                      child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: const Text(
                            'ВХОД',
                            style: TextStyle(
                                color: Color(0xff8C63A9),
                                fontFamily: 'Rubik-Bold',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ))),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
