
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class intro_item extends StatefulWidget {
  const intro_item({Key? key,this.percent,this.title_font_size,this.font_size}) : super(key: key);

  final title_font_size;
  final font_size;
  final percent;
  @override
  State<intro_item> createState() => _intro_itemState();
}

class _intro_itemState extends State<intro_item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
         width: MediaQuery.of(context).size.width*widget.percent,
         child: Row(
           children: [
             FaIcon(FontAwesomeIcons.handPointRight,size: widget.title_font_size*1.5,)
             ,
             Container(width: 10,)
             ,
             Text("About Me",style: TextStyle(
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

        Container(
          width: MediaQuery.of(context).size.width*widget.percent,
          height: 200,

          child: Row(
            children: [
              Flexible(
                  flex: 4,fit: FlexFit.tight,
                  child: Column(
                    children: [

                      Padding(padding: EdgeInsets.only(top: 50),

                        child: Text("Introduction",style: TextStyle(
                            fontFamily: 'hambak',
                            fontSize: widget.title_font_size
                        ),),)
                    ],
                  )),
              Flexible(
                  flex:4,
                  fit:FlexFit.tight,child: Column(
                children: [


            Expanded(child:

            ListView.builder(itemCount: 2,itemBuilder: (context,index){
              return  Padding(
                padding:  EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Flexible(child:
                    ListTile(leading: Icon(Icons.circle,size: 15,color: Colors.black,),title: Text("sssssadsadsadsadsadsadsadsadsadsadasdssssssssssssssss",
                    style: TextStyle(fontSize: 13),),)
                    )

                  ],
                ),
              );

            })
            )







                ],
              ))
            ],
          ),


        ),
      ],
    );
  }
}
