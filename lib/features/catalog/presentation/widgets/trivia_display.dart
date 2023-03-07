// import 'package:flutter/material.dart';
//
// import '../../domain/entities/motorcyvle.dart';
//
// class TriviaDisplay extends StatelessWidget {
//   final Motorcycle numberTrivia;
//
//   const TriviaDisplay({
//     Key? key,
//     required this.numberTrivia,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height / 3,
//       child: Column(
//         children: <Widget>[
//           Text(
//             numberTrivia.number.toString(),
//             style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Text(
//                   numberTrivia.text,
//                   style: const TextStyle(fontSize: 25),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
