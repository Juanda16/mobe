import 'dart:developer';

import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobe/core/util/strings.dart';
import 'package:mobe/features/catalog/domain/usecases/get_stores.dart';
import 'package:mobe/features/catalog/presentation/pages/profile/edit_profile_page.dart';
import 'package:mobe/features/catalog/presentation/pages/settings_page.dart';
import 'package:mobe/features/catalog/presentation/pages/stores/stores_main_page.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/loader.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/category/category.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/entities/user/user.dart';
import '../../domain/entities/vendor/store.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_makers.dart';
import '../widgets/contact_form.dart';
import '../widgets/grid_builder_widget.dart';
import '../widgets/loading_widget.dart';
//

List<String> defaultCategories = [
  'Asistencia',
  'Talleres',
  'Repuestos',
  'Accesorios',
  'Obligatorios',
];

List<String> drawerFix = [
  'Perfil',
  'Configuración',
  'Home',
  'Cerrar Sesión',
];

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final GetMakers _getMakers = getIt.get<GetMakers>();
  final GetCategories _getCategories = getIt.get<GetCategories>();
  final GetStores _getStores = getIt.get<GetStores>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Store> stores = [];
  List<Category> categories = [];
  List<Store> _searchList = [];
  late bool _IsSearching;
  String _searchText = "";
  String _appBarText = "";

  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.blue.shade900,
  );

  Widget appBarWidget = Image.asset(
    Images.mobeLogoPath,
  );

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    _IsSearching = false;
    init();
  }

  Future<void> init() async {
    final Either<Failure, Iterable<Category>> categoriesEither = await Future.any([
      _getCategories.call(NoParam.i),
      Future.delayed(const Duration(seconds: 5))
          .then((value) => Left(ServerFailure(message: 'Timeout')))
    ]);

    final Either<Failure, Iterable<Store>> storesEither = await Future.any([
      _getStores.call(NoParam.i),
      Future.delayed(const Duration(seconds: 5))
          .then((value) => Left(ServerFailure(message: 'Timeout')))
    ]);

    categories = categoriesEither.fold((l) {
      log('Error getting categories: $l');
      return defaultCategories
          .map((defaultCategory) => Category(id: 0, name: defaultCategory))
          .toList();
    }, (r) => r.toList());

    stores = storesEither.fold((l) {
      log('Error getting stores: $l');
      return [];
    }, (r) => r.toList());

    setState(() {});

    _searchList = stores;

    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }

  List<Store> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = stores;
    } else {
      _searchList = stores
          .where((tienda) => tienda.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();

      return _searchList;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Category> drawerList = [
      ...categories,
      ...drawerFix.map((name) => Category(id: 0, name: name))
    ];

    List<Widget> widgetOptions = <Widget>[
      buildBody(context, _getMakers, _getCategories),
      const StoresMainPage(),
      EditProfilePage(currentUser: widget.currentUser),
      const SettingsPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildBar(context),
      drawer: Drawer(
        width: 200,
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: drawerList.length + 1,
          // Add 1 for the header
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
              return MenuListItem(
                label: drawerList[index - 1].name.capitalize(),
                icon: Icons.motorcycle,
                onTap: () {
                  // Navigator.of(context).pop();

                  if (drawerList[index - 1].name == 'Home') {
                    widgetOptions.elementAt(0);
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }

                  if (drawerList[index - 1].name == 'tiendas') {
                    widgetOptions.elementAt(0);
                    setState(() {
                      _selectedIndex = 1;
                    });
                  }

                  if (drawerList[index - 1].name == 'Perfil') {
                    widgetOptions.elementAt(1);
                    setState(() {
                      _selectedIndex = 2;
                    });
                  }

                  if (drawerList[index - 1].name == 'Configuración') {
                    widgetOptions.elementAt(2);
                    setState(() {
                      _selectedIndex = 3;
                    });
                  }
                  if (drawerList[index - 1].name == 'Cerrar Sesión') {
                    Navigator.pop(context);
                  }

                  Navigator.of(context).pop();
                },
                color: index > categories.length ? primaryColor : secondaryColor,
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue.shade900,
        elevation: 30,
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return ContactForm(formKey: _formKey);
            }),
        label: Text(AppLocalizations.of(context)!.contact),
        icon: const Icon(Icons.call),
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
          // child: buildBody(context, _getMakers),
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ]),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: const Icon(Icons.motorcycle),
      //         label: AppLocalizations.of(context)!.catalog),
      //     BottomNavigationBarItem(
      //         icon: const Icon(Icons.settings),
      //         label: AppLocalizations.of(context)!.settings),
      //   ],
      //   onTap: (int index) {
      //     if (_selectedIndex == index) {
      //       _homeController.animateTo(
      //         0.0,
      //         duration: const Duration(milliseconds: 500),
      //         curve: Curves.easeOut,
      //       );
      //     }
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   currentIndex: _selectedIndex,
      // ),
    );
  }

  Widget buildBody(BuildContext context, GetMakers getMakers, GetCategories getCategories) {
    List<Maker> stores = [
      Maker(id: 1, name: 'tienda1'),
      Maker(id: 2, name: 'tienda2'),
    ];

    return RefreshIndicator(
      onRefresh: () {
        loaderOn(context);
        getCategories.call(NoParam.i).then((value) => _searchQuery.notifyListeners());
        // getMakers
        //     .call(NoParam.i)
        //     .then((value) => _searchQuery.notifyListeners());
        return Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.pop(context));
      },
      child: FutureBuilder(
        future: getCategories.call(NoParam.i),
        // future:
        //     Future.delayed(Duration(seconds: 3)).then((value) => Right(stores)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final Either<Failure, Iterable<Category>> categoriesEither = snapshot.data;
            categories = categoriesEither.fold((l) {
              print('Error: ${l}');
              return [];
            }, (r) => r.toList());

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text((AppLocalizations.of(context)!.recomended).capitalize(),
                  //     style: hpm16.copyWith(color: secondaryColor), textAlign: TextAlign.start),
                  // SizedBox(
                  //   height: 50,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: categories.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 12.0),
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             // Navigator.push(
                  //             //   context,
                  //             //   MaterialPageRoute(
                  //             //     builder: (context) => MotorcyclesByMakerPage(
                  //             //       maker: makers[index],
                  //             //     ),
                  //             //   ),
                  //             // );
                  //           },
                  //           child: SizedBox(
                  //             width: 160,
                  //             height: 30,
                  //             child: Center(
                  //               child: Text(
                  //                 categories[index].name.capitalize(),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(AppLocalizations.of(context)!.bestRated.capitalize(),
                      style: hpm16.copyWith(color: secondaryColor), textAlign: TextAlign.start),
                  Expanded(
                    child: SizedBox(
                      child: GridBuilderWidget(
                          searchList: _searchList, homeController: _homeController),
                    ),
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

  AppBar buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarWidget,
        iconTheme: IconThemeData(color: Colors.lightBlue.shade900),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = Icon(
                    Icons.close,
                    color: Colors.lightBlue.shade900,
                  );
                  appBarWidget = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.lightBlue.shade900,
                    ),
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.searchHere,
                        hintStyle: TextStyle(color: Colors.lightBlue.shade900)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd(context);
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd(BuildContext context) {
    setState(() {
      actionIcon = Icon(
        Icons.search,
        color: Colors.lightBlue.shade900,
      );
      appBarWidget = Image.asset(
        Images.mobeLogoPath,
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class MenuListItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
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
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: secondaryColor,
          style: BorderStyle.solid,
          width: 0.1,
        ),
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
                  color: color == secondaryColor ? primaryColor : secondaryColor),
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
