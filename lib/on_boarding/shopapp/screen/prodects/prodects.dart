

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/model/home_model/home_model.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/cubit_shop/cubit_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/states/state_shop_app.dart';
import 'package:carousel_slider/carousel_slider.dart';
class ProdectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit ,ShopStates>(
        listener: (context , state){},
        builder:(context , state){
          return ConditionalBuilder
            (
              condition: state is !shopLoadingHomeState,
              builder:(context)=> Prodects_bulider(shopCubit.get(context).homeModel , context) ,
              fallback: (context)=>Center(child: CircularProgressIndicator(),),

          );
        },

    );
  }

  Widget Prodects_bulider(HomeModel model ,context)=>SingleChildScrollView(
    child: Column(
      children:
      [
        CarouselSlider(items:model.data?.banners?.map((e) =>
            Image(
              image: NetworkImage('${e.image}',),
             // fit: BoxFit.cover,
             width: double.infinity,
            )).toList(),
            options: CarouselOptions(
              height: 280.0,
              aspectRatio: 1/5,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval:Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,

            )
        ),
        const SizedBox(height: 15,),
           GridView.count
            (
             crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1/1.9,//الطول والعرض

              shrinkWrap: true ,
              physics: NeverScrollableScrollPhysics(),
               padding: EdgeInsets.only(left: 24 , right: 24),
               children:List.generate(model.data!.products!.length, (index)=>Prodects(model.data!.products![index] , context)),
            ),


      ],

    ),
  );

  Widget Prodects(Products model_pr , context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
      [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              if(model_pr.discount!=0)
                Container(
                child: Text('Discount' , style: TextStyle(backgroundColor: Colors.red , color: Colors.white , fontSize: 13),),
              ),

              Image(
              image: NetworkImage('${model_pr.image}'),
              width:double.infinity,
              height: 140,
            ),


            ],
          ),
          Text('${model_pr.name}',maxLines: 2, overflow: TextOverflow.ellipsis, style:TextStyle(fontSize: 12 , color:Colors.black),),
          SizedBox(height: 2,),
          Row
            (
              mainAxisAlignment: MainAxisAlignment.end,
              children:
              [
                IconButton
                  (
                    onPressed: ()
                    {
                      shopCubit.get(context).changfavorites(model_pr.id);
                      print(model_pr.id);
                      
                    },
                    icon: CircleAvatar(
                      backgroundColor: shopCubit.get(context).favoraites[model_pr.id]? Colors.red:Colors.grey,
                        radius:15.0,
                        child: Icon
                          (
                            Icons.favorite_border,
                            color: Colors.white,
                          )
                      ),

                ),
                Spacer(),
                Text('${model_pr.price} : السعر'),
              ],


            ),
        if(model_pr.discount!=0)
          Text('${model_pr.oldPrice}',
            style:TextStyle(decoration: TextDecoration.lineThrough ,color: Colors.grey ),),
      ],

    );
  }


}
