import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:carousel_slider/carousel_slider.dart';
const maincolor=0xfffff9e9;



class mainMobile extends StatefulWidget {
  const mainMobile({Key? key}) : super(key: key);

  @override
  State<mainMobile> createState() => _mainMobileState();
}

class _mainMobileState extends State<mainMobile> {

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

              Text("안녕하세요 :) Mobile",
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
                        height: topWidgetHeight*1.7,
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
                                    child: Text("김민철",style: TextStyle(fontSize: 45,
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
                                        ListTile(leading: FaIcon(FontAwesomeIcons.personBooth,color: Colors.black,),title: Text("Developer"),

                                        ),

                                        ListTile(leading: FaIcon(FontAwesomeIcons.github,color: Colors.black,),title: Text("zxver1000"),

                                        ),
                                        ListTile(leading: FaIcon(FontAwesomeIcons.calendar,color: Colors.black,),title: Text("1996-09-01"),),
                                        ListTile(leading: FaIcon(FontAwesomeIcons.blog,color: Colors.black,),title: Text("www.naver.com"),

                                        ),


                                      ],
                                    )

                                    ),




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
                      summary_project(percent: 0.8,title_font_size: 27,font_size: 15),


                    ],
                  ),

                  new Positioned(
                    child: new Container(
                      width: 120,
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

class awards extends StatefulWidget {
  const awards({Key? key}) : super(key: key);

  @override
  State<awards> createState() => _awardsState();
}

class _awardsState extends State<awards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,


        child: Column(

          children: [

            Row(
              children: [
                FaIcon(FontAwesomeIcons.award,size: 45,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Awards",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                      fontFamily: 'hambak',
                      color: Colors.blue[500]
                  ),),
                ),
              ],
            ),
            Divider(height: 20,color: Colors.grey[500],),
            Container(
              height: 500,
              child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    mainAxisExtent: 250,
                    mainAxisSpacing: 30, //수평 Padding
                    crossAxisSpacing: 30, //수직 Padding
                  ),
                  itemBuilder: (context,index){
                    return    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1
                        ),

                      ),
                      child: Column(
                        children: [
                          Text("Awards 헤커톤 금상",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'hambak',
                              fontSize: 20

                          ),),
                          Text("2011~2001"),
                          Container(
                              height: 150,
                              child: Image.asset('assets/image/cloud.png',fit:BoxFit.fitHeight ,)),

                        ],
                      ),
                    )
                    ;

                  })
              ,
            )
          ],
        )
        ,

      ),
    );
  }
}


class introduce extends StatefulWidget {
  const introduce({Key? key}) : super(key: key);

  @override
  State<introduce> createState() => _introduceState();
}

class _introduceState extends State<introduce> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,

        child: Column(

          children: [

            Row(
              children: [
                FaIcon(FontAwesomeIcons.handPointRight,size: 45,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Introduce",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                      fontFamily: 'hambak',
                      color: Colors.blue[500]
                  ),),
                ),
              ],
            ),
            Divider(height: 20,color: Colors.grey[500],),

            Padding(padding: EdgeInsets.only(top: 20),
              child: RichText(text:TextSpan(
                  children:
                  [
                    TextSpan(text: '안녕하세요!! 반갑습니다 항상 긍정적으로 노력하는 개발자입니다.',
                        style: TextStyle(

                            fontSize: 17,
                            fontWeight: FontWeight.w300
                        )),


                  ]
              ))
              ,)


          ],
        )
        ,

      ),
    );
  }
}


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

          child: Column(

            children: [

              Row(
                children: [
                  FaIcon(FontAwesomeIcons.flag,size: 45,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Education",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                        fontFamily: 'hambak',
                        color: Colors.blue[500]
                    ),),
                  ),
                ],
              ),
              Divider(height: 20,color: Colors.grey[500],),


              Container(
                height: 200,
                child:  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2
                    ,itemBuilder: (context,index){
                  return  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20),
                        child: RichText(text:TextSpan(
                            children:
                            [
                              TextSpan(text: '건국대학교 컴퓨터공학부 ',
                                  style: TextStyle(

                                      fontSize: 20,
                                      fontWeight: FontWeight.w300
                                  )),
                              TextSpan(text: '졸업'),
                              TextSpan(text: '(2015.02~2020.02)')


                            ]
                        ))
                        ,),
                    ],
                  );
                })
                ,
              )


            ],
          )
          ,

        ),
      );
  }
}

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


        child: Column(

          children: [


            Row(
              children: [
                FaIcon(FontAwesomeIcons.hammer,size: 45,color: Colors.black,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Tech Stack",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                      fontFamily: 'hambak',
                      color: Colors.blue
                  ),),
                ),
              ],
            ),
            Divider(height: 20,color: Colors.grey[500],),

            Container(
              height: 500,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    mainAxisExtent: 230,
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

                      ],
                    )
                    ;

                  })
              ,
            )


          ],
        )
        ,

      ),
    );
  }
}


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
              margin: EdgeInsets.all(10),
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
                    height: 750,
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
      height: 1900,
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

          Flexible(fit: FlexFit.tight,child:  Container(
            height: 1800,
            child: Column(
              children: [

                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child:TextButton(
                      onPressed: (){
                        print("@");
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
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Role : ",textAlign: TextAlign.start,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),),
                          Text(" Project Manager")
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              TextSpan(text: '일반적인 음악 스트리밍 서비스에 가사, 단어를 통한 감정 분석, 음악 추천을 해주는 서비스일반적인 음악 스트리밍 서비스에 가사, 단어를 통한 감정 분석, 음악 추천을 해주는 서비스일반적인 음악 스트리밍 서비스에 가사, 단어를 통한 감정 분석, 음악 추천을 해주는 서비스',
                                  style: TextStyle(
                                      fontFamily: 'hambak',
                                      fontSize: font_size,
                                      fontWeight: FontWeight.w400
                                  )),


                            ]
                        )),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: CarouselSlider(

                            carouselController: buttonCarouselController
                            ,items: [
                          Image.asset('assets/image/cloud.png',
                              fit: BoxFit.fill)
                          , Image.asset('assets/image/cloud.png',
                              fit: BoxFit.fill),
                          Text("1"),Text("2")
                        ], options: CarouselOptions(
                          autoPlay: false,
                          height: 330,
                          enlargeCenterPage: true,
                          viewportFraction: 0.98,
                          initialPage: 3,


                        )),
                      )
,
                      Padding(
                        padding: EdgeInsets.only(top:5.0),
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
                      ),

                    ],
                  ),

                )

              ],
            ),
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