import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'NavBar.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      reloadPosition();
    });
    super.initState();
    generateMarkers();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("SametAydin Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: reloadPosition,
        label: const Text("Ben neredeyim"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  void reloadPosition() async {
    Position position = await _determinePosition();

    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 14)));

    markers.removeWhere(
        (element) => element.markerId == const MarkerId('currentLocation'));
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));

    setState(() {});
  }

  void generateMarkers() async {
    Position position = await _determinePosition();
    final random = Random();
    final numMarkers = 2;
    for (int i = 0; i < numMarkers; i++) {
      double lat = 40.123341 + random.nextDouble() * 0.0009 - 0.00045;
      double lng = 26.410245 + random.nextDouble() * 0.0009 - 0.00045;
      markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: LatLng(lat, lng),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Bonus Kazandınız'),
                content: Text('Tebrikler, bonus kazandınız!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      markers.remove(markers.firstWhere((element) =>
                          element.markerId == MarkerId('marker$i')));
                      setState(() {});
                      Navigator.pop(_);
                    },
                    child: const Text('Tamam'),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
