import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/motorcycle/motorcycle.dart';
import '../../domain/usecases/get_motorcycle_by_id.dart';
import '../widgets/loading_widget.dart';

class MotorcycleDetailPage extends StatelessWidget {
  final int motorcycleId;

  GetMotorcycleById _getMotorcycle = getIt.get<GetMotorcycleById>();

  MotorcycleDetailPage({required this.motorcycleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('maker.name'),
      ),
      body: FutureBuilder(
        future: Future.any(
            [_getMotorcycle.call(GetMotorcycleByIdParam(id: motorcycleId))]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final Either<Failure, Motorcycle> motorcycleEither = snapshot.data;
            final Motorcycle motorcycle = motorcycleEither.fold(
                (l) => throw Exception('Error getting motorcycles'), (r) => r);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${motorcycle.articleCompleteInfo.makeName} ${motorcycle.articleCompleteInfo.modelName} ${motorcycle.articleCompleteInfo.yearName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Type: ${motorcycle.articleCompleteInfo.categoryName}'),
                  Text('Maker: ${motorcycle.articleCompleteInfo.makeName}'),
                  Text('Model: ${motorcycle.articleCompleteInfo.modelName}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: LoadingWidget());
          }
        },
      ),
    );
  }
}
