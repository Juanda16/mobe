import 'package:flutter/material.dart';

import '../../../domain/entities/user/user.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser; // Add a currentUser property

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // final _auth = FirebaseAuth.instance;
  // final _database = FirebaseDatabase.instance;
  late User _user; // Get the current user from the widget
  final _displayNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = widget.currentUser; // Get the current user from the widget
    print('User: $_user');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          // Display the user's current profile picture
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_user.imageUrl ?? ''),
          ),
          const SizedBox(height: 20),
          // Name field
          TextFormField(
            controller: _displayNameController,
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // Age field
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'nueva contraseña'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por vafor ingrese su nueva contraseña';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // Update button
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // Update the user's profile in Firebase
                // await _user?.updateDisplayName(_displayNameController.text);
                // await _user?.updatePhotoURL(_user?.photoURL ?? '');
                // // Update the user's profile in the database
                // await _database
                //     .ref('userProfileBrowse')
                //     .child(_user?.uid)
                //     .update({
                //   'name': _displayNameController.text,
                //   'age': int.parse(_ageController.text),
                // });
                // Show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully')),
                );
              }
            },
            child: Text('Update Profile'),
          ),
        ],
      ),
    );
  }
}
