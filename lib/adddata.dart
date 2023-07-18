import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CounterController.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    String n = "", p = "";
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.defaultDialog(
            onConfirm: () {
              Contact x = new Contact(n, p);
              getcontact.add(x);
              // setState(() {});
            },
            content: Column(
              children: [
                TextField(
                  // textInputAction: TextEditingController.fromValue(n),
                  onChanged: (value) {
                    n = value;
                  },
                ),
                TextField(
                  onChanged: (value) {
                    p = value;
                  },
                )
              ],
            ));
        // setState(() {});
      }),
      body: Obx(
        () => Container(
          child: ListView.builder(
              itemCount: getcontact.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 161, 216, 223),
                            Color.fromARGB(255, 221, 182, 229)
                          ])),
                  child: ListTile(
                    title: getcontact[index].ph.text.make(),
                    subtitle: getcontact[index].name.text.make(),
                    leading: Icon(CupertinoIcons.profile_circled),
                    onTap: () {
                      print(getcontact[index].name);
                      getcontact.remove(getcontact[index]);
                    },
                  ),
                ).p(5);
              }),
        ),
      ),
    );
  }
}
