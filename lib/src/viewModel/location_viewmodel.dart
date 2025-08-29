import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationViewModel extends ChangeNotifier {
  Position? _currentPosition;
  String? _currentAddress;
  Stream<Position>? _positionStream;

  Position? get currentPosition => _currentPosition;
  String? get currentAddress => _currentAddress;

  Future<void> initLocationTracking() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint("Location services are disabled.");
      return;
    }

    // Request permission if needed
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint("Location permission permanently denied.");
      return;
    }

    // Start streaming location updates
    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // meters
      ),
    );

    _positionStream!.listen((Position position) async {
      _currentPosition = position;


    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
      Placemark place = placemarks[0];
      _currentAddress =
          "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      _currentAddress = null;
    }

      notifyListeners(); // UI will rebuild
    });
  }
}