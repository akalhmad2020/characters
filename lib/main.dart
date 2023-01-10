import 'package:bloc_app/data/models/characters_model/characters_model.dart';
import 'package:bloc_app/data/repositroy/characters_repository.dart';
import 'package:bloc_app/presentation/screens/characters_screen.dart';
import 'package:bloc_app/router.dart';
import 'package:flutter/material.dart';



void main() {
  runApp( MyApp(appRoute: AppRoute(),));
}

class MyApp extends StatelessWidget {
     MyApp({Key? key , required this.appRoute}):super(key: key);
  final AppRoute appRoute ;

  CharactersRepository? charactersRepository ;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}