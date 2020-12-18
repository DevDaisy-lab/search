import 'package:meta/meta.dart';
//import 'package:path_provider/path_provider.dart';

class Vege {
  final int id;
  final String name;
  final String about;
  final String calories;
  final String imageUrl;

  Vege(
      {@required this.id,
      @required this.name,
      @required this.about,
      @required this.calories,
      @required this.imageUrl});

  @override
  String toString() {
    return "Vege $id is named $name";
  }
}
