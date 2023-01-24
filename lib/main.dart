import 'package:flutter/material.dart';

import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Desktop_ui.dart';
import 'package:pofol_web/mobile_ui.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import './Pad_ui.dart';
import 'ui_version2.dart';
import 'login_screen.dart';
import 'version2/main_Screen/main_desktop.dart';
import 'version2/main_Screen/main_mobile.dart';

import 'dart:convert';
import 'version2/main_Screen/main_pad.dart';

class user_info{
  var header;
  List<String>introduction=[];
  List<String>contact=[];
  Map<String,List<String>>skill={};
  Map<String,String>awards={};
  Map<String,List<String>>education={};

  user_info(this.header);
}
class user extends ChangeNotifier{
  var user_information=user_info("22");

  void set_userinfo(header,introduce,contact,skill,awards,education){
    user_information.header=header;
    user_information.introduction=introduce;
    user_information.contact=contact;
    user_information.skill=skill;
    user_information.awards=awards;
    user_information.education=education;
  }

}

class server extends ChangeNotifier{
  var http_server_name;

  void setserver(ss){
    http_server_name=ss;
  }
}
void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (c)=>server()),
        ChangeNotifierProvider(create: (c)=>user()),
      ],
        child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: mainScreen(),
    );
  }
}

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setserver();
  }

  void setserver() async{
    String json=await rootBundle.loadString('assets/server.json');
    final jsonResponse = jsonDecode(json);
    context.read<server>().setserver(jsonResponse['server']);
    print("서버완료");
    var server_url="http://"+context.read<server>().http_server_name+"page/welcome";
    print(server_url);
    Uri uri = Uri.parse(server_url);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    //서버 data 셋팅
    var res = await http.get(uri, headers: headers);
    if(res.statusCode==200)
      {
       // print("zd");
        var datas = utf8.decode(res.bodyBytes);
        //print(datas);

        var sd = jsonDecode(datas);
        //print(sd['data'][0]);
        var header=sd['data'][0]['HEADER'];
        Map<String,List<String>>introduction={};
        List<String>abouts=[];
        List<String>contact=[];
        //print(sd['data'][0]['ABOUT_ME']);
        for(var next1 in sd['data'][0]['ABOUT_ME'].keys)
          {
            abouts.clear();
         for(var next2 in sd['data'][0]['ABOUT_ME'][next1])
         {
          // print(next2);
           abouts.add(next2);
         }
         introduction[next1]=abouts;


          }

        Map<String,List<String>>skill={};
        for(var next1 in sd['data'][0]['SKILLS'].keys)
        {
          abouts.clear();
          for(var next2 in sd['data'][0]['SKILLS'][next1])
          {
            // print(next2);
            abouts.add(next2);
          }
          skill[next1]=abouts;


        }
       print(skill);

        Map<String,String>awards={};
        //print(sd['data'][0]['AWARDS'][0]);
        for(var next1 in sd['data'][0]['AWARDS'])
          {
            for(var next2 in next1.keys)
              {
                awards[next2]=next1[next2];
              }

          }


        Map<String,String>Education={};
        //print(sd['data'][0]['EDUCATION']);
        Education['대학교']=sd['data'][0]['EDUCATION']['대학교'];
        /*
        for(var next1 in sd['data'][0]['EDUCATION'])
        {
          print(next1);
          for(var next2 in next1.keys)
          {
            print("sd");
            print(next2);
            Education[next2]=next1[next2];
          }

        }
         */
        print(Education);
      }
    else
      {
        print("서버 읽어들이기 실패");
      }

  }


  @override
  Widget build(BuildContext context) {

    var currentwidth=MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth<700){
        return mainMobile();

      }
      else if(constraints.maxWidth<1000&& constraints.maxWidth>455)
      {
        print(constraints.maxWidth);
        return mainPad();
      }

      else
        {
          return mainDesktop();
        }

    }
    );
  }
}
