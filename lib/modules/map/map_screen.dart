import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();
//  var location = Location();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() async {
    final GoogleMapController controller = await _controller.future;

    var position;

    switch (_tabController.index) {
      case 0:
//        final currentLocation = await location.getLocation();
//        position = CameraPosition(
//            target: LatLng(currentLocation.latitude, currentLocation.longitude),
//            zoom: 14.4746);
        break;
      case 1:
        position = CameraPosition(
            target: LatLng(-25.0920654, -50.1570412), zoom: 15.0);
        break;
      case 2:
        position = CameraPosition(
            target: LatLng(-25.0939394, -50.1060646), zoom: 15.0);
        break;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
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
            controller: _tabController,
            indicatorColor: Color(0xff4a6aff),
            unselectedLabelColor: Colors.grey[400],
            labelColor: Color(0xff4a6aff),
            tabs: [
              Tab(text: "Atual", icon: Icon(Icons.location_on)),
              Tab(text: "Central", icon: Icon(Icons.center_focus_strong)),
              Tab(text: "Uvaranas", icon: Icon(Icons.center_focus_weak)),
            ]),
      ),
//      floatingActionButton: Row(
//        children: <Widget>[
//          FloatingActionButton.extended(
//            onPressed: _goToTheUvaranas,
//            label: Text('Central'),
//            icon: Icon(Icons.location_on),
//          ),
//          FloatingActionButton.extended(
//            onPressed: _goToTheCentral,
//            label: Text('Uvaranas'),
//            icon: Icon(Icons.location_on),
//          ),
//        ],
//      ),
    );
  }
}
