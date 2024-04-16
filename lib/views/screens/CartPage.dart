import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';
import 'package:examapp/views/commponets/row1.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void getState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              cartProducts.length,
              (index) => crow1(
                size: size,
                data: cartProducts,
                context: context,
                index: index,
                getState: getState,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
