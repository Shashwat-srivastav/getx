import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool theme = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {}),
          body: Column(children: [
            Card(
              child: ListTile(
                leading: Icon(CupertinoIcons.home),
                title: "default dialog".text.make(),
                subtitle: 'getx usage of dialog default'.text.make(),
                onTap: () {
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.all(20),
                    title: "this is dialog ",
                    middleText: "this show the getx property of default dialog",
                    onConfirm: () => print("hello"),
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
                icon: Icon(CupertinoIcons.color_filter_fill),
              ),
              title: "Change Theme".text.make(),
              subtitle: 'getx usage of Theme'.text.make(),
              trailing: IconButton(
                iconSize: MediaQuery.of(context).size.height * 0.03,
                onPressed: () {
                  Get.changeTheme(ThemeData.light());
                },
                icon: Icon(CupertinoIcons.color_filter),
              ),
            )),
          ]).pLTRB(0, 40, 0, 0)),
    );
  }
}
