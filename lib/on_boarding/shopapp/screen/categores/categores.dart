

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/model/model_categories/model_categories.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/states/state_shop_app.dart';
import 'package:shop_spp_section8/pac_news_App/components/components.dart';

import '../../../shop_app_cubit/cubit_shop/cubit_shop_app.dart';

class categor_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit ,ShopStates>(
      listener: (context , state){},
      builder:(context , state){
        return ListView.separated
          (
             itemBuilder: (context , index)=>ItemCategore(shopCubit.get(context).cate.data!.data![index] , context),
             separatorBuilder: (context ,index)=>myDiveder(),
             itemCount: shopCubit.get(context).cate.data!.data!.length,
        );
      },

    );

  }
  Widget ItemCategore(Data_model cate , context)
  {
    return Padding
       (
         padding: EdgeInsets.all(20.0),
          child: Row
           (
              children:
               [
                 Image(image: NetworkImage('${cate.image}' ), width: 90.0, height: 80.0,),
                 SizedBox(width: 5,),
                 Text('${cate.name}' ,style:Theme.of(context).textTheme.bodyText1,),
                 Spacer(),
                 Icon(Icons.arrow_forward_ios),
               ],
           ),
       );
  }
}
