import 'package:shop_spp_section8/on_boarding/model/login_model/login_model.dart';
import 'package:shop_spp_section8/on_boarding/model/login_model/login_model.dart';

import '../../model/login_model/login_model.dart';

abstract class ShopLoginState{}

class ShopLoginInitialState extends ShopLoginState{}

class ShopLoginLoadinglState extends ShopLoginState{}


class ShopLoginSuccessState extends ShopLoginState
{
  final loginModel loginModel_user;
  ShopLoginSuccessState(this.loginModel_user);
}

class ShopLoginErrorState extends ShopLoginState{

  final String Error;
  ShopLoginErrorState(this.Error);

}