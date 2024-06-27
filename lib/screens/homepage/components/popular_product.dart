import 'package:flutter/material.dart';
import 'package:pro_s6/screens/homepage/components/section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {
              //TODO
            },
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [],
          ),
        ),
      ],
    );
  }
}

class Product {
  final String title, description;
  final List<String> images;
  final double price;

  Product(
    String s, {
    required this.images,
    required this.title,
    required this.price,
    required this.description,
  });
}
