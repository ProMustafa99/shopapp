import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_spp_section8/on_boarding/components/component.dart';
import 'package:shop_spp_section8/on_boarding/model/home_model/home_model.dart';
import 'package:shop_spp_section8/on_boarding/model/login_model/login_model.dart';
import 'package:shop_spp_section8/on_boarding/model/model_categories/model_categories.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/dio_helper_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/states/state_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/categores/categores.dart';
import 'package:shop_spp_section8/on_boarding/model/model_favorite/Get_favorate.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/favert/favert.dart';
import 'package:shop_spp_section8/on_boarding/model/model_favorite/model_favert.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/prodects/prodects.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/screen/setting/setting.dart';

import '../../model/model_categories/model_categories.dart';
import '../../network_shopapp/end_points.dart';

class shopCubit extends Cubit<ShopStates>
{
  shopCubit():super(shopInitialState());

  static shopCubit get(context)=>BlocProvider.of(context);

  int currentIndex =0 ;
  List<Widget> bootomscreen=
  [
    ProdectScreen(),
    categor_screen(),
    favert_screen(),
    setting_screen(),
  ];

  void changBottom(int index)
  {
    currentIndex = index;
    emit(shopChangeBottomNavState());
  }

  late HomeModel homeModel =HomeModel() ;
  Map <dynamic , dynamic > favoraites ={};
  CachHelper_shop object_for_cach_helper = CachHelper_shop();

  //-----------------------------------------------------------------

      getHomeData() async{
    var token_id  = await object_for_cach_helper.getData_Cash_helper(key: 'token');
    emit(shopLoadingHomeState());
    DioHelper.getdata(url: home , token:token_id).then((value) async {
      homeModel = HomeModel.fromJson(value.data);
      print('******** Here data for get data***************');
      //print(homeModel.status);
      //print(homeModel.data?.banners![0]?.image);
      homeModel.data!.products?.forEach((element) {
        favoraites.addAll({
          element.id :element.inFavorites,
        });
      });
      print(favoraites.toString());
      print('******** Here data  for get data***************');
      emit(shopSeuccessHomeState());
    }).catchError((e)

    {
      print('******** Here Error for get data ***************');
      print(e.toString());
      print('******** Here Error for get data ***************');

      emit(shopErrorHomeState(e.toString()));
    });
    
  }

  //-----------------------------------------------------------------

      late  categories cate =categories();
      getCategoriesData() async
      {
    emit(shopLoading_categories_State());
    DioHelper.getdata(url: categor).then
      ((value)
        {
            cate =categories.fromJson(value.data);
            print('******** Here data for categories data***************');
            print(cate.status);
            print(cate.data?.data![0].name);
            print('******** Here data  for categories data***************');
            emit(shopSeucces_scategories_State());
        }


    ).catchError((e){
      print('******** Here Error for categories data ***************');
      print(e.toString());
      print('******** Here Error for categories data ***************');

    });
  }

  //-----------------------------------------------------------------
      ChangeFavoritesModel  check_Favorites = ChangeFavoritesModel();
        void changfavorites(dynamic prodect_id) async{
     favoraites[prodect_id] = !favoraites[prodect_id];//عشان تبين مباشرة للمستخدم التغير
    emit(shopSeucces_favorates_State());
    CachHelper_shop checkSkip = CachHelper_shop();
    var token_id  = await checkSkip.getData_Cash_helper(key: 'token');//هاد موجود عشان يشيك اذا مصرح اعمل مفصلة ولا لا
      DioHelper.postdata
        (
          url:favorates,
          data:{'product_id':prodect_id},
        token: token_id,
      ).then((value)
      {
        check_Favorites = ChangeFavoritesModel.fromJson(value.data);
        print(value.data);
        print(check_Favorites.status);
        Tosta_mes(mess: '${check_Favorites.message}', color: Color(0xFFF9A825));
        emit(shopSeucces_favorates_State());
          dynamic x =check_Favorites.status;
        if(!x)
          {
            favoraites[prodect_id] = !favoraites[prodect_id];
            Tosta_mes(mess: '${check_Favorites.message}', color: Color(0xFFFF6E40));
          }else{getfavoriteData();}

      }).catchError((e){
        favoraites[prodect_id] = !favoraites[prodect_id];
        emit(shopError_favorates_State(e.toString()));
        Tosta_mes(mess: '${check_Favorites.message}', );
      });
    }

 //-----------------------------------------------------------------

       favoratemodel favorite_item  = favoratemodel();
        getfavoriteData() async
          {
            emit(shopLoading_Getfavorates_State());
            var token_id  = await object_for_cach_helper.getData_Cash_helper(key: 'token');
          DioHelper.getdata(url: favorates , token:token_id).then((value)
            {
               favorite_item =favoratemodel.fromJson(value.data);
               emit(shopSeucces_scategories_State());
            }).catchError((e) {print(e.toString());});
  }

//---------------------------------------------------

  loginModel user_info  = loginModel();
  Get_user_info() async
  {
    emit(shopLoading_GetUserInfo_State());
    var token_id  = await object_for_cach_helper.getData_Cash_helper(key: 'token');
    DioHelper.getdata(url: profile , token:token_id).then((value)
    {
      user_info =loginModel.fromJson(value.data);
      print('^^^^^^^^^^^^ HERE USER ^^^^^^^^^^^^^');
       print(user_info.data!.name);
       print(user_info.data!.email);
      print('^^^^^^^^^^^^ HERE USER ^^^^^^^^^^^^^');

      emit(shopSeucces_GetUserInfo_State());
    }).catchError((e)
    {    print('^^^^^^^^^^^^ HERE ERROR ^^^^^^^^^^^^^');
        print(e.toString());
       print('^^^^^^^^^^^^ HERE ERROR ^^^^^^^^^^^^^');

    });
  }


}