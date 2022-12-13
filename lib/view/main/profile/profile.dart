import 'package:flutter/material.dart';

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
                      backgroundColor: Color(0xffF2EDF4),
                      child: Icon(
                        Icons.person_rounded,
                        size: 90,
                        color: Color(0xff8C63A9),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
