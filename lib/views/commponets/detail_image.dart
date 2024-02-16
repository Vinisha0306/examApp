import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Image1({required size, required data, required index}) {
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.4,
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(data['images'][index]),
        fit: BoxFit.cover,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    ),
  );
}
