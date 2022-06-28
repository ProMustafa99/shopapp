import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_spp_section8/on_boarding/components/component.dart';
import 'package:shop_spp_section8/on_boarding/login/login.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModle
{
  final String image;
  final String title;
  final String body;
      BoardingModle({required this.image ,required this.title ,required this.body});

}

class on_boarding_screen extends StatefulWidget {
  @override
  State<on_boarding_screen> createState() => _on_boarding_screenState();
}

class _on_boarding_screenState extends State<on_boarding_screen> {
  List<BoardingModle> Boarding =[
    BoardingModle(
        image: 'assets/images/sh1.jpg',
        title: "Everything a home needs ",
        body:  ""

    ),
    BoardingModle(
        image: 'assets/images/sh2.jpg',
        title: "All-time discounts ",
        body:  "on Board 2 Body "

    ),
    BoardingModle(
        image: 'assets/images/sh4.jpg',
        title: "shopping online  ",
        body:  "There are all products"

    ),
  ];

    /*
        Important It is used to move between pages in page
        View or between Widget  other pages (boardcontrollar)
    */
  var boardcontrollar = PageController();
  bool isLast = false;
    void submit()
  {

        CachHelper_shop().saveData_Cash_helper(key: 'on Boarding', value: true).
        then((value) {
          if(value)
            {
              print(value);
              navigateto_shop(context , Shop_login());
            }

        }).catchError((e){print(e);});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton( onPressed: (){submit();}, child: const Text('Skip'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardcontrollar,
                onPageChanged:(int index){
                  if(index==Boarding.length-1)
                    {
                      setState(() {
                        isLast =true;
                      });
                    }
                  else{
                    setState(() {
                    isLast =false;
                  });}
                } ,
                itemBuilder: (context  , index)=>buildBoardingitem(Boarding[index]),
                itemCount: Boarding.length,

              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                   controller:boardcontrollar ,
                   count: Boarding.length,
                   effect: const ExpandingDotsEffect(
                     dotColor:Colors.grey,
                     dotHeight: 5,//Determines the height of the point
                     dotWidth: 10,//Determines the width of the point
                     spacing: 5.0 //It determines the distance between the points

                   ),),
                Spacer(),
                FloatingActionButton(
                  onPressed:()
                    {
                      if(isLast==true)
                        {
                          submit();
                        }
                         else
                            {
                              /*
                                  Here we use the variable to access the pages
                                   We created an Object => of (PageController) And we used it (nextPage)
                              */
                              boardcontrollar.nextPage
                                (
                                  duration: Duration(milliseconds: 750),
                                  curve:Curves.fastLinearToSlowEaseIn
                                );

                              /* nextPage take two items
                                 The first Duration
                                 It is used to move between items
                                 The second Curves
                                 Navigation form
                              */

                            }

                    },

                  child: Icon(Icons.arrow_forward_ios_outlined),)
              ],
            )
          ],
        ),
      )

    );
  }

  Widget buildBoardingitem(BoardingModle modle)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children:
    [
      Expanded(child: Image.asset('${modle.image}')),
       Text('${modle.title} ' ,style: TextStyle(fontSize:24.5),),
       const SizedBox(height: 10,),
       Text('${modle.body}'),
    ],
  );
}
