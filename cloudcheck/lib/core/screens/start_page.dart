import 'package:flutter/material.dart';

class StartHome extends StatelessWidget {
  const StartHome({super.key});

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
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/nuvemChuva.png'),
                Text(
                  '19°',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 58,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  'Precipitações',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Poppins'),
                ),
                Text(
                  'Max: 24°    Min: 18°',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Poppins'),
                ),
                Image.asset('assets/images/House.png'),
                Container(
                  // margin:
                  //     const EdgeInsets.symmetric(horizontal: 0.1, vertical: 1),
                  padding: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(
                            29, 38, 72, 1.0), // Cor inicial do degradê
                        Color.fromRGBO(142, 64, 197, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hoje',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Janeiro, 14',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WeatherInfo(
                            temperature: '19°C',
                            time: '15:00',
                            // iconPath: 'assets/images/nuvemChuvaP.png',
                          ),
                          WeatherInfo(
                            temperature: '18°C',
                            time: '16:00',
                            // iconPath: 'assets/images/nuvemChuvaNoiteP.png',
                          ),
                          WeatherInfo(
                            temperature: '18°C',
                            time: '17:00',
                            // iconPath: 'assets/images/nuvemChuvaNoiteP.png',
                          ),
                          WeatherInfo(
                            temperature: '16°C',
                            time: '18:00',
                            // iconPath: 'assets/images/nuvemChuvaNoiteP.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final String temperature;
  final String time;
  // final String iconPath;

  const WeatherInfo({
    super.key,
    required this.temperature,
    required this.time,
    // required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset(
        //   iconPath,
        // ),
        Text(
          temperature,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
