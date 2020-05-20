// import 'package:flutter/material.dart';

// class TransactionItem extends StatelessWidget {
//   final String id;
//   final String title;
//   final double amount;
//   final DateTime date;

//   TransactionItem({
//     @required this.id,
//     @required this.title,
//     @required this.amount,
//     @required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 400,
//       child: Card(
//         elevation: 6,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Column(
//               children: <Widget>[Text(amount.toString())],
//             ),
//             Column(
//               children: <Widget>[
//                 Text(title),
//                 Text(date.toLocal().toString()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
