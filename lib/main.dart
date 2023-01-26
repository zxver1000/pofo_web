import 'package:flutter/material.dart';

import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pofol_web/Desktop_ui.dart';
import 'package:pofol_web/mobile_ui.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:flutter/services.dart';
import './Pad_ui.dart';
import 'ui_version2.dart';
import 'login_screen.dart';
import 'version2/main_Screen/main_desktop.dart';
import 'version2/main_Screen/main_mobile.dart';

import 'dart:convert';
import 'dart:io';
import 'version2/main_Screen/main_pad.dart';
class ProxiedHttpOverrides extends HttpOverrides {
  String _proxy;
  ProxiedHttpOverrides(this. _proxy);

  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return _proxy.isNotEmpty ? "PROXY $_proxy;" : 'DIRECT';
      }
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
  }
}
class user_info{
  var header;
  List<String>introduction=[];
  List<String>contact=[];
  Map<String,List<String>>skill={};
  Map<String,String>awards={};
  Map<String,String>education={};
  Map<String,List<String>>about={};

  user_info(this.header);
}

class project_info{
  var proejct_Role;
  var proejct_Preview;
  Map<String,List<String>>project_Detail={};
}

class user extends ChangeNotifier{
  var user_information=user_info("22");

  void set_userinfo(var header,var about,var skill,var awards,var education){
    user_information.header=header;
    user_information.about=about;
    user_information.skill=skill;
    user_information.awards=awards;
    user_information.education=education;
    notifyListeners();
  }

}
class project_list extends ChangeNotifier{
  List<project_info> project_array=[];

  void set_project(var proejct_list){
    project_array.add(proejct_list);
    notifyListeners();
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
        ChangeNotifierProvider(create: (c)=>project_list()),
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

  }


  @override
  Widget build(BuildContext context) {

    var currentwidth=MediaQuery.of(context).size.width;

    return home();
  }
}
