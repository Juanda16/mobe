import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobe/core/usecases/usecase.dart';
import 'package:mobe/features/catalog/domain/usecases/get_categories.dart';
import 'package:mobe/features/catalog/presentation/pages/settings_page.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/loader.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/category/category.dart';
import '../widgets/loading_widget.dart';

class CatalogMainPage extends StatelessWidget {
  CatalogMainPage({Key? key}) : super(key: key);

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    GetCategories _getCategories = getIt.get<GetCategories>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Image.asset(
              Images.mobeLogoPathNoBG,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        onPressed: () {},
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
          padding: const EdgeInsets.all(4),
          child: buildBody(context, _getCategories),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.motorcycle), label: "Catalog"),
          BottomNavigationBarItem(icon: Icon(Icons.hardware), label: "Tools"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context, GetCategories getCategories) {
    return RefreshIndicator(
      semanticsLabel: "123",
      semanticsValue: "456",
      onRefresh: () {
        loaderOn(context);
        return Future.delayed(const Duration(seconds: 3))
            .then((value) => Navigator.pop(context));
      },
      child: FutureBuilder(
        future: Future.any([
          getCategories.call(NoParam.i),
          Future.delayed(const Duration(seconds: 5))
        ]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final Either<Failure, Iterable<Category>> categoriesEither =
                snapshot.data;
            Iterable<Category> categories =
                categoriesEither.fold((l) => [], (r) => r);
            return GridView.builder(
              // Create a grid with 2 columns
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                // childAspectRatio: 3 / 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: ((BuildContext ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                              Images.mobeLogoPath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        categories.elementAt(index).name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        '  ${categories.elementAt(index).id}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 30,
                                  color: Colors.blue.shade900,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        Text(
                                          '3,9',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                // return Center(
                //   child: Text(
                //     'Item $index',
                //     style: Theme.of(context).textTheme.headlineSmall,
                //   ),
                // );
              }),
            );
          } else {
            return const Center(child: LoadingWidget());
          }
        },
      ),
    );
  }
//   if (state is Empty) {
//     return const MessageDisplay(
//       message: 'Start searching!',
//     );
//   } else if (state is Loading) {
//     return const LoadingWidget();
//   } else if (state is Loaded) {
//     return TriviaDisplay(numberTrivia: state.trivia);
//   } else if (state is Error) {
//     return MessageDisplay(
//       message: state.message,
//     );
//   }
//   throw ('Something went wrong. Please try again.');
// },

}
