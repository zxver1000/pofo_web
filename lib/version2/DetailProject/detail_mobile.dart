import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';


const maincolor=0xfffff9e9;

class detail_mobile extends StatefulWidget {
  const detail_mobile({Key? key}) : super(key: key);

  @override
  State<detail_mobile> createState() => _detail_mobileState();
}

class _detail_mobileState extends State<detail_mobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        flexibleSpace: Container(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("안녕하세요 :)",
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
      body: Text("mobile"),
    );
  }
}


