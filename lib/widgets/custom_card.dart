import 'package:flutter/material.dart';

Widget customCard(
    {required String title, required double width, required double height}) {
  return SizedBox(
    width: width,
    height: height,
    child: Card(
      elevation: 4,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    ),
  );
}
