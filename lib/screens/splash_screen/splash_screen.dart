import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';
import '../../utils/image_resource.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String version = '';
  Timer? _timer;


  @override
  void initState() {

    print('-=-=-=-=-= SPLADHS SCREEN');
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 260,
                height: 113,

          child: Image.asset(
                  ImageResource.splashlogo,
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 17.0),
                  child: Center(
                    child: Text(
                      '@copyright 2023',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorResource.color333333),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
