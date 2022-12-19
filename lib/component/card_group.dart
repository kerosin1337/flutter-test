import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_platform_test/view/main/major/subject.dart';

import '../extension/color_extension.dart';

class CardGroup extends HookWidget {
  const CardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
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
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Subject(), fullscreenDialog: false
            ),
          );
        },
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
    );
  }
}
