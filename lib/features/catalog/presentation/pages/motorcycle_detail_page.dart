import 'package:flutter/material.dart';

import '../../../../core/util/images.dart';
import '../../domain/entities/motorcycle/motorcycle.dart';

class MotorcycleDetailPage extends StatelessWidget {
  final Motorcycle motorcycle;

  const MotorcycleDetailPage({
    super.key,
    required this.motorcycle,
  });

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 16),
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: Images.loaderIcon,

                  placeholderScale: 0.1,
                  // placeholder: Images.defaultIcon,
                  image: motorcycle.image ?? Images.defaultUrlMotorcycleIcon,
                ),
              ),
              // Images.getUrlLogo(logoUrl: motorcycle.image),
              Text('Type: ${motorcycle.name}'),
              Text('Maker: ${motorcycle.brandId}'),
              Text('Model: ${motorcycle.year}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
