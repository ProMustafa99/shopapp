
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/components/component.dart';
import 'package:shop_spp_section8/on_boarding/login/cubit/cubit.dart';
import 'package:shop_spp_section8/on_boarding/login/cubit/states.dart';
import 'package:shop_spp_section8/on_boarding/model/Register_model/Register_model.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/Register/Registar_cubit/cubit_reg.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/Register/Registar_cubit/state_reg.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/shop_app_layout.dart';

class Register_screen extends StatelessWidget {

  var Email = TextEditingController();
  var username = TextEditingController();
  var phone = TextEditingController();
  var password1  = TextEditingController();
  var _forKey = GlobalKey<FormState>();


  Widget email()
  {
    return Padding(
      padding:EdgeInsets.all(5) ,
      child: TextFormField(
        controller: Email,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.email),
          border: OutlineInputBorder(),
          hintText: 'Enater You Email ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
          }
        },
      ),
    );

  }

  Widget Password()
  {
    bool isPassword = true;
    IconData ic = Icons.visibility;
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: password1,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: ()
            {

            },
            icon: Icon(ic),
          ),
          prefixIcon:Icon(Icons.vpn_key_rounded),
          border: OutlineInputBorder(),
          hintText: 'Enter Password',

        ),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some password';
          }
        },
      ),
    );

  }




  /*Widget User_Name()
  {
    return Padding(
      padding:EdgeInsets.all(5) ,
      child: TextFormField(
        controller: username,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.account_circle_rounded),
          border: OutlineInputBorder(),
          hintText: 'User Name  ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
          }
        },
      ),
    );

  }

  Widget Phone()
  {
    return Padding(
      padding:EdgeInsets.all(5) ,
      child: TextFormField(
        controller: phone,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.phone),
          border: OutlineInputBorder(),
          hintText: 'Phone',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter  Email';
          }
        },
      ),
    );

  }*/

  /*Widget button_sinup()
  {
    RegisterModel register =RegisterModel();
    // ignore: deprecated_member_use
    return BlocProvider(
        create: (BuildContext context )=>shopRegistarCubit(),
        child:BlocConsumer<shopRegistarCubit ,ShopRegisterState>
          (
          listener: (context , state)
          {
            if(state is ShopRegisterSuccessState)
            {
              if(state.loginModel_user.status ==true)
              {
                CachHelper_shop token =CachHelper_shop();
                print(state.loginModel_user.message);
                print(state.loginModel_user.data!.token);
                token.saveData_Cash_helper(key: 'token', value:state.loginModel_user.data!.token).
                then((value){navigateto_shop(context , shopLayout());} );
                //Tosta_mes(mess:state.loginModel.message ,color: Colors.green );
                /*
                      --improtmant--
                  What happened here we created an object from class(CachHelper_shop)
                  and through this object we reached the function (saveData)
                  through this function we saved the (token)
                  so that we do not have to login again

                  */

              }
              else
              {
                //print(state.loginModel.message);
                Tosta_mes(mess:state.loginModel_user.message.toString() ,color: Colors.red );
              }

            }
          },
          builder: (context , state)
          {
            return Container(
              width: 350,
              height: 70,
              child:  Padding(
                padding: EdgeInsets.all(5),
                child: ConditionalBuilder(
                  condition: state is !ShopRegisterLoadinglState,
                  builder: (context)=> RaisedButton(
                    onPressed: ()
                    {
                      if(_forKey.currentState!.validate())
                      {
                        //var user_name = username.text.trim();
                        var email = Email.text.trim();
                       // var Phone = phone.text.trim();
                        var password = password1.text.trim();
                        shopRegistarCubit.get(context).user_Register(email: email,name: 'dsa', phone: '231232', password: password);
                      }
                    },
                      child: Text('Create Account'),
                    color: Colors.blue,
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator(),),

                ),
              ),
            );
          },

        )


    );

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,

                ),
              ),
              SizedBox(height: 27,),
              email(),

            ],
          ),
        ),
      ),
    );
  }
}
