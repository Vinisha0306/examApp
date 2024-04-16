import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examapp/utils/all_product_data.dart';

Widget row1({required size, required index, required context}) {
  return Container(
    height: size.height * 0.2,
    width: size.width,
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 3,
        )
      ],
    ),
    child: SingleChildScrollView(
      child: Row(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  products[index]['thumbnail'].toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    products[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    products[index]['description'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    products[index]['category'].toString().replaceFirst(
                          products[index]['category'][0],
                          products[index]['category'][0]
                              .toString()
                              .toUpperCase(),
                        ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "\$ ${products[index]['price'].toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget crow1(
    {required size,
    required index,
    required context,
    required data,
    required getState}) {
  return Container(
    height: size.height * 0.2,
    width: size.width - 32,
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 3,
        )
      ],
    ),
    child: SingleChildScrollView(
      child: Row(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  data[index]['thumbnail'].toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    data[index]['description'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    data[index]['category'].toString().replaceFirst(
                          data[index]['category'][0],
                          data[index]['category'][0].toString().toUpperCase(),
                        ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "\$ ${data[index]['price'].toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cartProducts.remove(data[index]);
              getState();
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
    ),
  );
}
