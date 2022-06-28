
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/cubit.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/state.dart';

import '../../components/components.dart';


import '../../components/components.dart';
class search_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var search = TextEditingController();
    return BlocConsumer<NewCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var  list =NewCubit().get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children:[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      onChanged: (value_text)
                      {
                       NewCubit().get(context).getsearch(value_text);
                      },
                      controller: search,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        prefixIcon:Icon(Icons.search),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.separated
                      (
                        itemBuilder: (context , index)=>builderArticalItem(list [index],context),
                        separatorBuilder: (context , index)=>myDiveder(),
                        itemCount: list.length
                    ),
                  ),
                ],
              ),
            ),
          );
        }

    );
  }
}
