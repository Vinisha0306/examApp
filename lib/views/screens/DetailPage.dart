import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';
import 'package:examapp/utils/MyRoutes.dart';
import 'package:examapp/views/commponets/detail_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['title'],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(MyRoutes.HomePage);
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CarouselSlider(
              items: List.generate(
                data['images'].length,
                (index) => Image1(size: size, data: data, index: index),
              ),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                height: size.height * 0.3,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price : \$ ${data['price'].toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['description'],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RatingBarIndicator(
                    rating: double.parse(data['rating'].toString()),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add To Cart"),
        icon: const Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        onPressed: () {
          late SnackBar snackBar;

          if (cartProducts.contains(data)) {
            cartProducts.remove(data);
            snackBar = SnackBar(
                content: Text("${data['title']} remove from the CART !!"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating);
          } else {
            cartProducts.add(data);
            snackBar = SnackBar(
                content: Text("${data['title']} add the CART !!"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating);
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
