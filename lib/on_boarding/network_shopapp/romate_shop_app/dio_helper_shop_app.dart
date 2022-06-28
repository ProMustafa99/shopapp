

import 'package:dio/dio.dart';

class DioHelper {

  static  Dio dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
      )

  );
  static inti()
  {
    dio =Dio(
        BaseOptions(
          baseUrl:'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers:
          {
            'Content-Type':'application/json',
          },
        )
    );
  }

  static Future<Response> getdata({required String url ,String lang ='ar' , String? token }) async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return await dio.get(url ,);
  }

  static Future<Response> postdata(
      {
        required String url ,
        Map<String ,dynamic>? data ,
        Map<String ,dynamic>? query ,
        String lang ='ar' ,
       String? token} )async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return await dio.post(url.toString() ,data: data,queryParameters:query );
  }
}