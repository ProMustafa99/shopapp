
import 'package:shop_spp_section8/on_boarding/components/component.dart';
import 'package:shop_spp_section8/on_boarding/login/login.dart';
import 'package:shop_spp_section8/on_boarding/network_shopapp/romate_shop_app/CashHelper.dart';

CachHelper_shop remov =CachHelper_shop();

void remove_info(context)
{
  /*
           When you press this button,
           the function will automatically delete the data that was specified before and return to the previous page
           */
  remov.RemoveData(key:'token').then((value) {
    if(value)
    {
      navigateto_shop(context ,Shop_login());
    }


  });
}