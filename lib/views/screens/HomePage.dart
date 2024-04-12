import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:examapp/utils/MyRoutes.dart';
import 'package:examapp/views/commponets/ad_container.dart';
import 'package:examapp/views/commponets/category.dart';
import 'package:examapp/views/commponets/row1.dart';
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
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.zero,
          child: DrawerHeader(
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.15,
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
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
            CarouselSlider(
              items: List.generate(
                adi.length,
                (index) => ad(size: size, index: index),
              ),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                height: size.height * 0.3,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
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
                    products.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(MyRoutes.DetailPage,
                            arguments: products[index]);
                      },
                      child: row1(size: size, index: index, context: context),
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
