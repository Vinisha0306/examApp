import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';

Widget ad({required size, required index}) {
  return Container(
    width: size.width * 0.85,
    height: size.height * 0.3,
    margin: EdgeInsets.all(size.height * 0.01),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(adi[index]),
        fit: BoxFit.cover,
      ),
    ),
  );
}
