
import 'package:flutter/material.dart';

class RestaurantInfoImagePage extends StatelessWidget {
  const RestaurantInfoImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Map"),
      ),
      body: Center(
        child: Image.asset(
          'assets/image/map.png', // Path to your asset image
          fit: BoxFit.cover, // Adjust how the image fits into the space
          width: double.infinity, // Take full screen width
          height: double.infinity, // Take full screen height
        ),
      ),
    );
  }
}

// updated APIServices
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'places_api_service.dart';
//
// class RestaurantInfoPage extends StatefulWidget {
//   @override
//   _RestaurantInfoPageState createState() => _RestaurantInfoPageState();
// }
//
// class _RestaurantInfoPageState extends State<RestaurantInfoPage> {
//   GoogleMapController? _mapController;
//   LatLng _currentLocation = LatLng(0, 0);
//   final Set<Marker> _markers = {};
//   final PlacesApiService _placesService = PlacesApiService("YOUR_API_KEY");
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   // Get the user's current location
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if (!serviceEnabled || permission == LocationPermission.denied) {
//       await Geolocator.requestPermission();
//     }
//
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     setState(() {
//       _currentLocation = LatLng(position.latitude, position.longitude);
//       _markers.add(Marker(
//         markerId: MarkerId("currentLocation"),
//         position: _currentLocation,
//         infoWindow: InfoWindow(title: "You are here"),
//       ));
//     });
//
//     _fetchNearbyRestaurants();
//   }
//
//   // Fetch nearby restaurants
//   Future<void> _fetchNearbyRestaurants() async {
//     final restaurants = await _placesService.fetchNearbyRestaurants(
//         _currentLocation.latitude, _currentLocation.longitude);
//
//     setState(() {
//       for (var place in restaurants) {
//         final placeLocation = place['geometry']['location'];
//         final LatLng latLng = LatLng(placeLocation['lat'], placeLocation['lng']);
//
//         _markers.add(Marker(
//           markerId: MarkerId(place['place_id']),
//           position: latLng,
//           infoWindow: InfoWindow(
//             title: place['name'],
//             snippet: place['vicinity'],
//           ),
//         ));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Nearby Restaurants"),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _currentLocation,
//           zoom: 14,
//         ),
//         markers: _markers,
//         myLocationEnabled: true,
//         onMapCreated: (GoogleMapController controller) {
//           setState(() {
//             _mapController = controller;
//           });
//         },
//       ),
//     );
//   }
// }
