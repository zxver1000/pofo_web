import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './Profile_item/intro_item.dart';
import './Profile_item/contact.dart';
import './Profile_item/skill.dart';
import './Profile_item/education.dart';
import './Profile_item/summary_proejct.dart';
const maincolor=0xfffff9e9;
const test_color=0xff9370db;
class DesktopUi extends StatefulWidget {
  const DesktopUi({Key? key}) : super(key: key);

  @override
  State<DesktopUi> createState() => _DesktopUiState();
}

class _DesktopUiState extends State<DesktopUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Container(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("안녕하세요 :)123Desk",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontFamily: 'hambak',


                ),),
            ],
          ),
        ),
        leading:  Image.asset('assets/image/cloud.png',width: 300,height: 120,),
        centerTitle: true,
        elevation: 3,

        backgroundColor: Color(maincolor),

        actions: [
          IconButton(onPressed: (){

          }, icon:
          FaIcon(FontAwesomeIcons.github,size: 35,color: Colors.black,),



          ),
          Container(width: 20,),
          IconButton(onPressed: (){

          }, icon:
          FaIcon(FontAwesomeIcons.blog,size: 35,color: Colors.black,),



          ),
        ],

      ),


      body: CustomScrollView(

        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child:  Column(


              children: [

                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child:
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width:400,
                                height: 100,
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.starAndCrescent,size: 50,color: Colors.yellow,),
                                    Text("KOKO입니다",
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontFamily: 'hambak'
                                      ),),
                                  ],
                                )

                            )
                          ],
                        )
                      ],
                    ),
                  )
                  ,
                ),




                intro_item(percent: 0.5,title_font_size: 27,font_size: 15,),
                contact(percent: 0.5,title_font_size: 27,font_size: 15,),
                skill_item(percent: 0.5,title_font_size: 27,font_size: 15,),
                edcation_item(percent: 0.5,title_font_size: 27,font_size: 15),

                awards_item(percent: 0.5,title_font_size: 27,font_size: 15),
                summary_project(percent: 0.5,title_font_size: 27,font_size: 15),











              ],
            ),

          )
        ]
        ,
      ),

    );
  }
}
