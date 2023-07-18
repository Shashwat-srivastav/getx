import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'api.dart';

class AllApi extends StatelessWidget {
  const AllApi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.green],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2)),
              child: ListTile(
                title: 'API integration using http'.text.make(),
                onTap: () async {
                  // ignore: prefer_const_constructors
                  return Get.to(APIdataRender());
                },
              ),
            ).p(5)
          ],
        ),
      ),
    );
  }
}
