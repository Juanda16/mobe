import 'package:flutter/material.dart';

import '../../../../core/util/images.dart';
import '../../domain/entities/maker/maker.dart';
import '../pages/motorcycles_by_maker_page.dart';

class GridBuilderWidget extends StatelessWidget {
  const GridBuilderWidget({
    Key? key,
    required List<Maker> searchList,
  })  : _searchList = searchList,
        super(key: key);

  final List<Maker> _searchList;

  @override
  Widget build(BuildContext context) {
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
          color: Colors.white,
          shadowColor: Colors.grey.shade50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 5,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                buildPageRouteBuilder(index),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _searchList.elementAt(index).name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  '  ${_searchList.elementAt(index).id}',
                                  style: Theme.of(context).textTheme.bodySmall,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  Text(
                                    _searchList
                                        .elementAt(index)
                                        .qualification
                                        .toString(),
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
  }

  PageRouteBuilder<dynamic> buildPageRouteBuilder(int index) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MotorcyclesByMakerPage(maker: _searchList.elementAt(index)),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.linear;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }
}
