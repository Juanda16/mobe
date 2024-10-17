import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/util/images.dart';
import '../../domain/entities/motorcycle/motorcycle.dart';
import '../widgets/contact_form.dart';

class MotorcycleDetailPage extends StatelessWidget {
  final Motorcycle motorcycle;
  final _formKey = GlobalKey<FormState>();

  MotorcycleDetailPage({
    super.key,
    required this.motorcycle,
  });

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final specs = {
      "engine_displacement": AppLocalizations.of(context)!.engineDisplacement,
      "engine_type": AppLocalizations.of(context)!.engineType,
      "power": AppLocalizations.of(context)!.power,
      "torque": AppLocalizations.of(context)!.torque,
      "transmission_type": AppLocalizations.of(context)!.transmissionType,
      "front_wheel": AppLocalizations.of(context)!.frontWheel,
      "rear_wheel": AppLocalizations.of(context)!.rearWheel,
      "overall_dimensions": AppLocalizations.of(context)!.overallDimensions,
      "wheelbase": AppLocalizations.of(context)!.wheelbase,
      "weight": AppLocalizations.of(context)!.weight,
      "front_brake": AppLocalizations.of(context)!.frontBrake,
      "rear_brake": AppLocalizations.of(context)!.rearBrake,
      "front_suspension": AppLocalizations.of(context)!.frontSuspension,
      "rear_suspension": AppLocalizations.of(context)!.rearSuspension,
      "starting_type": AppLocalizations.of(context)!.startingType
    };

    Position position = Position(
        longitude: 0,
        latitude: 0,
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: DateTime.now(),
        altitudeAccuracy: 0,
        headingAccuracy: 0);
    Geolocator.checkPermission().then((value) {
      return null;
    });
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      position = value;

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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${motorcycle.name} ',
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

                Card(
                  color: Colors.blue[50],
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${motorcycle.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${motorcycle.year}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Card(
                  color: Colors.blue[50],
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.specifications,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: specs.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final name = specs.keys.elementAt(index);
                              return motorcycle.toJson()[name] != null
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          name != specs.keys.first
                                              ? const Divider()
                                              : const SizedBox(height: 0),
                                          Text(
                                            '${specs[name]}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            '${motorcycle.toJson()[name]}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ])
                                  : const SizedBox(height: 0);
                            },
                          ),
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.whereToFindUs,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${motorcycle.brand?.vendor?.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                              '${Geolocator.distanceBetween(position.latitude, position.longitude, motorcycle.brand?.vendor?.latitude ?? 6.0, motorcycle.brand?.vendor?.longitude ?? -75.0).toInt() / 1000} Km'),
                        ]),
                    TextButton(
                      child: Text(AppLocalizations.of(context)!.go),
                      onPressed: () {
                        MapUtils.openMap(position.latitude, position.longitude);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  //rounded corners
                  height: 300,

                  child: GoogleMap(
                    markers: {
                      Marker(
                        markerId: const MarkerId("marker_1"),
                        position: LatLng(
                            motorcycle.brand?.vendor?.latitude ?? 6.2677510,
                            motorcycle.brand?.vendor?.longitude ?? -75.5714165),
                      ),
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      //target: LatLng(position.latitude, position.longitude),
                      target: LatLng(
                          motorcycle.brand?.vendor?.latitude ?? 6.2677510,
                          motorcycle.brand?.vendor?.longitude ?? -75.5714165),
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ContactForm(formKey: _formKey);
                      }),
                  child: Text(AppLocalizations.of(context)!.interested),
                ),
                const SizedBox(height: 10),
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
