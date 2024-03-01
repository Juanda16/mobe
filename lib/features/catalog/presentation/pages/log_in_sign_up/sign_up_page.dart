import 'package:flutter/material.dart';
import 'package:mobe/core/styles/styles.dart';
import 'package:mobe/core/util/images.dart';

/// [SignUpPage] is a page where the user can sign up to the app.
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage(Images.backgroundImage),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    spaceV48,
                    Stack(children: [
                      Images.buildSvgPngImage(
                        Images.manAvatar,
                        width: 150,
                        height: 150,
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.red,
                        ),
                      )
                    ]),
                    spaceV24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 28,
                          color: secondaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                // Container(
                //   color: primaryColor,
                //   height: 100,
                //   child: Center(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: const [
                //         spaceV24,
                //         Text(
                //           'Regístrate.',
                //           style: TextStyle(
                //             color: white,
                //             fontSize: 20,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        color: primaryColor,
        height: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              spaceV24,
              Text(
                'Regístrate.',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
