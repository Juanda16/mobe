import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.contact),
      content: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.name,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.email,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.phoneNumber,
                ),
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Model',
              //   ),
              // ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Color',
              //   ),
              // ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Year',
              //   ),
              // ),
              TextButton(
                child: Text(AppLocalizations.of(context)!.send),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send the form data to your server.
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }
}
