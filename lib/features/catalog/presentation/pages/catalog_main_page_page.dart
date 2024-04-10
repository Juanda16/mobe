import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobe/core/styles/styles.dart';
import 'package:mobe/core/usecases/usecase.dart';
import 'package:mobe/features/catalog/domain/usecases/get_categories.dart';
import 'package:mobe/features/catalog/presentation/pages/settings_page.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/loader.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/category/category.dart';
import '../widgets/loading_widget.dart';

List<String> categories = [
  'Asistencis',
  'Talleres',
  'Repuestos',
  'Accesorios',
  'Obligatorios',
  'Perfil',
  'Historial',
  'Cerrar Sesión',
];

class CatalogMainPage extends StatelessWidget {
  CatalogMainPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    GetCategories _getCategories = getIt.get<GetCategories>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: secondaryColor),
        backgroundColor: white,
        title: Column(
          children: [
            Image.asset(
              Images.mobeLogoPathNoBG,
              height: 50,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      drawer: Drawer(
        width: 200,
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
                children: const <Widget>[
                  SizedBox(
                    height: 125,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                      ),
                      child: null,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: <Widget>[
                  // ListTile(
                  //   minLeadingWidth: 0,
                  //   leading: Container(
                  //       padding: const EdgeInsets.all(0),
                  //       height: 60,
                  //       width: 70,
                  //       color: index > 4 ? primaryColor : secondaryColor,
                  //       child: Icon(Icons.motorcycle)),
                  //   title: Text(categories[index]),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  MenuListItem(
                    label: categories[index],
                    icon: Icons.motorcycle,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: index > 4 ? primaryColor : secondaryColor,
                  ),
                ],
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return spaceV0;
          },
          // separatorBuilder: (BuildContext context, int index) {
          //   return const Divider(
          //     color: secondaryColor,
          //     height: 1,
          //   );
          // },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 30,
          onPressed: () => _scaffoldKey.currentState?.openDrawer()),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.motorcycle), label: "Catalog"),
      //     BottomNavigationBarItem(icon: Icon(Icons.hardware), label: "Tools"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: "Settings"),
      //   ],
      // ),
    );
  }

  Widget buildBody(BuildContext context, GetCategories getCategories) {
    return RefreshIndicator(
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

class MenuListItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;
  final Color? color;

  const MenuListItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color = secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: secondaryColor.withOpacity(0.5),
            style: BorderStyle.solid,
            width: 1),
        borderRadius: BorderRadius.circular(0),
      ),
      title: SizedBox(
        //height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 70,
              color: color,
              child: Icon(Icons.motorcycle,
                  color:
                      color == secondaryColor ? primaryColor : secondaryColor),
            ),
            spaceH12,
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: secondaryTxt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
