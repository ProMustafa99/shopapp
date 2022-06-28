import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_spp_section8/on_boarding/login/cubit/states.dart';
import 'package:shop_spp_section8/on_boarding/model/login_model/login_model.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/end_points.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/dio_helper_shop_app.dart';

import '../../model/login_model/login_model.dart';

class shopLoginCubit extends Cubit<ShopLoginState>
{
  shopLoginCubit() : super (ShopLoginInitialState());

  static shopLoginCubit get(context)=>BlocProvider.of(context);

  void user_login({required String email , required String password})
  {
    loginModel modeldata;// create object from shop_LoginModel
    emit(ShopLoginLoadinglState());
    DioHelper.postdata(url:LOGIN, data:{'email':email , 'password':password}).
    then
      (
            (value){
              print('*****************Data Here **********************');
              print(value.data);
              modeldata =loginModel.fromJson(value.data);
              emit(ShopLoginSuccessState(modeldata));
             print('*****************Data Here **********************');
            }).
    catchError((e){
      print("***************Error Here ********************");
      print(e); emit(ShopLoginErrorState(e.toString()));
      print("***************Error Here ********************");
    });

  }

}