import 'package:flutter/material.dart';

class CloudHome extends StatelessWidget {
  const CloudHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 38, 72, 1.0), // Cor inicial do degradê
              Color.fromRGBO(134, 79, 172, 1.0)
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
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: 'Check',
                  style: TextStyle(
                      color: Color.fromRGBO(175, 162, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )
              ])),
            ],
          ),
        ),
      )),
    );
  }
}
