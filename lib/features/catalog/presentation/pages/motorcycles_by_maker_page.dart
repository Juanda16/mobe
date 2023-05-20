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



              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: motorcyclesNames.length,
                itemBuilder: (BuildContext context, int index) {
                  final motorcycle = motorcyclesNames[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    elevation: 5,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MotorcycleDetailPage(
                              motorcycle: motorcycle,
                            )
                          ),
                        );
                      },

                      child: Column(
                        children: [
                          Expanded(

                            child:  FadeInImage.assetNetwork(
                              placeholder: Images.loaderIcon,

                              placeholderScale: 0.1,
                              // placeholder: Images.defaultIcon,
                              image: motorcycle.image ?? Images.defaultUrlMotorcycleIcon,
                            ),
                            ),

                        const SizedBox(height: 8),
                        Text(motorcycle.name,

                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),

                      ],
                    ),
                    ),
                  );
                }
              );

            } else {
              return const Center(child: LoadingWidget());
            }
          }),
    ],
  );
}
