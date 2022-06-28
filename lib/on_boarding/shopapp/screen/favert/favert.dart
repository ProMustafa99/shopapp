

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/cubit_shop/cubit_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/states/state_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/model/model_favorite/Get_favorate.dart';
import 'package:shop_spp_section8/pac_news_App/components/components.dart';


class favert_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<shopCubit ,ShopStates>(
      listener: (context , state){},
      builder:(context , state){
        return ConditionalBuilder(
          condition:state is!shopLoading_Getfavorates_State ,
          builder: (BuildContext context)=>ListView.separated
              (
                itemBuilder: (context , index)=>favert_item(shopCubit.get(context).favorite_item.data!.data![index] , context),
                separatorBuilder: (context ,index)=>myDiveder(),
                itemCount:shopCubit.get(context).favorite_item.data!.data!.length
              ), fallback: (BuildContext context)=>Center(child: CircularProgressIndicator(),),

        );
      },

    );
  }

  Widget favert_item(Data_favorat fav , context)=>Padding(
    padding: EdgeInsets.all(25.0),
    child: Container(
      height: 100,
      child: Row
        (
        children:
        [
          Image(
            image: NetworkImage('${fav.product!.image}'),
            width: 150,
            height: 150,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children:
              [
                Text('${fav.product!.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),

                ),
                SizedBox(height: 5,),
                Expanded(child: Row(
                  children:  [
                    Text('${fav.product!.price}'),
                    SizedBox(width: 9,),
                    Text('${fav.product!.oldPrice}' , style:TextStyle(decoration: TextDecoration.lineThrough ,color: Colors.grey ),)

                  ],

                )),
              ],
            ),
          ),
          IconButton
            (
            onPressed: ()
            {
               shopCubit.get(context).changfavorites(fav.product!.id);
              //print(model_pr.id);

            },
            icon: CircleAvatar(
              backgroundColor: shopCubit.get(context).favoraites[fav.product!.id]? Colors.red:Colors.grey,
                radius:15.0,
                child: Icon
                  (
                  Icons.favorite_border,
                  color: Colors.white,
                )
            ),

          ),
        ],


      ),
    ),
  );
}
