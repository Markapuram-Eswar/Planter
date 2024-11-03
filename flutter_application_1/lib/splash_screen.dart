import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'flutter_application_1/assets/animations/splash_animation.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
          onLoaded: (composition) {
            Future.delayed(composition.duration + const Duration(seconds: 4),
                () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            });
          },
        ),
      ),
    );
  }
}
