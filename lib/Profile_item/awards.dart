
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

class awards_item extends StatefulWidget {
  const awards_item({Key? key,this.percent,this.title_font_size,this.font_size}) : super(key: key);
final percent;
final title_font_size;
final font_size;
  @override
  State<awards_item> createState() => _awards_itemState();
}

class _awards_itemState extends State<awards_item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*widget.percent,
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.award,size: widget.title_font_size*1.5,)
              ,
              Container(width: 10,)
              ,
              Text(" Awards",style: TextStyle(
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
                  flex:4,
                  fit:FlexFit.tight,child: Column(
                children: [



                  Expanded(child:
                  ListView.builder(itemCount: 4,itemBuilder: (context,index){
                    return  Padding(
                      padding:  EdgeInsets.only(top: 25.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
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
                              padding: const EdgeInsets.only(top:3.0),
                              child: Icon(Icons.circle,size:10),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child:
                                InkWell(
                                    child: RichText(
                                      text: TextSpan(
                                          children:
                                          [TextSpan(text: 'Git Hub -> ',style: TextStyle(fontSize: widget.font_size)),
                                            TextSpan(text: 'https://www.naver.com',style: TextStyle(color: Colors.blue,
                                            fontSize: widget.font_size), recognizer: TapGestureRecognizer()..onTap = () async{
                                              // Single tapped.
                                              final url='https://www.naver.com';
                                              //   const uri=Uri.parse(url);
                                              if(await canLaunch(url)){
                                                await launch(url);
                                              }else
                                              {
                                                print("안됨");
                                              }
                                            })
                                          ]
                                      ),


                                    )

                                )
                            ),
                          ],
                        ),
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
