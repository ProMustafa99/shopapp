
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/pac_news_App/components/components.dart';
import 'package:shop_spp_section8/pac_news_App/modules/search/search.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/cubit.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/state.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>
        (
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewCubit().get(context);
          return Scaffold(
            appBar: AppBar(title:Text('News App'),
             actions: [
               IconButton( icon:Icon(Icons.search) ,
                 onPressed: (){
                   navigateto(context ,search_screen());

                 },),
               IconButton( icon:Icon(Icons.brightness_4_outlined) , onPressed: (){},),
             ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                    cubit.changBottomNavigationBar(index);
              },
              items: cubit.bottomItems,
            ),

          );
        },
    );
  }
}
