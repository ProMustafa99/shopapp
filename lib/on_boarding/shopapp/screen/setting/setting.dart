

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/comment/comment.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/cubit_shop/cubit_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/states/state_shop_app.dart';

class setting_screen extends StatelessWidget {

  var Email = TextEditingController();

  var Name = TextEditingController();

  var Phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit ,ShopStates>(
      listener: (context, state)=>{},
      builder: (context, state){
        var model = shopCubit.get(context).user_info;
        Name.text = model.data!.name!;
        Email.text = model.data!.email!;
        Phone.text = model.data!.phone!;

        return ConditionalBuilder(
          condition:shopCubit.get(context).user_info !=null,
          builder: (BuildContext context)=>info(context),
          fallback: (BuildContext context) {return Center(child: CircularProgressIndicator());},

        );
      },
    );
  }

  Widget email()
  {
    return Padding(
      padding:EdgeInsets.all(5) ,
      child: TextFormField(
        controller: Email,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.email),
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
          }
        },
      ),
    );

  }

  Widget User_Name()
  {

    IconData ic = Icons.visibility;
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: Name,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.account_circle_rounded),
          border: OutlineInputBorder(),
          labelText: 'User Name',
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some password';
          }
        },
      ),
    );

  }

  Widget phone_info()
  {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: Phone,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.phone),
          border: OutlineInputBorder(),
          labelText: 'Phone',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some password';
          }
        },
      ),
    );

  }

  Widget Logout(context)
  {
    return Container(
      width: 330,
      height: 50,
      color: Colors.blueAccent,
      child: RaisedButton
        (
        onPressed: ()
        {
          remove_info(context);

        },
        child: Text('LOGOUT'),
        color: Colors.blue,

      ),
    );

  }

  Widget info(context)
  {

    return Padding(
        padding: EdgeInsets.all(10.0),
       child: Center(
         child: Column(
           children:
           [
             User_Name(),
             email(),
             phone_info(),
             SizedBox(height: 2,),
             Logout(context),

           ],
         ),
       ),

    );


  }
}
