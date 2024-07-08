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
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(250, 87, 141, 1.000),
                          Color.fromRGBO(249, 106, 108, 1.000),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    height: 270,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(231, 77, 129, 1.000),
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                              image: AssetImage(e.image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'Add to favourite',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
    'Sofa',
    'Beautiful bag',
    2.33,
  ),
  ProductModel(
    'assets/chairs.jpg',
    'Bed',
    'Cap with beautiful design',
    10,
  ),
  ProductModel(
    'assets/chairs.jpg',
    'Chair',
    'Cap with beautiful design',
    10,
  ),
  ProductModel(
    'assets/chairs.jpg',
    'Table',
    'Cap with beautiful design',
    10,
  ),
  ProductModel(
    'assets/chairs.jpg',
    'Couch',
    'Cap with beautiful design',
    10,
  ),
  ProductModel(
    'assets/chairs.jpg',
    'Chair',
    'Cap with beautiful design',
    10,
  ),
];
