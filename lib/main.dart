import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_spp_section8/on_boarding/login/login.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';
import 'package:shop_spp_section8/on_boarding/on_boarding_screen.dart';
import 'package:shop_spp_section8/on_boarding/shop_app_cubit/cubit_shop/cubit_shop_app.dart';
import 'package:shop_spp_section8/on_boarding/shopapp/shop_app_layout.dart';
import 'package:shop_spp_section8/pac_news_App/news_app/cubit/cubit.dart';
import 'package:shop_spp_section8/pac_news_App/remote/dio_helper.dart';
import 'package:shop_spp_section8/style/light&dark.dart';


main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inti();
  CachHelper_shop checkSkip = CachHelper_shop();

  var onboarding = await  checkSkip.getData_Cash_helper(key: 'on Boarding');

  var token_id  = await checkSkip.getData_Cash_helper(key: 'token');
  print("HERE DATA ");
  print(onboarding);
  print("HERE DATA ");
  Widget widget_screen ;
  if(onboarding!=null)
    {
      if(token_id !=null)
        {widget_screen = shopLayout();}
      else{ widget_screen =Shop_login();}
    }
 else{widget_screen =on_boarding_screen();}
  runApp( MyApp(
      widget_screen=widget_screen
  ));
}

class MyApp extends StatelessWidget {
   final stratWidget;
   MyApp(this.stratWidget);
   bool x= false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NewCubit()..getBusiness()),
        BlocProvider(create: (context) => shopCubit()..getHomeData()..getCategoriesData()..getfavoriteData()..Get_user_info()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:light,
        debugShowCheckedModeBanner: false,
        home: stratWidget//on_boarding_screen()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(),

    );
  }
}
