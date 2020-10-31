import 'dart:convert';
import 'package:barbershop_app/models/barber.dart';

class BarberApi {
  static List<Barber> allBarbersFromJson(String jsonData) {
    List<Barber> barbers = [];
    json.decode(jsonData)['barbers'].forEach((barber) => barbers.add(_forMap(barber)));
    return barbers;
  }

  static Barber _forMap(Map<String, dynamic> map) {
    return new Barber(
      externalId: map['id'],
      name: map['name'],
      
    );
  }
}