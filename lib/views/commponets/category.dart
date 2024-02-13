import 'package:examapp/utils/all_product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget category({required size, required e}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    margin: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1.5),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(3, 3),
          blurRadius: 2,
        ),
      ],
    ),
    child: Text(
      e.replaceFirst(
        e[0],
        e[0].toUpperCase(),
      ),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
