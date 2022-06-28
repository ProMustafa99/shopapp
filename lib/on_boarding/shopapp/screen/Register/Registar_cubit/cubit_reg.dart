import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_spp_section8/on_boarding/login/cubit/states.dart';
import 'package:shop_spp_section8/on_boarding/model/Register_model/Register_model.dart';
import 'package:shop_spp_section8/on_boarding/model/login_model/login_model.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/end_points.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/dio_helper_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/Register/Registar_cubit/state_reg.dart';

class shopRegistarCubit extends Cubit<ShopRegisterState>
{
  shopRegistarCubit() : super (ShopRegisterInitialState());

  static shopRegistarCubit get(context)=>BlocProvider.of(context);

  void user_Register({required String name , required String email , required String phone , required String password })
  {
    RegisterModel Regtatr;// create object from RegisterModel
    emit(ShopRegisterLoadinglState());
    DioHelper.postdata(url:sinup,
        data:{
          'name':name,
          'email':email ,
          'phone':phone,
          'password':password}).
    then
      (
            (value){
          print('*****************Data Here **********************');
          print(value.data);
          Regtatr =RegisterModel.fromJson(value.data);
          emit(ShopRegisterSuccessState(Regtatr));
          print('*****************Data Here **********************');
        }).
    catchError((e){
      print("***************Error Here ********************");

        print(e);
        emit(ShopRegisterErrorState(e.toString()));

       print("***************Error Here ********************");
    });

  }

}