import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CounterController.dart';
import 'one.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

int c = 0;
final CounterController count = Get.put(CounterController());
final ImagePickerController camera = Get.put(ImagePickerController());

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            Get.back();
          }),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Color.fromARGB(255, 142, 170, 226),
                  Color.fromARGB(255, 178, 148, 228)
                ])),
            child: Column(children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //     begin: Alignment.bottomLeft,
                        //     end: Alignment.topCenter,
                        //     colors: [
                        //       Colors.white10,
                        //       Colors.white10,
                        //     ]),
                        border:
                            Border.all(color: Colors.white54.withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white54.withOpacity(0.2)),
                    child: ListTile(
                      tileColor: Colors.blueGrey.withOpacity(0.1),
                      leading: IconButton(
                        icon: Icon(CupertinoIcons.greaterthan_circle),
                        onPressed: () {
                          count.remove();
                          // setState(() {});
                        },
                      ),
                      title: Obx(() {
                        return count.a.toString().text.make();
                      }),
                      subtitle:
                          'Counter using getx statemanagement'.text.make(),
                      trailing: IconButton(
                        icon: Icon(CupertinoIcons.lessthan_circle),
                        onPressed: () {
                          count.add();
                          // setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(CupertinoIcons.greaterthan_circle),
                    onPressed: () {
                      c++;
                      setState(() {});
                    },
                  ),
                  title: "${c}".text.make(),
                  subtitle: 'Counter'.text.make(),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.lessthan_circle),
                    onPressed: () {
                      c--;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.home),
                  title: "default dialog".text.make(),
                  subtitle: 'getx usage of dialog default'.text.make(),
                  onTap: () {
                    Get.defaultDialog(
                      titlePadding: EdgeInsets.all(20),
                      title: "this is dialog ",
                      middleText:
                          "this show the getx property of default dialog",
                      onConfirm: () => Get.to(One()),
                      onCancel: () => Get.back(),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.rectangle_compress_vertical),
                  title: "SnackBar".text.make(),
                  subtitle: 'getx usage of SnackBar'.text.make(),
                  onTap: () {
                    Get.snackbar('hello world', 'shashwat is calling',
                        snackPosition: SnackPosition.TOP);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.rectangle_dock),
                  title: "Bottom sheet".text.make(),
                  subtitle: 'getx usage of Bottom Sheet'.text.make(),
                  onTap: () {
                    Get.bottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        backgroundColor: Colors.deepOrange[50],
                        enableDrag: true,
                        Column(
                          children: [
                            Icon(CupertinoIcons.quote_bubble_fill),
                            Icon(CupertinoIcons.quote_bubble)
                          ],
                        ).pLTRB(0, 40, 0, 0));
                  },
                ),
              ),
              Card(
                  child: ListTile(
                leading: IconButton(
                  iconSize: MediaQuery.of(context).size.height * 0.03,
                  onPressed: () {
                    Get.changeTheme(ThemeData.dark());
                  },
                  icon: Icon(CupertinoIcons.lightbulb_fill),
                ),
                title: "Change Theme".text.make(),
                subtitle: 'getx usage of Theme'.text.make(),
                trailing: IconButton(
                  iconSize: MediaQuery.of(context).size.height * 0.03,
                  onPressed: () {
                    Get.changeTheme(ThemeData.light());
                  },
                  icon: Icon(CupertinoIcons.lightbulb),
                ),
              )),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.white54.withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white54.withOpacity(0.2)),
                    child: Obx(() {
                      return ListTile(
                          tileColor: Colors.blueGrey.withOpacity(0.1),
                          trailing: IconButton(
                            icon: Icon(CupertinoIcons.camera_viewfinder),
                            onPressed: () {
                              camera.getImage();
                            },
                          ),
                          title: "Image from camera using getx".text.make(),
                          leading: Column(children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: camera.pathof.isNotEmpty
                                  ? FileImage(File(camera.pathof.toString()))
                                  : null,
                            ),
                          ]));
                    }),
                  ),
                ),
              ),
            ]).pLTRB(0, 40, 0, 0),
          )),
    );
  }
}
