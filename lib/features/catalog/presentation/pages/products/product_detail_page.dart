// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mobe/core/styles/styles.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../../../core/util/images.dart';
// import '../../../domain/entities/product/product.dart';
// import '../../widgets/contact_form.dart';
//
// class ProductDetailPage extends StatelessWidget {
//   final Product product;
//   final _formKey = GlobalKey<FormState>();
//
//   ProductDetailPage({
//     super.key,
//     required this.product,
//   });
//
//   final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.43296265331129, -122.08832357078792),
//     zoom: 14.4746,
//   );
//
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   Widget build(BuildContext context) {
//     final specs = {
//       "name": AppLocalizations.of(context)!.name,
//       "description": AppLocalizations.of(context)!.description,
//       "phone": AppLocalizations.of(context)!.phoneNumber,
//       "email": AppLocalizations.of(context)!.email,
//       "address": AppLocalizations.of(context)!.address,
//       "city": AppLocalizations.of(context)!.city,
//       "country": AppLocalizations.of(context)!.country,
//       "engine_displacement": AppLocalizations.of(context)!.engineDisplacement,
//     };
//
//     Position position = const Position(
//         longitude: 0,
//         latitude: 0,
//         accuracy: 0,
//         altitude: 0,
//         heading: 0,
//         speed: 0,
//         speedAccuracy: 0,
//         timestamp: null,
//         altitudeAccuracy: 0,
//         headingAccuracy: 0);
//     Geolocator.checkPermission().then((value) {
//       return null;
//     });
//     Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
//       position = value;
//
//       return null;
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(product.name),
//       ),
//       body: Stack(children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             image: DecorationImage(
//               alignment: Alignment.bottomCenter,
//               image: AssetImage(Images.backgroundImage),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   '${product.name} ',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 SizedBox(
//                   height: 180,
//                   child: Center(
//                     heightFactor: 1,
//                     child: FadeInImage.assetNetwork(
//                       placeholder: Images.loaderIcon,
//                       placeholderScale: 0.1,
//                       // placeholder: Images.defaultIcon,
//                       image: product.picUrl ?? Images.defaultUrlStoreIcon,
//                     ),
//                   ),
//                 ),
//                 // Images.getUrlLogo(logoUrl: product.image),
//                 Card(
//                   color: secondaryColor.withOpacity(0.3),
//                   margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           product.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text(
//                           '${product.price}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 Card(
//                   color: primaryColor.withOpacity(0.9),
//                   margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(AppLocalizations.of(context)!.details,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 16,
//                                 color: Colors.white,
//                               )),
//                           const SizedBox(height: 10),
//                           ListView.builder(
//                             itemCount: specs.length,
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               final name = specs.keys.elementAt(index);
//                               return product.toJson()[name] != null
//                                   ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                                       name != specs.keys.first
//                                           ? Divider(
//                                               color: Colors.white.withOpacity(0.3),
//                                               thickness: 1,
//                                               height: 10,
//                                             )
//                                           : const SizedBox(height: 0),
//                                       Text(
//                                         '${specs[name]}',
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12,
//                                           color: Colors.black87,
//                                         ),
//                                       ),
//                                       Text(
//                                         '${product.toJson()[name]}',
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           fontSize: 14,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ])
//                                   : const SizedBox(height: 0);
//                             },
//                           ),
//                         ]),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   AppLocalizations.of(context)!.whereToFindUs,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       Text(
//                         '${product.type}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.blueGrey,
//                         ),
//                       ),
//                     ]),
//                     TextButton(
//                       child: Text(AppLocalizations.of(context)!.go),
//                       onPressed: () {
//                         MapUtils.openMap(position.latitude, position.longitude);
//                       },
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                   onPressed: () => showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return ContactForm(formKey: _formKey);
//                       }),
//                   child: Text(AppLocalizations.of(context)!.interested),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
//
// class MapUtils {
//   MapUtils._();
//
//   static Future<void> openMap(double latitude, double longitude) async {
//     Uri googleUrl =
//         Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
//     if (await canLaunchUrl(googleUrl)) {
//       await launchUrl(googleUrl);
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
// }

import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';
import '../../../domain/entities/product/product.dart';
import '../stores/store_detail_page.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: product.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      product.picUrl ?? "",
                      fit: BoxFit.cover,
                      height: 250.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                product.description ?? "",
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price ?? "",
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(product.rating.toStringAsFixed(1)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              if (product.storeName != null)
                Text(
                  "Tienda: ${product.storeName}",
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              spaceV16,
              if (product.store != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreDetailPage(store: product.store!)),
                        );
                      },
                      child: Text(
                        "Detalles de la tienda: ${product.store!.name}, ${product.store!.address}, ${product.store!.city}, ${product.store!.country}",
                        style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreDetailPage(store: product.store!)),
                        );
                      },
                      child: const Text('Ir a la tienda',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
