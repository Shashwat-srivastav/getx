import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:statemanagement/nytimes.dart';
import 'package:statemanagement/weatherapi.dart';
import 'package:velocity_x/velocity_x.dart';

import 'api.dart';

class AllApi extends StatelessWidget {
  const AllApi({super.key});

  @override
  Widget build(BuildContext context) {
    var city = '';
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 181, 228, 239),
                    Color.fromARGB(255, 197, 206, 238)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2)),
              child: ListTile(
                title: 'Quotes API'.text.make(),
                onTap: () async {
                  // ignore: prefer_const_constructors
                  return Get.to(APIdataRender());
                },
              ),
            ).p(5),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 181, 228, 239),
                    Color.fromARGB(255, 197, 206, 238)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2)),
              child: ListTile(
                title: 'Weather API'.text.make(),
                onTap: () async {
                  // ignore: prefer_const_constructors
                  return Get.defaultDialog(
                      title: "Enter the city",
                      content: TextField(
                        onSubmitted: (value) {
                          city = value;
                        },
                      ),
                      onConfirm: () => Get.to(WeatherData(
                            city: city,
                          )));
                  // return Get.to(WeatherData(city));
                },
              ),
            ).p(5),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 181, 228, 239),
                    Color.fromARGB(255, 197, 206, 238)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2)),
              child: ListTile(
                title: 'NewYorkTimes API'.text.make(),
                onTap: () async {
                  // ignore: prefer_const_constructors
                  return Get.to(NYtimes());
                },
              ),
            ).p(5),
          ],
        ),
      ),
    );
  }
}
