import 'package:bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_app/constants/strings.dart';
import 'package:bloc_app/data/models/characters_model/results.dart';
import 'package:bloc_app/data/repositroy/characters_repository.dart';
import 'package:bloc_app/data/web_services/web_services.dart';
import 'package:bloc_app/presentation/screens/characters_details.dart';
import 'package:bloc_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute{

  late CharactersRepository charactersRepository ;
  late CharactersCubit charactersCubit ;

  AppRoute(){
    charactersRepository = CharactersRepository(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);

  }
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case  charactersScreenRout :
      return  MaterialPageRoute(builder: (_) =>  BlocProvider(create: (BuildContext c)=> charactersCubit , child:const CharactersScreen() ,) );
        case  charactersDetailsRout :
          final result = settings.arguments as Results ;
      return  MaterialPageRoute(builder: (_) =>  CharactersDetails(result: result,));

    }
  }
}