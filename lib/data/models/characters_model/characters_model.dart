
import 'package:bloc_app/data/models/characters_model/results.dart';

import 'info.dart';

class CharacterModel {
  Info? info;
  List<Results>? results;

  CharacterModel({this.info, this.results});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ?   Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(  Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if ( info != null) {
      data['info'] =  info!.toJson();
    }
    if (results != null) {
      data['results'] =  results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
