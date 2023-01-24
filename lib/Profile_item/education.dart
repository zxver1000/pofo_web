
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


var font_size=1.0;
var title_font_size=1.0;
class edcation_item extends StatefulWidget {
  const edcation_item({Key? key,this.percent,this.title_font_size,this.font_size}) : super(key: key);
final title_font_size;
final font_size;
  final percent;
  @override
  State<edcation_item> createState() => _edcation_itemState();
}

class _edcation_itemState extends State<edcation_item> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    font_size=widget.font_size;
    title_font_size=widget.title_font_size;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*widget.percent,
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.flag,size: title_font_size*1.5,color:Colors.black
                )
              ,
              Container(width: 10,)
              ,
              Text("Education",style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: title_font_size,
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

                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "KonKuk University",style: TextStyle(
                                  fontFamily: 'hambak',
                                  fontSize: title_font_size
                              ),),

                            ]
                          ),
                        ),),    Text("(2017.01.01~2020.01.01)",style: TextStyle(

                        fontSize: title_font_size*0.4
                      ),)

                    ],
                  )),


              Flexible(
                  flex:4,
                  fit:FlexFit.tight,child: Column(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Container(
                          height: 20,
                          width: 1,
                          child: Text(""),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:2.0),
                          child: Icon(Icons.circle,size:10),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Major in Computer Science and Enginerring.',
                            style: TextStyle(
                              fontSize: font_size
                            ),
                          ),
                        ),
                      ],
                    ),
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
