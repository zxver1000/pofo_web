import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './Profile_item/intro_item.dart';
import './Profile_item/contact.dart';
import './Profile_item/skill.dart';
import './Profile_item/education.dart';
import './Profile_item/summary_proejct.dart';
import './version2/education.dart';
import './version2/introduce.dart';
import './Profile_item/summary_proejct.dart';
import './version2/Techstack.dart';
import './version2/awards.dart';
const maincolor=0xfffff9e9;
class ui_version2 extends StatefulWidget {
  const ui_version2({Key? key}) : super(key: key);

  @override
  State<ui_version2> createState() => _ui_version2State();
}

class _ui_version2State extends State<ui_version2> {
  final double topWidgetHeight = 250.0;
  final double avatarRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          toolbarHeight: 120,
          flexibleSpace: Container(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("안녕하세요 :)1232tablet2",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: 'hambak',
                  ),),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 3,

          backgroundColor: Color(maincolor),

          actions: [
            IconButton(onPressed: (){

            }, icon:
            FaIcon(FontAwesomeIcons.github,size: 35,color: Colors.black,),



            ),


          ],

        ),
      body: SingleChildScrollView(
        child:
        Container(
          width: MediaQuery.of(context).size.width,
          child:  Column(
            children: [
              Stack(
                children: <Widget>[
                  new Column(
                    children: <Widget>[

                      new Container(
                        height: topWidgetHeight*1.3,
                        width: MediaQuery.of(context).size.width,
                    

                        child:
                        Container(
                          child: Column(
                            children: [
                            Padding(padding: EdgeInsets.only(top: 50))
                              ,
                              Row(
                                children: [

                                  Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                                  child: Text("김민철",style: TextStyle(fontSize: 50,
                                  fontWeight: FontWeight.bold),),)
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*0.9,
                                child:   Divider(height: 20,color: Colors.grey,)
                                ,
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                                child: Row(
                                  children: [
                                    Flexible(fit: FlexFit.loose,child:

                                    Column(
                                      children: [
                                        ListTile(leading: FaIcon(FontAwesomeIcons.phone,color: Colors.black,),title: Text("010-3540-2837"),

                                        ),

                                        ListTile(leading: FaIcon(FontAwesomeIcons.github,color: Colors.black,),title: Text("zxver1000"),

                                        ),
                                  ListTile(leading: FaIcon(FontAwesomeIcons.calendar,color: Colors.black,),title: Text("1996-09-01"),)
                                      ],
                                    )

                                    ),
                                    Flexible(fit: FlexFit.loose,child:
                                    Column(
                                      children: [
                                        ListTile(leading: FaIcon(FontAwesomeIcons.blog,color: Colors.black,),title: Text("zxver@naver.com"),

                                        ),

                                        ListTile(leading: FaIcon(FontAwesomeIcons.github,color: Colors.black,),title: Text("zxver1000"),

                                        ),
                                        ListTile(leading: FaIcon(FontAwesomeIcons.calendar,color: Colors.black,),title: Text("1996-09-01"),)
                                      ],
                                    )

                                    ),
                                    Flexible(fit: FlexFit.tight,child: Text(""),),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),





                      Padding(padding: EdgeInsets.only(top: 50),
                      child: Text(""),),
                      introduce(),
                      Padding(padding: EdgeInsets.only(top: 50), child: Text(""),),
                      education(),
                      Padding(padding: EdgeInsets.only(top: 50), child: Text(""),),
                     techStack(),
                      Padding(padding: EdgeInsets.only(top: 50), child: Text(""),),
                      awards(),
                      Padding(padding: EdgeInsets.only(top: 50), child: Text(""),),
                      summary_project(percent: 0.65,title_font_size: 27,font_size: 15),


                    ],
                  ),

                  new Positioned(
                    child: new Container(
                      width: 200,
                      height: 140,

                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.grey,
                       width: 1
                     ),
                     color: Colors.white
                   ),
                      child: Icon(Icons.person,size: 50,),
                    ),

                    right: MediaQuery.of(context).size.width*0.09,
                    top: avatarRadius+50,
                  )
                ],
              ),

            ],
          ),
        ),
        ),
      );


  }
}
