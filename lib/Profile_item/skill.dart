
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



var percents=1.0;
var title_font_size1=1.0;
var font_size1=1.0;
class skill_item extends StatefulWidget {
  const skill_item({Key? key,this.percent,this.title_font_size,this.font_size}) : super(key: key);
final percent;
final title_font_size;
final font_size;
  @override
  State<skill_item> createState() => _skill_itemState();
}

class _skill_itemState extends State<skill_item> {
 @override
  void initState() {
    // TODO: implement initState
title_font_size1=widget.title_font_size;
font_size1=widget.font_size;
   percents=widget.percent;
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*widget.percent,
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.hammer,size: widget.title_font_size*1.5,)
              ,
              Container(width: 10,)
              ,
              Text("Tech Stack",style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: widget.title_font_size,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),
        )
        ,
        Container(
          width: MediaQuery.of(context).size.width*widget.percent,
          child:
          Divider(color: Colors.grey[300],height: 1.0,),
        ),




item()

      ],
    );
  }
}


class item extends StatefulWidget {
  const item({Key? key,this.percent}) : super(key: key);

  final percent;
  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*percents,
      height: 800,
      child: ListView.builder(
      itemCount: 4
      ,itemBuilder: (context,index){
        return  Container(
          width: MediaQuery.of(context).size.width*percents,
          height: 200,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  flex: 4,fit: FlexFit.tight,
                  child: Column(
                    children: [

                      Padding(padding: EdgeInsets.only(top: 50),

                        child: Text("Android",style: TextStyle(
                            fontFamily: 'hambak',
                            fontSize: title_font_size1
                        ),),),

                      Row(
                        children: [
                         Text("!")

                        ],
                      )

                    ],
                  )),
              Flexible(
                  flex:4,
                  fit:FlexFit.tight,child: Column(
                children: [



                  Expanded(child:

                  ListView.builder(itemCount: 2,itemBuilder: (context,index){
                    return  Padding(
                      padding:  EdgeInsets.only(top: 30.0),
                      child: Row(

                        children: [


                          Container(
                            height: 30,
                            width: 1,
                            child: Text(""),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Icon(Icons.circle,size:10),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              color: Colors.green,
                              width: 60,
                              child: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.react,size: font_size1*1.5,color: Colors.black,),
                                  Text("React",style: TextStyle(
                                    color: Colors.white
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

                  })
                  )
                ],
              ))
            ],
          ),


        );
      }),
    );
  }
}
