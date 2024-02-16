import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';
import 'package:examapp/views/commponets/row1.dart';
import 'package:examapp/views/commponets/row2.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'cart page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            cartProducts.length ~/ 2,
            (index) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  crow1(
                      size: size,
                      data: cartProducts,
                      context: context,
                      index: index),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  crow2(
                      size: size,
                      data: cartProducts,
                      context: context,
                      index: index),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
