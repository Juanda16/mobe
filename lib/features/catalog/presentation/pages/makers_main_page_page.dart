import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:mobe/core/usecases/usecase.dart';
import 'package:mobe/features/catalog/presentation/pages/settings_page.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/loader.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/usecases/get_makers.dart';
import '../widgets/loading_widget.dart';

class MakersMainPage extends StatefulWidget {
  MakersMainPage({Key? key}) : super(key: key);

  @override
  State<MakersMainPage> createState() => _MakersMainPageState();
}

class _MakersMainPageState extends State<MakersMainPage> {
  final TextEditingController _searchQuery = TextEditingController();
  List<Maker> makers = [];
  late List<Maker> _searchList;
  late bool _IsSearching;
  String _searchText = "";

  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.lightBlue,
  );

  // Widget appBarWidget = const Text(
  //   "Search Demo",
  //   style: TextStyle(color: Colors.white),
  // );

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

  void init() {
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
      print('${_searchList.length}');
      print('${_searchList}');

      return _searchList;
    }
  }

  @override
  Widget build(BuildContext context) {
    GetMakers _getMakers = getIt.get<GetMakers>();

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
        return Future.delayed(const Duration(seconds: 3))
            .then((value) => Navigator.pop(context));
      },
      child: FutureBuilder(
        future: Future.any([
          getMakers.call(NoParam.i),
          Future.delayed(const Duration(seconds: 3))
              .then((value) => _searchQuery.notifyListeners())
        ]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final Either<Failure, Iterable<Maker>> makersEither = snapshot.data;

            makers = makersEither.fold((l) => [], (r) => r.toList());

            return GridView.builder(
              // Create a grid with 2 columns
              itemCount: _searchList.length,
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
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Images.getUrlLogo(
                                logoUrl: _searchList.elementAt(index).logoUrl),
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
                                        _searchList.elementAt(index).name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        '  ${_searchList.elementAt(index).id}',
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
                                  color: Colors.blue,
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
