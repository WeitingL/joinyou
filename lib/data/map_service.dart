import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MapLocationService {
  final String key = "AIzaSyCYdao3e2auHoAshnmbd60YRsolxM49wug";

  Future<String> getPlaceId(String input) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    print("placeId-$placeId");
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    print("Place json-$json");
    var results = json['result'] as Map<String, dynamic>;
    print("Place-$results");
    return results;
  }
}