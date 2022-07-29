import 'dart:convert';

import 'package:http/http.dart' as http;

class Trip {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  Trip({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory Trip.fromJson(Map json) {
    return Trip(
        name: json['name'],
        img: json['img'],
        price: json['price'],
        people: json['people'],
        stars: json['stars'],
        description: json['description'],
        location: json['location']);
  }
}

class TripAPI {
  Future<List<Trip>> getInfo() async {
    http.Response response =
        await http.get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => Trip.fromJson(e)).toList();
      } else {
        return <Trip>[];
      }
    } catch (e) {
      print(e);
      return <Trip>[];
    }
  }
}
