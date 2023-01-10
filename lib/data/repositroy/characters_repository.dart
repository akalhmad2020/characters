import 'package:bloc_app/data/models/characters_model/characters_model.dart';
import 'package:bloc_app/data/models/characters_model/results.dart';
import 'package:bloc_app/data/web_services/web_services.dart';

class CharactersRepository {
 late final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});


  Future<CharacterModel> getAllCharacters () async{

    final characters = await charactersWebServices.getAllCharacters();
    return CharacterModel.fromJson(characters);

  }
}
