import 'package:flutter/material.dart';

loaderOn(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Center(
            child: Container(
          height: 60,
          width: 60,
          decoration:
              const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/loader/mobe2.gif'),
            // child: Image.asset('assets/loader/mobe2.gif'),
          ),
        ));
      });
}
