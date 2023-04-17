import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobe/core/error/failures.dart';
import 'package:mobe/features/catalog/domain/entities/motorcycle_name/motorcycle_name.dart';
import 'package:mobe/features/catalog/presentation/pages/settings_page.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/usecases/get_motorcycles_by_maker.dart';
import '../widgets/loading_widget.dart';

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
        body: buildBody(context, _getMotorcycles, int.parse(maker.id)));
  }
}

@override
Widget buildBody(
    BuildContext context, GetMotorcycleByMaker getMotorcycles, int makerId) {
  List<MotorcycleName> motorcyclesNames = [];
  return FutureBuilder(
      future: Future.any([getMotorcycles.call(Params(id: makerId))]),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final Either<Failure, Iterable<MotorcycleName>> motorcyclesEither =
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()
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
      });
}
