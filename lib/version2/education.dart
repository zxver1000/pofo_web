import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class education extends StatefulWidget {
  const education({Key? key}) : super(key: key);

  @override
  State<education> createState() => _educationState();
}

class _educationState extends State<education> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,

          child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Flexible(fit: FlexFit.loose,flex: 3,child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 2,child:Text("Education",style: TextStyle(
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
                    child: RichText(
                    textAlign: TextAlign.start,
                    text:TextSpan(

                          children:
                          [
                            TextSpan(text: '건국대학교 컴퓨터공학부',

                                style: TextStyle(
                                    fontFamily: 'hambak',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,

                                )),
                            TextSpan(text: ' 졸업'),
                            TextSpan(text: '    (2017-02-01~2022-03-02)')

                          ]
                      )),

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
