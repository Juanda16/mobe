import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/util/images.dart';
import '../../domain/entities/motorcycle/motorcycle.dart';

class MotorcycleDetailPage extends StatelessWidget {
  final Motorcycle motorcycle;

  MotorcycleDetailPage({
    super.key,
    required this.motorcycle,
  });

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    Position position = const Position(
        longitude: 0,
        latitude: 0,
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: null);
    Geolocator.checkPermission().then((value) {
      print('permission>>> ${value}');
      return null;
    });
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      position = value;
      print('current position>>> ${value}');

      return null;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(motorcycle.name),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              alignment: Alignment.bottomCenter,
              image: AssetImage(Images.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${motorcycle.name} ${motorcycle.year}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  child: Center(
                    heightFactor: 1,
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.loaderIcon,

                      placeholderScale: 0.1,
                      // placeholder: Images.defaultIcon,
                      image:
                          motorcycle.image ?? Images.defaultUrlMotorcycleIcon,
                    ),
                  ),
                ),
                // Images.getUrlLogo(logoUrl: motorcycle.image),
                Text('Type: ${motorcycle.name}'),
                Text('Maker: ${motorcycle.brandId}'),
                Text('Model: ${motorcycle.year}'),
                const SizedBox(height: 16),
                Text('Donde comprar'),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('tienda 1'),
                    Text(
                        '${Geolocator.distanceBetween(position.latitude, position.longitude, 52.3546274, 4.8285838).toInt()} m'),
                    TextButton(
                      child: Text('Go'),
                      onPressed: () {
                        MapUtils.openMap(position.latitude, position.longitude);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: GoogleMap(
                    markers: {
                      Marker(
                        markerId: MarkerId("pos1"),
                        position: LatLng(6.2677532, -75.5714165),
                      ),
                      Marker(
                        markerId: MarkerId("pos2"),
                        position: LatLng(6.2677532, -75.5714130),
                      ),
                      Marker(
                        markerId: MarkerId("pos3"),
                        position: LatLng(6.2677510, -75.5714110),
                      ),
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      // target: LatLng(position.latitude, position.longitude),
                      target: LatLng(6.2677510, -75.5714165),
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
