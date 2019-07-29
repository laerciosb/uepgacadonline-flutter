import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uepgacadonline_flutter/repositories/map_repository.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  final mapCompleter = Completer();
  final geolocator = Geolocator();
  final locationOptions = LocationOptions(accuracy: LocationAccuracy.high);

  GoogleMapController mapController;

  final zoom = 17.25;

  final _centralLatLong = LatLng(-25.0866184, -50.1609526);
  final _uvaranasLatLong = LatLng(-25.0927955, -50.1041028);

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() async {
    mapController = await mapCompleter.future;

    var position;

    switch (tabController.index) {
      case 0:
        final currentPosition = await geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        position = CameraPosition(
            target: LatLng(currentPosition.latitude, currentPosition.longitude),
            zoom: zoom);
        break;
      case 1:
        position = CameraPosition(target: _centralLatLong, zoom: zoom);
        break;
      case 2:
        position = CameraPosition(target: _uvaranasLatLong, zoom: 15.1);
        break;
    }

    mapController.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  @override
  void dispose() {
    tabController.removeListener(_handleTabIndex);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<Position>(
            stream: geolocator.getPositionStream(locationOptions),
            builder: (context, snapshot) {
              return GoogleMap(
                mapType: MapType.normal,
                markers: mapRepository.getMarkers(),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                    target:
                        LatLng(snapshot.data.latitude, snapshot.data.longitude),
                    zoom: zoom),
                onMapCreated: (GoogleMapController controller) {
                  mapCompleter.complete(controller);
                },
              );
            }),
        appBar: AppBar(
          titleSpacing: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xff4a6aff)),
          title: Text("Mapa",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff4a6aff),
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          bottom: TabBar(
              controller: tabController,
              indicatorColor: Color(0xff4a6aff),
              unselectedLabelColor: Colors.grey[400],
              labelColor: Color(0xff4a6aff),
              tabs: [
                Tab(text: "Atual", icon: Icon(Icons.location_on)),
                Tab(text: "Central", icon: Icon(Icons.center_focus_strong)),
                Tab(text: "Uvaranas", icon: Icon(Icons.center_focus_weak)),
              ]),
        ));
  }
}
