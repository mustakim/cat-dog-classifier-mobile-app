import 'package:cat_dog_classifier/home.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
        duration: const Duration(milliseconds: 2000),
        nextScreen: const Home(),
        backgroundColor: Colors.blueAccent,
        splashScreenBody: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                width: 269,
                height: 474,
                child: Image.asset('assets/images/cat_dog_icon.png'),
              ),
              const Text(
                'Cat and Dog Classifier',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.yellow,
                ),
              )
            ],
          )),
        ));
  }
}
