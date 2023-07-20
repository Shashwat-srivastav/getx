import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class WeatherData extends StatefulWidget {
  final String city;

  const WeatherData({super.key, required this.city});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  weathernow weather = new weathernow("", "", "", "", "", "", "");
  String t = "";
  Future getWeatherData() async {
    var response = await http
        .get(Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': widget.city + "",
      'appid': 'edfa51a4ff3946732f60307189d4da34',
      'units': 'metric'
    }));

    var data = jsonDecode(response.body);
    final wea = data['main'];
    final wind = data['wind'];
    final descp = data['weather'];

    weathernow x = new weathernow(
        descp[0]['icon'].toString(),
        descp[0]['description'].toString(),
        wea['feels_like'].toString(),
        wea['temp_max'].toString(),
        wea['temp_min'].toString(),
        wea['humidity'].toString(),
        wind["speed"].toString());
    weather = x;

    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    String des = '';
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 137, 171, 228),
            Color.fromARGB(255, 183, 228, 236),
            Color.fromARGB(255, 209, 227, 235)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: FutureBuilder(
              future: getWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://openweathermap.org/img/wn/' +
                              weather.icon +
                              '@2x.png',
                          // scale: 100,
                        ).scale200(),
                        Text(
                          weather.des.capitalized,
                          style: GoogleFonts.courgette(
                              textStyle: TextStyle(fontSize: 36)),
                        ),
                        Stack(
                          children: [
                            Icon(
                              CupertinoIcons.sun_min,
                              size: 350,
                              color: Color.fromARGB(255, 229, 213, 164),
                            ).pLTRB(0, 0,
                                MediaQuery.of(context).size.height * 0.0, 0),
                            Text(weather.current,
                                    style: GoogleFonts.courgette(
                                        color: Colors.blueAccent,
                                        textStyle: TextStyle(fontSize: 36)))
                                .pLTRB(
                                    MediaQuery.of(context).size.height * 0.148,
                                    MediaQuery.of(context).size.height * 0.18,
                                    0,
                                    0),
                            // (weather.current)
                            //     .text
                            //     .rose800
                            //     .headline4(context)
                            //     .make()
                            //     .pLTRB(
                            //         MediaQuery.of(context).size.height * 0.148,
                            //         MediaQuery.of(context).size.height * 0.18,
                            //         0,
                            //         0),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.sun_max_fill,
                              size: 100,
                              color: Colors.amber,
                            ).p(10),
                            (weather.max).text.headline3(context).make(),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.sun_min_fill,
                              size: 100,
                              color: Colors.amber,
                            ).p(10),
                            (weather.min).text.headline3(context).make(),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.wind,
                              size: 100,
                              color: Colors.blue,
                            ).p(10),
                            (weather.windspd).text.headline3(context).make(),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.drop_fill,
                              size: 100,
                              color: Color.fromARGB(255, 150, 194, 230),
                            ).p(10),
                            (weather.humid).text.headline3(context).make(),
                          ],
                        ),
                      ],
                    ).centered(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}

// -------------------------------------------------modal class for weather----------------------------

class weathernow {
  String icon = "";
  String des = " ";
  String max = " ";
  String current = "";
  String min = " ";
  String humid = " ";
  String windspd = " ";

  weathernow(i, d, c, ma, mi, h, ws) {
    this.icon = i;
    this.des = d;
    this.current = c;
    this.max = ma;
    this.min = mi;
    this.humid = h;
    this.windspd = ws;
  }
}
