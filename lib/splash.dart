import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mda/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), () {
      // print("5 seconds completed");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Dashboard();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293D34),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 150.0,
              height: 150.0,
              child: Image(
                image: NetworkImage(
                  'https://res.cloudinary.com/edifice-solutions/image/upload/v1706216565/edo_2_h0ozyo.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Edo State Health MDAs 2024 Initiatives',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Finishing Strong - Alignment and Focus for Success',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
