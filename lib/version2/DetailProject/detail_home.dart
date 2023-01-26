


import 'package:flutter/material.dart';

import 'detail_Desktop.dart';
import 'detail_mobile.dart';
import 'detail_pad.dart';
class detailHome extends StatefulWidget {
  const detailHome({Key? key}) : super(key: key);

  @override
  State<detailHome> createState() => _detailHomeState();
}

class _detailHomeState extends State<detailHome> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth<700){
        return detail_mobile();

      }
      else if(constraints.maxWidth<1000&& constraints.maxWidth>455)
      {
        //print(constraints.maxWidth);
        return detail_pad();
      }

      else
      {
        return detail_desktop();
      }

    }
    );
  }
}
