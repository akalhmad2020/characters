
import 'package:bloc_app/constants/strings.dart';
import 'package:bloc_app/data/models/characters_model/characters_model.dart';
import 'package:dio/dio.dart';

class CharactersWebServices{

  late Dio dio  ;
  CharactersWebServices(){
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl ,
      connectTimeout: 20 * 1000 ,
      receiveDataWhenStatusError: true ,
      receiveTimeout: 20 * 1000 ,

    );

    dio = Dio(baseOptions);
  }

  Future<Map<String,dynamic>> getAllCharacters () async{
    try{
      Response response = await dio.get('character');
      return response.data ;
    }catch(e){
      print(e.toString());
      return null!;

    }


  }




}