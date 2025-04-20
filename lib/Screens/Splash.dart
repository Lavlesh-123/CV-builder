import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

var auth = FirebaseAuth.instance;
var user = auth.currentUser;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 550,
        width: 450,
        child: Image.asset('assets/images/resume_splash_final.png',
            fit: BoxFit.contain),
      ),
    );
  }
}
