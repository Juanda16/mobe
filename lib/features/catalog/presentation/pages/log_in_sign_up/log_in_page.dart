import 'package:flutter/material.dart';
import 'package:mobe/core/styles/styles.dart';
import 'package:mobe/core/util/images.dart';

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
            child: Column(
              children: [
                spaceV36,
                Stack(children: [
                  Images.mobeLogo(
                    height: 150,
                  )
                ]),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: padding24,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.userIcon,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Correo Electrónico',
                            hintText: 'Correo Electrónico',
                          ),
                          validator: textFormFieldValidator,
                        ),
                        spaceV12,
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.lock,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                          ),
                        ),
                        spaceV12,
                        ElevatedButton(
                            onPressed:
                                // Validate returns true if the form is valid, or false otherwise.
                                () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: Text('Iniciar Sesión')),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Olvidé mi contraseña',
                            style: sim12.copyWith(color: secondaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceV12,
                Text(
                  'Términos y condiciones',
                  style: hib14.copyWith(color: secondaryColor),
                ),
                Text(
                  'Al registrarte, aceptas nuestras reglas y políticas',
                  style: sim12.copyWith(color: secondaryColor),
                  maxLines: 2,
                ),
                Text(
                  'Aquí no hay letra menuda',
                  style: sim12.copyWith(color: secondaryColor),
                )
              ],
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
        child: Container(
          color: primaryColor,
          height: 90,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                spaceV16,
                Text(
                  'Regístrate!',
                  style: hib22.copyWith(color: white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? textFormFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su nombre';
    }
    return null;
  }
}
