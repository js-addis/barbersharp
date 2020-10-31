import 'package:meta/meta.dart';

class Barber {
  final int externalId;
  final String name;
  
  Barber({
    @required this.externalId,
    @required this.name,
  });

  @override 
  String toString() {
    return "Barber $externalId is named $name";
  }

}