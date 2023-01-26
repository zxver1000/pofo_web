import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Profile_item/awards.dart';
import 'package:pofol_web/constants.dart';
import 'package:pofol_web/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Profile_item/summary_proejct.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
const maincolor=0xfffff9e9;


class mainPad extends StatefulWidget {
  const mainPad({Key? key}) : super(key: key);

  @override
  State<mainPad> createState() => _mainPadState();
}

class _mainPadState extends State<mainPad> {
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
                                    child: Text(context.read<user>().user_information.header,style: TextStyle(fontSize: 50,
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
                                    ListTile(leading: FaIcon(FontAwesomeIcons.personBooth,color: Colors.black,),title: Text("Developer"),),
                                        ListTile(leading: FaIcon(FontAwesomeIcons.github,color: Colors.black,),title: Row(
                                          children: [
                                            RichText(text:
                                            TextSpan(text: 'Git Hub',style: TextStyle(color: Colors.blue,fontSize: 17), recognizer: TapGestureRecognizer()..onTap = () async{
                                              // Single tapped.
                                              final url=context.read<user>().user_information.about['CONTACT']![0];
                                              //   const uri=Uri.parse(url);
                                              if(await canLaunch(url)){
                                                await launch(url);
                                              }else
                                              {
                                                print("안됨");
                                              }
                                            })
                                            )

                                          ],
                                        )

                                        ),

                                            ListTile(leading: FaIcon(FontAwesomeIcons.calendar,color: Colors.black,),title: Text("1996-09-01"),)
                                      ],
                                    )

                                    ),
                                    Flexible(fit: FlexFit.tight,child:
                                    Container(
                                      height: 145,

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListTile(leading: FaIcon(FontAwesomeIcons.blog,color: Colors.black,),title: Text("zxver@naver.com"),
                                          ),


                                        ],
                                      ),
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
                      Padding(padding: EdgeInsets.only(top: 10), child: Text(""),),
                      techStack(),
                      Padding(padding: EdgeInsets.only(top: 50), child: Text(""),),
                      awards(),
                      Padding(padding: EdgeInsets.only(top: 50), child: Text(""),),
                      summary_project(percent: 0.8,title_font_size: 27,font_size: 15),


                    ],
                  ),

                  new Positioned(
                    child: new Container(
                      width: 150,
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
  List<String>keys=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var k=context.read<user>().user_information.awards;
    for(var next in k.keys)
    {
      keys.add(next);
    }

  }
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
              height: 200.0*((context.read<user>().user_information.awards.length)/2).round(),
              width:  400,
              child: GridView.builder(
                  itemCount: context.read<user>().user_information.awards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    mainAxisExtent: 200,
                    mainAxisSpacing: 20, //수평 Padding
                    crossAxisSpacing: 20, //수직 Padding
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
                          Text(keys[index],style: TextStyle(
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

                  }),
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

            Image.network('http://3.34.117.122:3080/img/jpg/2017_samsung.jpg'),
            Container(
              height: 50.0*context.read<user>().user_information.about['INTRODUCTION']!.length,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: context.read<user>().user_information.about['INTRODUCTION']!.length
                  ,itemBuilder: (context,index){
                return   Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: RichText(
                        textAlign: TextAlign.center
                        ,text:TextSpan(
                        children:
                        [
                          TextSpan(text: context.read<user>().user_information.about['INTRODUCTION']![index],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300
                              )),

                        ]
                    )),
                  ),
                );

              }),
            )


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
                height: 50.0*context.read<user>().user_information.education.length,


                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context.read<user>().user_information.education.length
                    ,itemBuilder: (context,index){
                  return   Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(

                            children:
                            [
                              TextSpan(text: context.read<user>().user_information.education['대학교'],

                                  style: TextStyle(

                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,

                                  )),


                            ]
                        )),

                  );

                }),
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
  List<String>key_list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var key in context.read<user>().user_information.skill.keys)
    {
      key_list.add(key);
    }
    // print(key_list);

  }
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
              height: 260.0*(context.read<user>().user_information.skill.length/2),
              child: GridView.builder(
                  itemCount: context.read<user>().user_information.skill.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    mainAxisExtent: 250,
                    mainAxisSpacing: 10, //수평 Padding
                    crossAxisSpacing: 10, //수직 Padding
                  ),
                  itemBuilder: (context,index){
                    return    Column(
                      children: [
                        ListTile(leading: Text(""),title: Text(key_list[index].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'hambak',
                            fontSize: 17

                        ),),),

                        Container(
                          height: context.read<user>().user_information.skill[key_list[index]]!.length*60.0,
                          child: ListView.builder(
                              itemCount: context.read<user>().user_information.skill[key_list[index]]!.length
                              ,itemBuilder: (context,indexs){
                            return  ListTile(leading:Icon(Icons.check),title: Text(context.read<user>().user_information.skill[key_list[index]]![indexs].toString()),);

                          }),
                        )



                      ],
                    )
                    ;

                  }),
            )


          ],
        )
        ,

      ),
    );
  }
}

