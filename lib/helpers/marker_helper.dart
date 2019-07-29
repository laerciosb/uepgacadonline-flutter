import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uepgacadonline_flutter/models/place.dart';

class MarkerHelper {
  Map<MarkerId, Marker> placesToMarkers(List<Place> places) {
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

    places.forEach((place) {
      MarkerId markerMd5 =
          MarkerId(md5.convert(utf8.encode(place.name)).toString());

      Marker marker = Marker(
          markerId: markerMd5,
          position: place.latLng,
          infoWindow: InfoWindow(title: place.name));

      markers[markerMd5] = marker;
    });

    return markers;
  }
}
