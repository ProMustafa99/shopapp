import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/pac_news_App/modules/business/business_screen.dart';
import 'package:shop_spp_section8/pac_news_App/modules/science/science_screen.dart';
import 'package:shop_spp_section8/pac_news_App/modules/sports/sport_screen.dart';
import 'package:shop_spp_section8/pac_news_App/modules/wethers/wether_screen.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/state.dart';
import 'package:shop_spp_section8/pac_news_App/remote/dio_helper.dart';

class NewCubit extends Cubit<NewsStates>
{
  NewCubit(): super(NewInitialState());
   NewCubit get(context)=>BlocProvider.of(context);
  int currentIndex =0;
  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem
      (
        icon: Icon(Icons.business),
        label:'Business',
      ),
    BottomNavigationBarItem
      (
      icon: Icon(Icons.sports),
      label:'Sports',
    ),
    BottomNavigationBarItem
      (
      icon: Icon(Icons.science),
      label:'Science',
    ),

   BottomNavigationBarItem
      (
      icon: Icon(Icons.settings),
      label:'Settings',
    ),
  ];
  List<Widget> screen=[
    Business_Screen(),
    sport_screen(),
    Science_Screen(),
    wether_screen(),
  ];
  void changBottomNavigationBar(int index){
    currentIndex = index;
    if(index==1){getsports();}
    if(index==2){getsscience();}
    if(index==3){getanything();}
    emit(NewBottomNavState());
  }

  List<dynamic> business =[];

  void getBusiness()
    {
      emit(NewsLoadingState());
      String x="9873855e3a114fb0acd5e2a4dc726d91";
      DioHelper.getdata(
          url:'https://newsapi.org/v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'business',
            'apiKey':'${x.toString()}',
          }

      ).then((value)
        {
          business= value.data['articles'];
          print(business[0]['title']);
          emit(NewsGetBusinessSuccessState());
        })
          .catchError((e){
        print("******************Error Here ********************");
        print(e.toString());
        print("******************Error Here ********************");
        emit(NewsGetBusinessSuccessErrorState(e.toString()));

      });


    }

  List <dynamic> sports=[];
  void getsports()
  {
    emit(NewsLoadingsportState());
    if(sports.length==0)
      {
        String x="9873855e3a114fb0acd5e2a4dc726d91";
        DioHelper.getdata(
            url:'https://newsapi.org/v2/top-headlines',
            query:
            {
              'country':'eg',
              'category':'sports',
              'apiKey':'${x.toString()}',
            }

        ).then((value)
        {
          sports= value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetsportSuccessState());
        })
            .catchError((e){
          print("******************Error Here ********************");
          print(e.toString());
          print("******************Error Here ********************");
          emit(NewsGetsportSuccessErrorState(e));

        });

      }else{
      emit(NewsGetsportSuccessState());
    }
  }


  List <dynamic> science=[];

  void getsscience()
  {
    emit(NewsLoadingsportState());
    if(science.length==0)
    {
      String x="9873855e3a114fb0acd5e2a4dc726d91";
      DioHelper.getdata(
          url:'https://newsapi.org/v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'science',
            'apiKey':'${x.toString()}',
          }

      ).then((value)
      {
        science= value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetsportSuccessState());
      })
          .catchError((e){
        print("******************Error Here ********************");
        print(e.toString());
        print("******************Error Here ********************");
        emit(NewsGetsportSuccessErrorState(e));

      });

    }else{
      emit(NewsGetsportSuccessState());
    }
  }

  List <dynamic> wether =[];
  Map <String ,dynamic>  ss ={};
  void getwether()
  {
    emit(NewsLoadingwetherState());
    if(wether.length==0)
    {
      String x="5d37acabd3ebf997768b4c1693291fd6";
      DioHelper_wether.getdata(
          url:'https://api.openweathermap.org/data/2.5/weather?q=London&appid=${x}',
          query:
          {
          }

      ).then((value)
      {
        wether= value.data['weather'];
        print('****************output*********');
        print(wether[0]['description']);
        print('****************output*********');
        emit(NewsGetwetherSuccessState());
      })
          .catchError((e){
        print("******************Error Here ********************");
        print(e.toString());
        print("******************Error Here ********************");
        emit(NewsGetwetherSuccessErrorState(e));

      });

    }else{
      emit(NewsGetwetherSuccessState());
    }
  }


  List <dynamic> search =[];
  void getsearch(String search_text)
  {
    String x="9873855e3a114fb0acd5e2a4dc726d91";
    emit(NewsLoadingSeacrhState());
    DioHelper.getdata(
        url:'https://newsapi.org/v2/everything',
        query:
        {
          'q':'${search_text}',
          'apiKey':'${x.toString()}',
        }

    ).then((value)
    {
      search= value.data['articles'];
       print(search[0]['title']);
      emit(NewsSeaechSuccessState());
    })
        .catchError((e){
      print("******************Error Here ********************");
      print(e.toString());
      print("******************Error Here ********************");
      emit(NewsSeacrhSuccessErrorState(e));

    });
  }

  List <dynamic> anythikg=[];

  void getanything()
  {
    emit(NewsLoadingsportState());
    if(anythikg.length==0)
    {
      String x="7ec23a955b0b43d28e682c55c6ce9eb7";
      DioHelper.getdata(
          url:'https://newsapi.org/v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'science',
            'apiKey':'${x.toString()}',
          }

      ).then((value)
      {
        anythikg= value.data['articles'];
        print(anythikg[0]['title']);
        emit(NewsGetsportSuccessState());
      })
          .catchError((e){
        print("******************Error Here ********************");
        print(e.toString());
        print("******************Error Here ********************");
        emit(NewsGetsportSuccessErrorState(e));

      });

    }else{
      emit(NewsGetsportSuccessState());
    }
  }



}
