import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/web_view/web_view.dart';

Widget builderArticalItem(var articles , context)=>InkWell(
  onTap: (){
    navigateto(context, view_web_screen(articles['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image:  DecorationImage(

                image: NetworkImage('${articles['urlToImage']}'),

                fit: BoxFit.cover),

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

            child: Container(

              height: 120,

              child: Column(

                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,

                children:  [

                  Expanded(

                    child: Text(

                      '${articles['title']}',

                        style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 4,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    '${articles['publishedAt']}',

                    style: TextStyle(color:Colors.grey),

                  )

                ],

              ),

            )),

      ],

    ),

  ),
);

Widget myDiveder ()=>Divider(
  height: 20,
  thickness: 5,
  indent: 20,
  endIndent: 0,
  color: Colors.grey,
);
Widget wether(var list)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
            image:  DecorationImage(
              image: NetworkImage(''),
              fit: BoxFit.cover),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    '${list['temp'] as Map}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${list['temp']as Map}',
                  style: TextStyle(color:Colors.grey),
                )
              ],
            ),
          )),
    ],
  ),
);

void navigateto(context, Widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Widget,));

