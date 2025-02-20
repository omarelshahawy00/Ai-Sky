import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetUserLocation {
  static Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Show a dialog to inform the user
      await showDialog(
        context: context,
        barrierDismissible: false, // Prevents closing the dialog without action
        builder: (context) => AlertDialog(
          title: const Text('Location Required'),
          content: const Text(
              'This app needs location services to work. Please enable location services.'),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );

      // Wait until the user enables location services
      while (!serviceEnabled) {
       
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
      }
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Fetch the current position
    return await Geolocator.getCurrentPosition();
  }
}
