// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class PlacesApiService {
//   final String apiKey;
//
//   PlacesApiService(this.apiKey);
//
//   // Fetch nearby restaurants using the Google Places API
//   Future<List<dynamic>> fetchNearbyRestaurants(double latitude, double longitude) async {
//     final String baseUrl =
//         "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
//     final String requestUrl =
//         "$baseUrl?location=$latitude,$longitude&radius=1500&type=restaurant&key=$apiKey";
//
//     final response = await http.get(Uri.parse(requestUrl));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['results']; // List of nearby places
//     } else {
//       print("Error: ${response.statusCode}");
//       return [];
//     }
//   }
// }
