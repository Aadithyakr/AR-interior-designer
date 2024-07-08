import 'package:flutter/material.dart';
import 'package:pro_s6/screens/homepage/components/section_title.dart';
import 'package:pro_s6/screens/product_display.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            children: products
                .map(
                  (e) => Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.grey),
                          image: DecorationImage(image: AssetImage(e.image)),
                          borderRadius: BorderRadius.circular(30)),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Text(e.name)),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<ProductModel> products = [
  ProductModel(
    'assets/bag_1.png',
    'Bag',
    'Beautiful bag',
    2.33,
  ),
  ProductModel(
    'assets/chairs.jpg',
    'Chair',
    'Cap with beautiful design',
    10,
  ),
];
