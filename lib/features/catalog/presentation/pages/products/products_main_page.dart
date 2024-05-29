import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobe/core/error/failures.dart';
import 'package:mobe/core/usecases/usecase.dart';
import 'package:mobe/core/util/images.dart';
import 'package:mobe/features/catalog/presentation/pages/products/product_detail_page.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/product/product.dart';
import '../../../domain/usecases/get_products.dart';
import '../../widgets/loading_widget.dart';

class ProductsMainPage extends StatelessWidget {
  const ProductsMainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetProducts getProducts = getIt.get<GetProducts>();
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Products"),
        // ),
        body: buildBody(
      context,
      getProducts,
    ));
  }
}

@override
Widget buildBody(BuildContext context, GetProducts getProducts) {
  List<Product> products = [];

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
          future: Future.any([getProducts.call(NoParam.i)]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final Either<Failure, Iterable<Product>> productsEither = snapshot.data;
              products = productsEither.fold(
                  (l) => throw Exception('Error getting motorcycles'), (r) => r.toList());
              print("products: ${products.length}}");
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
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
                                builder: (context) => ProductDetailPage(
                                      product: product,
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
                                  image: product.picUrl ?? Images.defaultUrlMotorcycleIcon,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.name,
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
