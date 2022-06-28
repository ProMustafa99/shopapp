
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/components/component.dart';
import 'package:shop_spp_section8/on_boarding/login/login.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/cubit_shop/cubit_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/states/state_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/search/search.dart';
import 'package:shop_spp_section8/pac_news_App/modules/search/search.dart';
class shopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit ,ShopStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var cubit =shopCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text('Salla'),
          actions:
          [
               IconButton(
                   onPressed:()
                   {
                     navigateto_page(context , shop_search_screen());
                   },
                icon: const Icon(Icons.search)),
          ],
          ),
          body: cubit.bootomscreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){ cubit.changBottom(index);},
            currentIndex:  cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings '),

            ],

          ),
        );
      },

    );
  }
}
