import 'package:examapp/utils/all_product_data.dart';
import 'package:flutter/material.dart';

Widget category({required size, required e, required cat}) {
  return Container(
    height: size.height * 0.05,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: (cat == e) ? Colors.deepPurple : Colors.white,
      borderRadius: BorderRadius.circular(size.height * 0.015),
    ),
    alignment: Alignment.center,
    child: Text(
      e.toString().replaceFirst(
            e[0],
            e[0].toString().toUpperCase(),
          ),
      style: TextStyle(
        fontSize: size.height * 0.02,
        color: (cat == e) ? Colors.white : Colors.black,
        fontWeight: (cat == e) ? FontWeight.bold : FontWeight.bold,
        shadows: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 3),
            blurRadius: (5),
          ),
        ],
        letterSpacing: 1,
      ),
    ),
  );
}
