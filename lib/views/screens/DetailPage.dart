import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';
import 'package:examapp/utils/MyRoutes.dart';
import 'package:examapp/views/commponets/detail_image.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _detailState();
}

class _detailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['title'],
          style: const TextStyle(color: Colors.white),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: List.generate(data['images'].length,
                    (index) => Image1(size: size, data: data, index: index)),
              ),
            ],
          ),
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
                content: Text("${data['title']} remove from the CART !!"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating);
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
