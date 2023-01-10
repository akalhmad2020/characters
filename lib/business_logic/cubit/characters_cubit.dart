
import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/models/characters_model/characters_model.dart';
import 'package:bloc_app/data/repositroy/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

 final CharactersRepository charactersRepository ;
  CharactersCubit(this.charactersRepository):super(CharactersInitial());

       CharacterModel characterModel = CharacterModel() ;
  CharacterModel getAllCharacters (){
    charactersRepository.getAllCharacters().then((value) {
     emit(CharactersLoaded(listCharacters: value));
     characterModel = value ;
    // print('${characterModel.results![0].image}ffffff');
    });
    return characterModel;
}


  }

