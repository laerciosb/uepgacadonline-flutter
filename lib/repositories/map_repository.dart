import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uepgacadonline_flutter/models/place.dart';
import 'package:uepgacadonline_flutter/helpers/marker_helper.dart';

class MapRepository {
  List<Place> places = [
    Place('SCATE - Setor Agrárias Tecnologia', LatLng(-25.089217, -50.103428)),
    Place('Engenharia Civil', LatLng(-25.089255, -50.103294)),
    Place('Agronomia', LatLng(-25.089340, -50.102863)),
    Place('Casas de Vegetação', LatLng(-25.089786, -50.102291)),
    Place('Auditório Bloco E', LatLng(-25.089791, -50.103307)),
    Place('Profs. Agronomia', LatLng(-25.090233, -50.103387)),
    Place('Arquibancada', LatLng(-25.090707, -50.103995)),
    Place('Arquivo', LatLng(-25.090517, -50.104524)),
    Place('Caixa Econômica Federal', LatLng(-25.091308, -50.103701)),
    Place('Protocolo Geral', LatLng(-25.091279, -50.103901)),
    Place('Imprensa Gráfica', LatLng(-25.091275, -50.104036)),
    Place('Empresas Juniores', LatLng(-25.091466, -50.103879)),
    Place('Seção de Saúde', LatLng(-25.090733, -50.105686)),
    Place('Apoio Pedagógico', LatLng(-25.090729, -50.105582)),
    Place('Seção de Cultura', LatLng(-25.090970, -50.105676)),
    Place('Educação Fundamental ', LatLng(-25.090888, -50.105360)),
    Place('Ginásio Coberto', LatLng(-25.090911, -50.104971)),
    Place('Campo Futebol', LatLng(-25.091518, -50.104989)),
    Place('Quadra Poliv.', LatLng(-25.091622, -50.105321)),
    Place('Educação Infantil', LatLng(-25.091525, -50.105675)),
  ];

  List<Place> getPlaces() {
    return places;
  }

  Set<Marker> getMarkers() {
    return Set<Marker>.of(MarkerHelper().placesToMarkers(places).values);
  }
}

final mapRepository = MapRepository();
