import 'package:shared_preferences/shared_preferences.dart';

class CachHelper_shop {
  late SharedPreferences sharedPreferences;
      /*
          Function SvaeData
          This function enables us to get data from different pages and save the data inside them
          Meaning, we can save any status we need for the program and this status will remain unless we change it

          */
    Future saveData_Cash_helper({required String key , required dynamic  value}) async
      {
          sharedPreferences = await SharedPreferences.getInstance();
          if(value is String)
              {return await  sharedPreferences.setString(key, value);}
          if (value is int)
              {return await  sharedPreferences.setInt(key, value);}
          if (value is bool)
             {return await  sharedPreferences.setBool(key, value);}
          return await  sharedPreferences.setDouble(key, value);
  }

   /*
          Function getData
          Through this function, we can access the data that we saved from the previous function
   */
     Future<dynamic> getData_Cash_helper({required String key}) async
      {

         sharedPreferences = await SharedPreferences.getInstance();
         return sharedPreferences.get(key);
    }

  /*This function deletes some data stored in (sharedPreferences ) only specific data*/
  Future RemoveData({required String key }) async{
    sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(key);
    }

}