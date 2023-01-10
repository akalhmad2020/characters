import 'package:bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_app/character_item.dart';
import 'package:bloc_app/constants/my_colors.dart';
import 'package:bloc_app/data/models/characters_model/characters_model.dart';
import 'package:bloc_app/data/models/characters_model/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

 late List<Results> allCharactersList ;
 late List<Results> searchedCharactersList ;
 bool isSearched = false ;
 late final TextEditingController controller ;

  late CharacterModel allCharacters ;


  Widget _searchedCharactersField(){
    return TextField(
      controller: controller,
      cursorColor: MyColors.myGrey,
      decoration:const InputDecoration(
        hintText: 'Find a character...',
        hintStyle: TextStyle(color: MyColors.myGrey , fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myGrey , fontSize: 18),
      onChanged: (searchedCharacter){
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    ) ;
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter){
    searchedCharactersList = allCharactersList.where((character)
    => character.name!.toLowerCase().startsWith(searchedCharacter.toLowerCase())).toList();
    setState(() {
    });
  }

  List<Widget> buildAppBarActions(){
   if(isSearched){
     return [
       IconButton(onPressed: (){
         clearSearch();
         Navigator.pop(context);
       }, icon: const Icon(Icons.clear , color: MyColors.myGrey,)),
     ];
   }else{
     return [
        IconButton(onPressed: startSearch, icon: const Icon(Icons.search , color:  MyColors.myGrey,)),
     ];
   }
  }
  void startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearched = true ;
    });
  }

  void stopSearch (){
    clearSearch();
    setState(() {
      isSearched = false ;
    });
  }

  void clearSearch(){
    controller.clear();
  }



  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state){
      if(state is CharactersLoaded){
        allCharacters  = (state).listCharacters;
        allCharactersList = allCharacters.results!;
        return buildLoadedWidgets();
      }else{
        return buildIndicator();
      }
    });
  }

  Widget buildLoadedWidgets(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList(){
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2 ,
    childAspectRatio: 10/10,
    ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: controller.text.isEmpty ? allCharactersList.length : searchedCharactersList.length ,
        itemBuilder: (c,index){
      return   CharactersItem(results: controller.text.isEmpty ? allCharactersList[index] : searchedCharactersList[index] ,);
    } ,
      padding: EdgeInsets.zero,

    );
  }

  Widget buildIndicator(){
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }


  Widget _buildAppBarTile(){
    return  const Text('Characters' , style: TextStyle(color: MyColors.myGrey),);
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
         leading: isSearched ?const BackButton(color: Colors.black,) : const SizedBox() ,
         title: isSearched ? _searchedCharactersField() : _buildAppBarTile(),
        actions: buildAppBarActions()
      ),
      body: buildBlocWidget(),
    );
  }
}
