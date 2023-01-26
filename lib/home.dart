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
import 'main.dart';
import 'dart:convert';
import 'version2/main_Screen/main_pad.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {



  Future<int> dataset()async {

    var ss=context.read<user>().user_information.header;
    if(ss!="22")
      {
        return 1;
      }


    String json = await rootBundle.loadString('assets/server.json');
    final jsonResponse = jsonDecode(json);
    context.read<server>().setserver(jsonResponse['server']);
    print("서버완료");
    var server_url = "http://" + context.read<server>().http_server_name + "api/page/welcome";
    print(server_url);
    Uri uri = Uri.parse(server_url);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    //서버 data 셋팅
    var res = await http.get(uri, headers: headers);
    if (res.statusCode == 200) {
      // print("zd");
      var datas = utf8.decode(res.bodyBytes);
      //print(datas);

      var sd = jsonDecode(datas);
      //print(sd['data'][0]);
      var header = sd['data'][0]['HEADER'].toString();
      Map<String, List<String>>introduction = {};

      List<String>contact = [];
      //print(sd['data'][0]['ABOUT_ME']);
      for (var next1 in sd['data'][0]['ABOUT_ME'].keys) {
        List<String>abouts = [];
        for (var next2 in sd['data'][0]['ABOUT_ME'][next1]) {
          // print(next2);
          abouts.add(next2);
        }
        introduction[next1] = abouts;
      }

      Map<String, List<String>>skill = {};

      for (var next1 in sd['data'][0]['SKILLS'].keys) {
        List<String>sk=[];
        for (var next2 in sd['data'][0]['SKILLS'][next1]) {
          // print(next2);
          sk.add(next2);
        }
        skill[next1] = sk;
      }
     // print(skill);

      Map<String, String>awards = {};
      //print(sd['data'][0]['AWARDS'][0]);
      for (var next1 in sd['data'][0]['AWARDS']) {
        for (var next2 in next1.keys) {
          awards[next2] = next1[next2];
        }
      }


      Map<String, String>Education = {};
      //print(sd['data'][0]['EDUCATION']);
      Education['대학교'] = sd['data'][0]['EDUCATION']['대학교'];
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
    //  print("머해");

      context.read<user>().set_userinfo(header, introduction, skill, awards, Education);
      //print("인트로덕션");
     // print(introduction);
      //print("서버안됨?");
      return 1;
    }
    else {
      print("서버 읽어들이기 실패");
      return -1;
    }



  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future:dataset(),
        builder: (BuildContext context,AsyncSnapshot snapshot){

          if(snapshot.hasData==false||snapshot.data==-1){
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("서버와 연결중입니다 잠시만 기다려주세요!!"),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          }
          else if(snapshot.hasError) {
            return Text("서버와 연결되어있지않습니다");
          }
          else {
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

        });
  }
}
