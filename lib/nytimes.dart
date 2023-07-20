import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class NYtimes extends StatefulWidget {
  const NYtimes({super.key});

  @override
  State<NYtimes> createState() => _NYtimesState();
}

class _NYtimesState extends State<NYtimes> {
  List<String> l = [];
  List li = [];

  Future getNews() async {
    var resp = await http.get(Uri.https(
        'api.nytimes.com',
        '/svc/topstories/v2/home.json',
        {'api-key': 'hJMYMGp3ZFD1WJvAIkREQC0C2GTD7rGf'}));
    var data = jsonDecode(resp.body);
    // print(resp.body);
    // print(data);
    var art = data['results'];
    var artsecond = art[0];
    print(artsecond);
    // print(artsecond);
    for (var x in art) {
      l.add(x['title']);
      for (var y in x['multimedia']) {
        if (y['format'] == "Super Jumbo") li.add(y['url']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: "NewYorkTimes".text.rose600.headline3(context).make(),
      ),
      body: FutureBuilder(
          future: getNews(),
          builder: (context, snapshot) {
            // print(li);
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: li.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 181, 228, 239),
                            Color.fromARGB(255, 197, 206, 238)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2), width: 2)),
                  child: GridTile(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              opacity: 0.8,
                              isAntiAlias: true,
                              image: NetworkImage(li[index]),
                              fit: BoxFit.fill)),
                    ),
                    header: l[index]
                        .text
                        .headline3(context)
                        .teal100
                        .semiBold
                        .make(),
                    // header: Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(20))),
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    //   clipBehavior: Clip.antiAlias,
                    //   child: Image.network(
                    //     li[index],
                    //     // scale: 100,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ).pLTRB(0, 10, 0, 0),
                    // title: l[index].text.make(),
                    // leading: GridView.builder(
                    //     itemCount: li.length,
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 1),
                    //     itemBuilder: (context, index) {
                    //       return Image.network(li[index]);
                    //     }),
                  ),
                ).pLTRB(2, 10, 2, 10);
              },
            );
          }),
    );
  }
}
