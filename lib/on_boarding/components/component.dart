
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
         --Important--
  In this method, when I reach the required page,
  all the pages behind it are deleted,
  meaning that the previous pages cannot be reached
 */
void navigateto_shop(context, Widget)=> Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=>Widget,),
            (Route<dynamic> route){return false;});

Widget myDiveder ()=>Divider(
  height: 20,
  thickness: 5,
  indent: 20,
  endIndent: 0,
  color: Colors.grey,
);

void navigateto_page(context, Widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Widget,));

void Tosta_mes({required String mess ,  Color? color})=>Fluttertoast.showToast(
    msg: mess,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor:color,
    textColor: Colors.white,
    fontSize: 16.0
);