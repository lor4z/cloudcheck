import 'package:cloudcheck/core/screens/start_page.dart';
import 'package:flutter/material.dart';

class CloudHome extends StatefulWidget {
  const CloudHome({super.key});

  @override
  State<CloudHome> createState() => _CloudHomeState();
}

class _CloudHomeState extends State<CloudHome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 38, 72, 1.0),
              Color.fromRGBO(134, 79, 172, 1.0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/nuvemInicio.png',
                height: 650,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Cloud',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  TextSpan(
                    text: 'Check',
                    style: TextStyle(
                      color: Color.fromRGBO(175, 162, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
