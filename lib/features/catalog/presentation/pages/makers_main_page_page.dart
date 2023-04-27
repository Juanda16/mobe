import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:mobe/core/usecases/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/loader.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/usecases/get_makers.dart';
import '../widgets/grid_builder_widget.dart';
import '../widgets/loading_widget.dart';

class MakersMainPage extends StatefulWidget {
  const MakersMainPage({Key? key}) : super(key: key);

  @override
  State<MakersMainPage> createState() => _MakersMainPageState();
}

class _MakersMainPageState extends State<MakersMainPage> {
  GetMakers _getMakers = getIt.get<GetMakers>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Maker> makers = [];
  late List<Maker> _searchList;
  late bool _IsSearching;
  String _searchText = "";

  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.lightBlue,
  );

  Widget appBarWidget = Image.asset(
    Images.mobeLogoPath,
  );

  @override
  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildBar(context),
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
          child: buildBody(context, _getMakers),
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

  Widget buildBody(BuildContext context, GetMakers getMakers) {
    return RefreshIndicator(
      semanticsLabel: "123",
      semanticsValue: "456",
      onRefresh: () {
        loaderOn(context);
        getMakers
            .call(NoParam.i)
            .then((value) => _searchQuery.notifyListeners());
        return Future.delayed(const Duration(seconds: 3))
            .then((value) => Navigator.pop(context));
      },
      child: FutureBuilder(
        future: getMakers.call(NoParam.i),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final Either<Failure, Iterable<Maker>> makersEither = snapshot.data;

            makers = makersEither.fold((l) => [], (r) => r.toList());

            return GridBuilderWidget(searchList: _searchList);
          } else {
            return const Center(child: LoadingWidget());
          }
        },
      ),
    );
  }

  AppBar buildBar(BuildContext context) {
    // appBar: AppBar(
    //
    //   title: Column(
    //     children: [

    //       const SizedBox(
    //         height: 10,
    //       )
    //     ],
    //   ),
    // ),

    return AppBar(
        centerTitle: true,
        title: appBarWidget,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = const Icon(
                    Icons.close,
                    color: Colors.lightBlue,
                  );
                  appBarWidget = TextField(
                    controller: _searchQuery,
                    style: const TextStyle(
                      color: Colors.lightBlue,
                    ),
                    decoration: const InputDecoration(
                        hintText: "Search here..",
                        hintStyle: TextStyle(color: Colors.lightBlue)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
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

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.lightBlue,
      );
      appBarWidget = Image.asset(
        Images.mobeLogoPath,
      );

      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
