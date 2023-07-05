import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class MapDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {
  final MapController _mapController = MapController();
  final TextEditingController _addressSearchController = TextEditingController();
  LatLng _pickedLocation = LatLng(13.736, 100.523);

  void _searchLocation(String query) async {
    List<Location> locations = await locationFromAddress(query);
    if (locations.isNotEmpty) {
      _pickedLocation = LatLng(locations.first.latitude, locations.first.longitude);
      _mapController.move(LatLng(locations.first.latitude, locations.first.longitude), 15.0);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextField(
        controller: _addressSearchController,
        onSubmitted: (String query) {
          _searchLocation(query);
        },
        decoration: InputDecoration(
          hintText: "Search address",
          suffixIcon: IconButton(
            splashRadius: 0.1,
            icon: Icon(Icons.clear),
            onPressed: () {
              _addressSearchController.clear();
            },
          )
        ),
      ),
      content: Container(
        height: 500,
        width: 300,
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                  interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                  maxZoom: 18,
                  minZoom: 13,
                  center: _pickedLocation,
                  zoom: 18.0,
                  onPositionChanged: (MapPosition mapPosition, bool _) {
                    setState(() {
                      _pickedLocation = mapPosition.center!;
                    });
                    print(_pickedLocation);
                  }),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        point: _pickedLocation,
                        builder: (BuildContext context) {
                          return const Icon(
                            Icons.location_pin,
                            size: 50,
                          );
                        })
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    color: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20))),
                    onPressed: () {
                      Navigator.pop(context, _pickedLocation);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_pin, color: Colors.white,),
                        Text(
                          "Pick Location",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
