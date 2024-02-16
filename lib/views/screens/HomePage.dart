import 'dart:developer';

import 'package:examapp/utils/MyRoutes.dart';
import 'package:examapp/views/commponets/ad_container.dart';
import 'package:examapp/views/commponets/category.dart';
import 'package:examapp/views/commponets/row1.dart';
import 'package:examapp/views/commponets/row2.dart';
import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> allCategories = [];
  late String cat = 'no';

  @override
  void initState() {
    allCategories = products
        .map(
          (e) => e['category'].toString(),
        )
        .toSet()
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Icons.menu_open_sharp,
          color: Colors.white,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MyRoutes.CartPage);
            },
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: size.height * 0.01,
          )
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  adi.length,
                  (index) => ad(size: size, index: index),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allCategories
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              cat = e;
                              log(cat);
                            },
                          );
                        },
                        child: category(size: size, e: e, cat: cat),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    products.length ~/ 2,
                    (index) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    MyRoutes.DetailPage,
                                    arguments: products[index * 2]);
                              },
                              child: row1(
                                  size: size, index: index, context: context)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    MyRoutes.DetailPage,
                                    arguments: products[index * 2 + 1]);
                              },
                              child: row2(
                                  size: size, index: index, context: context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
