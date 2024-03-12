import 'package:flutter/material.dart';
import 'package:mobe/core/styles/styles.dart';
import 'package:mobe/core/util/images.dart';
import 'package:mobe/features/catalog/presentation/pages/catalog_main_page_page.dart';
import 'package:mobe/features/catalog/presentation/pages/log_in_sign_up/sign_up_page.dart';

/// [LogIn] is a page where the user can sign up to the app.
class LogIn extends StatelessWidget {
  LogIn({super.key});

  static const double formIconSize = 28;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(28),
        child: AppBar(
          elevation: 5,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                opacity: 0.6,
                image: AssetImage(Images.backgroundImage),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Stack(children: [
                    Images.mobeLogo(
                      height: 180,
                    )
                  ]),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.userIcon,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Correo Electrónico',
                            hintText: 'Correo Electrónico',
                          ),
                          validator: (value) => textFormFieldValidator(
                              value, 'correo electrónico'),
                        ),
                        spaceV12,
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.lock,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                          ),
                          validator: (value) =>
                              textFormFieldValidator(value, 'Contraseña'),
                        ),
                        spaceV48,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed:
                                // Validate returns true if the form is valid, or false otherwise.
                                () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CatalogMainPage()),
                              );
                              // if (_formKey.currentState!.validate()) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         backgroundColor: secondaryColor,
                              //         content: Text('Processing Data...')),
                              //   );
                              // }
                            },
                            child: Text('Iniciar Sesión',
                                style: hib16.copyWith(
                                  color: white,
                                ))),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Olvidaste tu contraseña?',
                      style: sim12.copyWith(color: secondaryColor),
                    ),
                  ),
                  spaceV12,
                  const Divider(
                    color: secondaryColor,
                    thickness: 1,
                  ),
                  spaceV12,
                  Text(
                    'O ingresa con tus redes sociales',
                    style: hib14.copyWith(color: secondaryColor),
                  ),
                  spaceV16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Images.buildSvgPngImage(Images.facebookIcon,
                          width: 40, height: 40),
                      spaceH24,
                      Images.buildSvgPngImage(Images.googleIcon,
                          width: 40, height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
        },
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: Container(
            color: primaryColor,
            height: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  spaceV12,
                  Text('Sos nuevo por aquí?',
                      style: sim14.copyWith(color: white)),
                  spaceV4,
                  Text(
                    'Regístrate!',
                    style: hib16.copyWith(color: white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? textFormFieldValidator(String? value, String label) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su $label';
    }
    return null;
  }
}
