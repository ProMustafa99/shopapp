import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shop_spp_section8/pac_news_App/components/components.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/cubit.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/state.dart';


class Business_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit , NewsStates>(
        listener: (context, state){},
        builder: (context, state)
          {
            var list =NewCubit().get(context).business;
             return ConditionalBuilder(
               condition:state is!NewsLoadingState ,
               builder: (context ) =>
                   ListView.separated
                     (
                       itemBuilder: (context , index)=>builderArticalItem(list [index],context),
                       separatorBuilder: (context , index)=>myDiveder(),
                       itemCount: list.length
                   ),
               fallback: (context) => Center(child:CircularProgressIndicator()),
             );
          }

    );
  }
}
