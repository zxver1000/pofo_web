import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class introduce extends StatefulWidget {
  const introduce({Key? key}) : super(key: key);

  @override
  State<introduce> createState() => _introduceState();
}

class _introduceState extends State<introduce> {
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
                Expanded(flex: 2,child:Text("Introduce",style: TextStyle(
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
                    height: 100,
                    width: 5,
                  ),
                ))

              ],
            )

            ),
            Flexible(fit: FlexFit.loose,flex: 6,child:
            Container(
              height: 100,


              child: ListView.builder(
                  itemCount: 2
                  ,itemBuilder: (context,index){
                return   Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    child: RichText(text:TextSpan(
                        children:
                        [
                          TextSpan(text: '안녕하세요!! 반갑습니다 항상 긍정적으로 노력하는 개발자입니다.',
                              style: TextStyle(
                                  fontFamily: 'hambak',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300
                              )),


                        ]
                    )),
                  ),
                );

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
