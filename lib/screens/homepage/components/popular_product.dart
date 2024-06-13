import 'package:flutter/material.dart';
import 'package:pro_s6/screens/homepage/components/product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SectionTitle(
          title: "Popular Products",
          press: () {
            //TODO
          },
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [],
        ),
      )
    ]);
  }
}

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final double rating, price;

  Product({
    required this.id,
    required this.images,
    this.rating = 0.0,
    required this.title,
    required this.price,
    required this.description,
  });
}
