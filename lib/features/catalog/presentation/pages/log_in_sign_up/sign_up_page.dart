import 'package:flutter/material.dart';
import 'package:mobe/core/styles/styles.dart';

import '../../../../../core/util/images.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/user/user.dart';
import '../../../domain/usecases/create_user.dart';
import 'log_in_page.dart';

/// [SignUpPage] is a page where the user can sign up to the app.
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  static const double formIconSize = 28;
  final _formKey = GlobalKey<FormState>();
  final CreateUser createUser = getIt.get<CreateUser>();

  User userToCreate = const User(
    userName: '',
    email: '',
    password: '',
    roles: ['admin'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Images.buildSvgPngImage(
                    Images.manAvatar,
                    width: 150,
                    height: 150,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Images.buildSvgPngImage(
                      Images.plusButton,
                      width: 40,
                      height: 40,
                    ),
                  )
                ]),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: padding24,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (value) {
                            userToCreate = userToCreate.copyWith(userName: value ?? '');
                          },
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.userIcon,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Nombre usuario',
                            hintText: 'Nombre de usuario',
                          ),
                          validator: textFormFieldValidator,
                        ),
                        spaceV12,
                        TextFormField(
                          onSaved: (value) {
                            userToCreate = userToCreate.copyWith(email: value ?? '');
                          },
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.emailIcon,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Correo Electrónico',
                            hintText: 'Correo',
                          ),
                          validator: emailValidator,
                        ),
                        spaceV12,
                        TextFormField(
                          onSaved: (value) {
                            userToCreate = userToCreate.copyWith(password: value ?? '');
                          },
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.lock,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                          ),
                        ),
                        spaceV12,
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Images.buildSvgPngImage(Images.checkedLock,
                                width: formIconSize, height: formIconSize),
                            labelText: 'Confirmar contraseña',
                            hintText: 'Confirmar contraseña',
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
        onTap: () async {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
            _formKey.currentState?.save();

            // createUser.createUser();
            final response = await createUser(CreateUserParams(userToCreate));

            if (response.isRight()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Usuario creado')),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error al crear usuario')),
              );
            }
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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Por favor ingrese su correo';
    }
    return null;
  }
}
