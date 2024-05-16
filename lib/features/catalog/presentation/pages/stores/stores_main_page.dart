import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobe/core/error/failures.dart';
import 'package:mobe/core/usecases/usecase.dart';
import 'package:mobe/core/util/images.dart';
import 'package:mobe/features/catalog/domain/entities/vendor/store.dart';
import 'package:mobe/features/catalog/presentation/pages/stores/store_detail_page.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/get_stores.dart';
import '../../widgets/loading_widget.dart';

class StoresMainPage extends StatelessWidget {
  const StoresMainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStores getStores = getIt.get<GetStores>();
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Stores"),
        // ),
        body: buildBody(
      context,
      getStores,
    ));
  }
}

@override
Widget buildBody(BuildContext context, GetStores getStores) {
  List<Store> stores = [];

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
          future: Future.any([getStores.call(NoParam.i)]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final Either<Failure, Iterable<Store>> storesEither = snapshot.data;
              stores = storesEither.fold(
                  (l) => throw Exception('Error getting motorcycles'), (r) => r.toList());
              print("stores: ${stores.length}}");
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: stores.length,
                  itemBuilder: (BuildContext context, int index) {
                    final store = stores[index];
                    return Card(
                      color: Colors.white.withOpacity(0.7),
                      // shadowColor: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoreDetailPage(
                                      store: store,
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: FadeInImage.assetNetwork(
                                  placeholder: Images.loaderIcon,

                                  placeholderScale: 0.1,
                                  // placeholder: Images.defaultIcon,
                                  image: store.picUrl ?? Images.defaultUrlMotorcycleIcon,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                store.name,
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
                      ),
                    );
                  });
            } else {
              return const Center(child: LoadingWidget());
            }
          }),
    ],
  );
}
