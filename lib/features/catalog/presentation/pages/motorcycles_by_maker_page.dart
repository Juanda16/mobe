import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobe/core/error/failures.dart';

import '../../../../core/util/images.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/entities/motorcycle/motorcycle.dart';
import '../../domain/usecases/get_motorcycles_by_maker.dart';
import '../widgets/loading_widget.dart';
import 'motorcycle_detail_page.dart';

class MotorcyclesByMakerPage extends StatelessWidget {
  final Maker maker;

  const MotorcyclesByMakerPage({Key? key, required this.maker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetMotorcycleByMaker _getMotorcycles = getIt.get<GetMotorcycleByMaker>();

    return Scaffold(
        appBar: AppBar(
          title: Text(maker.name),
        ),
        body: buildBody(context, _getMotorcycles, (maker.id)));
  }
}

@override
Widget buildBody(
    BuildContext context, GetMotorcycleByMaker getMotorcycles, int makerId) {
  List<Motorcycle> motorcyclesNames = [];
  return Stack(
    children: [
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
      FutureBuilder(
          future: Future.any([getMotorcycles.call(Params(id: makerId))]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final Either<Failure, Iterable<Motorcycle>> motorcyclesEither =
                  snapshot.data;
              motorcyclesNames = motorcyclesEither.fold(
                  (l) => throw Exception('Error getting motorcycles'),
                  (r) => r.toList());

              return ListView.builder(
                itemCount: motorcyclesNames.length,
                itemBuilder: (BuildContext context, int index) {
                  final motorcycle = motorcyclesNames[index];
                  return ListTile(
                    title: Text(motorcycle.name),
                    subtitle: Text(motorcycle.id.toString()),
                    onTap: () {
                      print(' tap>>> ${motorcycle.id}');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MotorcycleDetailPage(
                                  motorcycle: motorcycle,
                                )
                            //     MotorcycleDetailPage(
                            //   motorcycle: motorcycle,
                            // ),
                            ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(child: LoadingWidget());
            }
          }),
    ],
  );
}
