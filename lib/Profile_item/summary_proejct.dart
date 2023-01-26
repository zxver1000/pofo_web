
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import '../version2/DetailProject/detail_home.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/intro_item.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

var percents=1.0;
var font_size=1.0;
var title_font_size=1.0;
class summary_project extends StatefulWidget {
  const summary_project({Key? key,this.percent,this.title_font_size,this.font_size}) : super(key: key);

  final percent;
  final title_font_size;
  final font_size;
  @override
  State<summary_project> createState() => _summary_projectState();
}

class _summary_projectState extends State<summary_project> {
  var buttonCarouselController;

  List<proejct_item_mini>ss=[];

  @override
  void initState() {
    // TODO: implement initState
    percents=widget.percent;
    font_size=widget.font_size;
    title_font_size=widget.title_font_size;
    buttonCarouselController = CarouselController();
    ss.add(proejct_item_mini(index: "w",controller: buttonCarouselController,));
    ss.add(proejct_item_mini(index: "w",controller: buttonCarouselController,));
    ss.add(proejct_item_mini(index: "w",controller: buttonCarouselController,));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*widget.percent,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.file,size: title_font_size*1.5,color:Colors.black
                  )
                  ,
                  Container(width: 10,)
                  ,
                  Text("Project",style: TextStyle(
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

              margin: EdgeInsets.all(15),
              padding: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width*widget.percent,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius:1,
                      blurRadius: 1

                  )]
              )
              ,

              child: Column(

              children: [


                CarouselSlider(

                carouselController: buttonCarouselController
                ,items: ss, options: CarouselOptions(
                  autoPlay: false,
                  height: 600,
                  enlargeCenterPage: true,
                  viewportFraction: 0.98,
                  initialPage: 3,


                )),
              ],
    ),
            ),
          ],
        ),
      );
  }
}


class proejct_item_mini extends StatefulWidget {
  const proejct_item_mini({Key? key,this.index,this.controller}) : super(key: key);

  final index;
  final controller;
  @override
  State<proejct_item_mini> createState() => _proejct_item_miniState();
}

class _proejct_item_miniState extends State<proejct_item_mini> {
  var idx=1;

  var buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width*percents,
       height: 1500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: MediaQuery.of(context).size.width*0.03,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                InkWell(
                  onTap: ()=> widget.controller.previousPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: FaIcon(FontAwesomeIcons.angleLeft,size: font_size*1.7,)
                  ,
                )


              ],
            ),
          )
          ,

          Flexible(fit: FlexFit.tight,child:  Column(
            children: [

              MouseRegion(
                cursor: SystemMouseCursors.click,
                child:TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return detailHome();
                        }));
                  },
                  child: Text("AWS Project",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: title_font_size,
                  fontFamily: 'hambak',
                  color: idx==1?Colors.black:Colors.blue

                ),)),
                onHover: (PointerHoverEvent event)=>{
                 setState((){
                   idx=2;
                 })
                },
                onExit: (PointerExitEvent event)=>{
                  setState((){
                    idx=1;
                  })
                },
              ),

              Padding(padding: EdgeInsets.only(top: 5),
              child: Text("(2011-01-01~2023-02-21)"
              ,style: TextStyle(fontSize: title_font_size*0.4),),)

   ,
          Padding(padding: EdgeInsets.only(top: 32),
    child: Row(
      children: [
        Flexible(
fit: FlexFit.tight,

    child:
     Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.black),

       ),
       margin:EdgeInsets.all(30),

       child: Column(

          children: [



            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CarouselSlider(

                  carouselController: buttonCarouselController
                  ,items: [
                     Image.asset('assets/image/cloud.png',
                  fit: BoxFit.fill)
                  , Image.network('http://3.34.117.122:3080/img/jpg/2017_samsung.jpg',fit: BoxFit.fill,),
                    Text("1"),Text("2")
              ], options: CarouselOptions(
                autoPlay: false,
                height: 300,
                enlargeCenterPage: true,
                viewportFraction: 0.98,
                initialPage: 3,


              )),
            )
,

          Padding(
            padding: EdgeInsets.only(top:15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [
              InkWell(
                onTap: ()=> buttonCarouselController.previousPage(
                    duration: Duration(milliseconds: 300), curve: Curves.linear),
                child: FaIcon(FontAwesomeIcons.angleLeft,size: font_size*1.7,)
                ,
              ),
              Padding(
                padding: EdgeInsets.only(left:8.0),
                child: Text("1",style: TextStyle(fontSize: font_size),),
              ),
                Text("  /  ",style: TextStyle(fontSize: font_size),),
                Padding(
                  padding:  EdgeInsets.only(right:8.0),
                  child: Text("2",style: TextStyle(fontSize: font_size),),
                )
                ,
              InkWell(
                onTap: ()=> buttonCarouselController.nextPage(
                    duration: Duration(milliseconds: 300), curve: Curves.linear),
                child: FaIcon(FontAwesomeIcons.angleRight,size: font_size*1.7,)
                ,
              )
            ],),
          )
          ],
        ),
     ),


        ),
        Flexible(
            fit: FlexFit.tight
            ,child: Container(

              height: 400,
              child: Column(

          children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Role : ",textAlign: TextAlign.start,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                  Text(" Project Manager")
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tech Stack : ",textAlign: TextAlign.start,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
                Text(" AWS,Flutter,node js")
              ],
            ),



              Padding(padding: EdgeInsets.only(top: 20),
              child: Divider(color: Colors.grey[400],height: 1,),),



            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(text:TextSpan(
                  children:
                  [
                    TextSpan(text: '일반적인 음악 스트리밍 서비스에 가사, 단어를 통한 감정 분석, 음악 추천을 해주는 서비스',
                        style: TextStyle(
                            fontFamily: 'hambak',
                            fontSize: font_size,
                            fontWeight: FontWeight.w400
                        )),


                  ]
              )),
            ),
          ],
        ),
            ))

      ],
    ),

          )

            ],
          ))

          ,
    Container(
    width: MediaQuery.of(context).size.width*0.03,
    child: Row(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        InkWell(
          onTap: ()=> widget.controller.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear),
          child: FaIcon(FontAwesomeIcons.angleRight,size: font_size*1.7,)
          ,
        )


      ],
    ),
    )

,

        ],
      ),
    )
    ;
  }
}
