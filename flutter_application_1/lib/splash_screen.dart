import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_animation.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
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
