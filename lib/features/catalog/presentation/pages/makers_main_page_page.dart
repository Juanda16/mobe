import 'package:dartz/dartz.dart' show Either, Right;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobe/core/usecases/usecase.dart';
import 'package:mobe/features/catalog/presentation/pages/settings_page.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/loader.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/usecases/get_makers.dart';
import '../widgets/contact_form.dart';
import '../widgets/grid_builder_widget.dart';
import '../widgets/loading_widget.dart';

class MakersMainPage extends StatefulWidget {
  const MakersMainPage({Key? key}) : super(key: key);

  @override
  State<MakersMainPage> createState() => _MakersMainPageState();
}

class _MakersMainPageState extends State<MakersMainPage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final GetMakers _getMakers = getIt.get<GetMakers>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Maker> makers = [];
  List<Maker> _searchList = [];
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
    final Either<Failure, Iterable<Maker>> makersEither =
        await _getMakers.call(NoParam.i);

    makers = makersEither.fold((l) => [], (r) => r.toList());
    _searchList = makers;

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

  List<Maker> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = makers;
    } else {
      _searchList = makers
          .where((maker) =>
              maker.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();

      return _searchList;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      buildBody(context, _getMakers),
      const SettingsPage()
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildBar(context),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.motorcycle),
              label: AppLocalizations.of(context)!.catalog),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings),
        ],
        onTap: (int index) {
          if (_selectedIndex == index) {
            _homeController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          }
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }

  Widget buildBody(BuildContext context, GetMakers getMakers) {
    List<Maker> makers = [
      Maker(id: 1, name: 'maker1'),
    ];

    return RefreshIndicator(
      onRefresh: () {
        loaderOn(context);
        // getMakers
        //     .call(NoParam.i)
        //     .then((value) => _searchQuery.notifyListeners());
        return Future.delayed(const Duration(seconds: 3))
            .then((value) => Navigator.pop(context));
      },
      child: FutureBuilder(
        // future: getMakers.call(NoParam.i),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.hasData) {
          if (true) {
            // final Either<Failure, Iterable<Maker>> makersEither = snapshot.data;
            final Either<Failure, Iterable<Maker>> makersEither = Right(makers);

            makers = makersEither.fold((l) => [], (r) => r.toList());

            return GridBuilderWidget(
                searchList: _searchList, homeController: _homeController);
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
