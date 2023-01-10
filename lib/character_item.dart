import 'package:bloc_app/constants/my_colors.dart';
import 'package:bloc_app/constants/strings.dart';
import 'package:bloc_app/data/models/characters_model/characters_model.dart';
import 'package:bloc_app/data/models/characters_model/results.dart';
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  const CharactersItem({Key? key , required this.results}) : super(key: key);
  final Results results ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: const BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () =>  Navigator.pushNamed(context, charactersDetailsRout , arguments: results),
        child: Hero(
          tag: results.id.toString(),
          child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child:Text('${results.name}' ,
              style:const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,) ,
            ),
            child:  Container(
              color: MyColors.myGrey,
              child: results.image!.isNotEmpty ?
              FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif' ,
                image: results.image!,) : Image.asset('assets/images/man.png')
            ),
          ),
        ),
      ),
    );
  }
}
