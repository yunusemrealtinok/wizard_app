import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizard_app/app/config/constants.dart';

import '../config/assets.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 0.2.sh,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Wizard's",
                  style: TextStyle(
                    color: kColorTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: 73,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20, left: 50),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Parchments",
                  style: TextStyle(
                    color: kColorTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  color: kColorTitleImg,
                  kDeathlyImg,
                  width: 0.35.sw,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
