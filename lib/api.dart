import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class APIdataRender extends StatefulWidget {
  const APIdataRender({super.key});

  @override
  State<APIdataRender> createState() => _APIdataRenderState();
}

class _APIdataRenderState extends State<APIdataRender> {
  ///--------------------------Api calling -----------------------------------------
  final List<Quote> LQ = [];

  Future<void> getDatafromquote() async {
    var quoteresponse =
        await http.get(Uri.https('zenquotes.io', '/api/quotes'));
    var JsonData = jsonDecode(quoteresponse.body);
    // print(JsonData);

    for (var data in JsonData) {
      Quote q = new Quote(data['q'], data['a']);
      LQ.add(q);
    }

    ///-----------------------------football--------------------
    // var footballresp = await http.get(
    //     Uri.https(
    //       'api-football-v1.p.rapidapi.com', '/v3/timezone',
    //       //       {'token': 'JX65RUYHI4MJITVHI6QM'}
    //     ),
    //     headers: Map.from({
    //       'X-RapidAPI-Key':
    //           '410fb685a1mshd1962a798b650efp10ac43jsn2d2e7d369cf4',
    //       'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
    //     }));

    // var footballjson = jsonDecode(footballresp.response);
    // print(footballjson);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            'QUOTES'.text.teal600.headline3(context).semiBold.make().centered(),
      ),
      body: FutureBuilder<void>(
          future: getDatafromquote(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // print(LQ);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: LQ.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 154, 232, 228),
                                      Color.fromARGB(255, 141, 155, 233)
                                    ])),
                            child: ListTile(
                              horizontalTitleGap: 20,
                              title: LQ[index].autor.text.make(),
                              subtitle: LQ[index].quote.text.make(),
                            ),
                          ).p(5);
                        }).p(30),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator().scale200().centered();
            }
          })),
    );
  }
}

//-------------------------------------modal class for api ----------------------------------------
class Quote {
  String quote = '';
  String autor = '';
  Quote(String quote, String author) {
    this.quote = quote;
    this.autor = author;
  }
}
