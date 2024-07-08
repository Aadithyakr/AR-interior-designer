import 'package:flutter/material.dart';
import 'package:pro_s6/screens/homepage/components/section_title.dart';
import 'package:pro_s6/services/cart/cart_service.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
          ),
        ),
        SingleChildScrollView(
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

List<Product> products = [
  Product(
    name: 'Sofa',
    description: 'Beautiful bag',
    id: 1,
    image: 'assets/sofa.png',
  ),
  Product(
    name: 'Bed',
    description: 'Cap with beautiful design',
    id: 2,
    image: 'assets/bed.png',
  ),
  Product(
    name: 'Chair',
    description: 'Cap with beautiful design',
    id: 3,
    image: 'assets/chair.png',
  ),
  Product(
    name: 'Table',
    description: 'Cap with beautiful design',
    id: 4,
    image: 'assets/table.png',
  ),
  Product(
    name: 'Couch',
    description: 'Cap with beautiful design',
    id: 5,
    image: 'assets/couch.png',
  ),
  Product(
    name: 'Chair',
    description: 'Cap with beautiful design',
    id: 6,
    image: 'assets/chairs.jpg',
  ),
];
