import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/Auth.dart';
import 'package:statemanagement/MyPage.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Auth _auth = Get.put(Auth());
  String email = '';
  String pass = '';
  String name = "";
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.bottomLeft,
        //         end: Alignment.topCenter,
        //         colors: [
        //       Colors.black,
        //       Color.fromARGB(255, 142, 170, 226),
        //       Color.fromARGB(255, 178, 148, 228)
        //     ])),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name.text
                    .headline6(context)
                    .purple100
                    .make()
                    .pLTRB(50, 0, 0, 0),
                TextFormField(
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white54.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white54.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          gapPadding: 4.0),
                      hintText: "Email Id",
                      prefixIcon: Icon(CupertinoIcons.profile_circled)),
                  onChanged: (value) {
                    email = value;
                  },
                ).pLTRB(0, 0, 0, 20),
                TextFormField(
                        onChanged: (value) {
                          pass = value;
                          // name = value;
                          // setState(() {});
                        },
                        validator: (value) {
                          if (value!.length <= 10) {
                            return "enter the value greater than 10 char";
                          } else {
                            return "nice";
                          }
                        },
                        style:
                            const TextStyle(decorationColor: Colors.blueGrey),
                        textDirection: TextDirection.rtl,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(CupertinoIcons.padlock),
                            fillColor: Colors.white30,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white54.withOpacity(0.3)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white54.withOpacity(0.3)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                gapPadding: 4.0)))
                    .pLTRB(0, 0, 0, 50),
                InkWell(
                    //Password Authentication---------------------------------------------
                    onTap: () async {
                      try {
                        final credential =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: pass);
                        Get.to(MyPage());
                      } on FirebaseAuthException catch (e) {
                        Get.snackbar('Authentication', '${e.message}');
                      }
                    },
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.038,
                          width: MediaQuery.of(context).size.width * 0.26,
                          child: "Sign In".text.white.base.make().centered(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white24.withOpacity(0.4)),
                        ),
                      ),
                    )).centered()
                // ElevatedButton(
                //     style: ButtonStyle(
                //         shadowColor: MaterialStateColor.resolveWith(
                //             (states) => Color.fromARGB(229, 207, 201, 201)),
                //         backgroundColor: MaterialStateColor.resolveWith(
                //             (states) => Colors.transparent)),
                //     onPressed: () {
                //       Get.to(MyPage());
                //     },
                //     child: Card(
                //       child: Container(
                //         height: MediaQuery.of(context).size.height * 0.030,
                //         width: MediaQuery.of(context).size.width * 0.14,
                //         child: "Sign In".text.make(),
                //       ),
                //       // color: Colors.deepPurple[50],
                //     )).centered(),
              ],
            ).w(240),
            height: 400,
            width: 300,
            // clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     begin: Alignment.bottomLeft,
                //     end: Alignment.topCenter,
                //     colors: [
                //       Colors.white10,
                //       Colors.white10,
                //     ]),
                border: Border.all(color: Colors.white54.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white54.withOpacity(0.2)),
          ),
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [
              Colors.black,
              Color.fromARGB(255, 142, 170, 226),
              Color.fromARGB(255, 178, 148, 228)
            ])),
      ),
    ));
  }
}
