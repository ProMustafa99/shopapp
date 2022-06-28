import 'package:shop_spp_section8/on_boarding/model/Register_model/Register_model.dart';

abstract class ShopRegisterState{}

class ShopRegisterInitialState extends ShopRegisterState{}

class ShopRegisterLoadinglState extends ShopRegisterState{}


class ShopRegisterSuccessState extends ShopRegisterState
{
  final RegisterModel loginModel_user;
  ShopRegisterSuccessState(this.loginModel_user);
}

class ShopRegisterErrorState extends ShopRegisterState{

  final String Error;
  ShopRegisterErrorState(this.Error);

}