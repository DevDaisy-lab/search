import 'dart:convert';
import 'package:flutter/widgets.dart';
import '../model/vege.dart';

class VegeApi extends ChangeNotifier {
  static List<Vege> allVegesFromJson(String jsonData) {
    List<Vege> veges = [];

    json.decode(jsonData)['veges'].forEach((vege) => veges.add(_forMap(vege)));
    return veges;
  }

  static Vege _forMap(Map<String, dynamic> map) {
    return new Vege(
      id: map['id'],
      name: map['name'],
      about: map['about'],
      calories: map['calories'],
      imageUrl: map['image_url'],
    );
  }

  @override
  void notifyListeners();
}
