import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:statemanagement/adddata.dart';
import 'package:statemanagement/allapi.dart';
import 'package:statemanagement/api.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CounterController.dart';
import 'one.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

int c = 0;
double x = 0;
final CounterController count = Get.put(CounterController());
final ImagePickerController camera = Get.put(ImagePickerController());
final Todo task = Get.put(Todo());
final timer tm = Get.put(timer());
var tasks = '';
var t = 0;

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
            Get.to(ContactPage());
          }),
          body: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Color.fromARGB(255, 142, 170, 226),
                  Color.fromARGB(255, 178, 148, 228)
                ])),
            child: SingleChildScrollView(
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
                          border: Border.all(
                              color: Colors.white54.withOpacity(0.5)),
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
                //-----------------------------------------counter using setstate------------------------------
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
                //------------------------------popup dialog using getx---------------------------------------------
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
                //-----------------------------SnackBar using getx----------------------------------------
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
                //-----------------------------bottom sheet using getx----------------------------------------
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white54.withOpacity(0.5)),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white54.withOpacity(0.2)),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                        ),
                      ),
                    ),
                  ),
                ),
                //----------------------------------Image from gallery ----------------------------------------
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white54.withOpacity(0.5)),
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
                                radius: 20,
                                backgroundImage: camera.pathof.isNotEmpty
                                    ? FileImage(File(camera.pathof.toString()))
                                    : null,
                              ),
                            ]));
                      }),
                    ),
                  ),
                ),
                //--------------------------------------Timer application------------------------------------------
                Obx(
                  () => ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2))),
                        child: ListTile(
                          leading: Icon(CupertinoIcons.rectangle_dock),
                          title: '${tm.h.value} : ${tm.m.value} : ${tm.s.value}'
                              .text
                              .make(),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  tm.h.value.text.make(),
                                  Slider(
                                          min: 0,
                                          max: 60,
                                          value: (tm.h.value).toDouble(),
                                          onChanged: (x) {
                                            tm.h.value = x.toInt();
                                          })
                                      .w(MediaQuery.of(context).size.width *
                                          0.72),
                                ],
                              ),
                              Row(
                                children: [
                                  tm.m.value.text.make(),
                                  Slider(
                                          min: 0,
                                          max: 60,
                                          value: (tm.m.value).toDouble(),
                                          onChanged: (x) {
                                            tm.m.value = x.toInt();
                                          })
                                      .w(MediaQuery.of(context).size.width *
                                          0.72),
                                ],
                              ),
                              Row(
                                children: [
                                  tm.s.value.text.make(),
                                  Slider(
                                          min: 0,
                                          max: 60,
                                          value: (tm.s.value).toDouble(),
                                          onChanged: (x) {
                                            tm.s.value = x.toInt();
                                          })
                                      .w(MediaQuery.of(context).size.width *
                                          0.72),
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            Timer.periodic(Duration(seconds: 1), (timer) {
                              if (tm.s.value <= 0) {
                                if (tm.m.value <= 0) {
                                  if (tm.h.value <= 0) {
                                    timer.cancel();
                                  } else {
                                    tm.m.value = 60;
                                    tm.h.value--;
                                  }
                                } else {
                                  tm.s.value = 60;
                                  tm.m.value--;
                                }
                              } else {
                                tm.s.value--;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ).pLTRB(0, 5, 0, 5),
                ),
                //-------------------------Todo List Application ----------------------------------------
                Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Obx(
                      () => SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(color: Colors.cyanAccent[200]),
                              onSubmitted: (value) {
                                task.add(value.obs);
                              },
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.14,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: task.list.length,
                                  itemBuilder: ((context, index) {
                                    return ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 20, sigmaY: 20),
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.2))),
                                          child: ListTile(
                                              // leading:
                                              onTap: () {
                                                task.list
                                                    .remove(task.list[index]);
                                                task.list.refresh();
                                              },
                                              title: task.list[index].value.text
                                                  .amber300
                                                  .make()),
                                        ).pLTRB(0, 5, 0, 5),
                                      ),
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    )),
                //----------------------------API integration---------------------------------
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white.withOpacity(0.2),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2))),
                    child: ListTile(
                      title: 'API integration using http'.text.make(),
                      onTap: () async {
                        // ignore: prefer_const_constructors
                        return Get.to(AllApi());
                      },
                    ),
                  ),
                )
                //--------------------------------------------------------------------
              ]).pLTRB(0, 20, 0, 20),
            ),
          )),
    );
  }
}
