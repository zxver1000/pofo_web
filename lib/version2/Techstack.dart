import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class techStack extends StatefulWidget {
  const techStack({Key? key}) : super(key: key);

  @override
  State<techStack> createState() => _techStackState();
}

class _techStackState extends State<techStack> {
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
                Expanded(flex: 2,child:Text("Tech Stack",style: TextStyle(
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
              child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 0.5, //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 10, //수평 Padding
                crossAxisSpacing: 10, //수직 Padding
              ),
                  itemBuilder: (context,index){
                return    Column(
                    children: [
                      ListTile(leading: Text(""),title: Text("Android",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'hambak',
                        fontSize: 20

                      ),),),
                      ListTile(leading:Icon(Icons.check),title: Text("Kotlin"),),
                      ListTile(leading:Icon(Icons.check),title: Text("Kubernetes"),),
                      ListTile(leading:Icon(Icons.check),title: Text("Kubernetes"),),
                      ListTile(leading:Icon(Icons.check),title: Text("Kubernetes"),),
                      index==1?  ListTile(leading:Icon(Icons.check),title: Text("Kubernetes"),):Text("")
                    ],
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

