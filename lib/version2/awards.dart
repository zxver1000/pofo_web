import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class awards extends StatefulWidget {
  const awards({Key? key}) : super(key: key);

  @override
  State<awards> createState() => _awardsState();
}

class _awardsState extends State<awards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,


        child: Row(

          children: [


            Flexible(fit: FlexFit.loose,flex: 3,child:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 2,child:Text("Awards",style: TextStyle(
                    fontFamily: 'hambak',
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.start,) )

                ,
                Flexible(flex: 5,child: Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.grey[300],
                    height: 500,
                    width: 5,
                  ),
                ))

              ],
            )

            ),
            Expanded(flex: 6,child:
            Container(
              height: 500,
              width:  300,
              child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 2, //item 의 가로 1, 세로 2 의 비율
                    mainAxisSpacing: 30, //수평 Padding
                    crossAxisSpacing: 30, //수직 Padding
                  ),
                  itemBuilder: (context,index){
                    return    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            ),

                        ),
                      child: Column(
                        children: [
                         Text("Awards 헤커톤 금상",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'hambak',
                              fontSize: 20

                          ),),
                          Text("2011~2001"),
                          Container(
                           height: 100,
                              child: Image.asset('assets/image/cloud.png',fit:BoxFit.fitHeight ,)),

                        ],
                      ),
                    )
                    ;

                  }),
            )
            ),
            Flexible(fit: FlexFit.tight,flex: 1,child:
            Text("")
            ),
          ],
        )
        ,

      ),
    );
  }
}
