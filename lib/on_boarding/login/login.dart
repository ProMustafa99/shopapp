
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_spp_section8/on_boarding/components/component.dart';
import 'package:shop_spp_section8/on_boarding/login/cubit/cubit.dart';
import 'package:shop_spp_section8/on_boarding/login/cubit/states.dart';
import 'package:shop_spp_section8/on_boarding/model/login_model/login_model.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/Register/register.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/shop_app_layout.dart';
class Shop_login extends StatefulWidget {
  @override
  State<Shop_login> createState() => _Shop_loginState();
}

class _Shop_loginState extends State<Shop_login> {
  var Email = TextEditingController();

  var Password = TextEditingController();

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

  Widget password()
  {
    bool isPassword = true;
    IconData ic = Icons.visibility;
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: Password,
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

  Widget button_login()
  {
    loginModel Login =loginModel();
    // ignore: deprecated_member_use
    return BlocProvider(

      create: (BuildContext context )=>shopLoginCubit(),
      child:BlocConsumer<shopLoginCubit ,ShopLoginState>
        (
          listener: (context , state)
          {
            if(state is ShopLoginSuccessState)
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
                  condition: state is !ShopLoginLoadinglState,
                  builder: (context)=> RaisedButton(
                    onPressed: ()
                    {
                      if(_forKey.currentState!.validate())
                      {
                        var email = Email.text.trim();
                        var password = Password.text.trim();
                        shopLoginCubit.get(context).user_login(email: email, password: password);
                      }
                    },

                    child:Text("Login",style:TextStyle(fontSize: 20),),
                    color: Colors.blueAccent,
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator(),),

                ),
              ),
            );
          },

        )


    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(3.0),
            child: Form(
              key: _forKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Image.asset('assets/images/login.jpg'),
                  const SizedBox(height: 10,),
                  email(),
                  const SizedBox(height: 10,),
                  password(),
                  const SizedBox(height: 10,),
                  button_login(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account' , style:Theme.of(context).textTheme.bodyText1,),
                      TextButton
                        (

                          onPressed: (){navigateto_page(context , Register_screen());},
                          child:Text("Create account ",style:Theme.of(context).textTheme.bodyText2,)
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
