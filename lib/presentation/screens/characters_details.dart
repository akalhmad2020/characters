
import 'package:bloc_app/constants/my_colors.dart';
import 'package:bloc_app/data/models/characters_model/results.dart';
import 'package:flutter/material.dart';

class CharactersDetails extends StatelessWidget {
  const CharactersDetails({Key? key, required this.result}) : super(key: key);

  final Results result;



  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
       pinned: true,
     // stretch: false,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          result.name!,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
            tag: result.id.toString(),
            child: Image.network(
              result.image!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }


  Widget characterInfo(String title , String value){
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,

        text:TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: title ,
              style:const TextStyle(
                color: MyColors.myWhite ,
                fontSize: 18 ,
                fontWeight: FontWeight.bold
              ),
            ),
            TextSpan(
              text: value ,
              style:const TextStyle(
                color: MyColors.myWhite ,
                fontSize: 16 ,
              ),
            ),
          ]
        ) );
  }

  Widget buildDivider(double endIndent){

    return  Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent ,
      thickness: 2,
    );
  }


  @override
  Widget build(BuildContext context) {


    return   Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar() ,
          SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  margin:const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding:const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  <Widget>[
                      const SizedBox(height: 7,),
                      characterInfo('Name origin  :  ' , result.origin!.name ?? 'Nothing to print it'),
                      buildDivider(285),
                      characterInfo('Name location  :  ' , result.location!.name ?? 'Nothing to print it'),
                      buildDivider(265),
                      characterInfo('Name origin  :  ' , result.origin!.name ?? 'Nothing to print it'),
                      buildDivider(285),
                      characterInfo('Name origin  :  ' , result.origin!.name ?? 'Nothing to print it'),
                      buildDivider(285),
                     const SizedBox(height: 15,)
                    ],
                  ),
                ),
                const SizedBox(height: 400,)
          ]
          )),
        ],
      ),
    );
  }
}
