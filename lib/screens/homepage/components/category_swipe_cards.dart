import 'package:flutter/material.dart';
import 'package:pro_s6/screens/product_display.dart';
import 'package:pro_s6/screens/product_view.dart';
import 'section_title.dart';

class CategorySwipeCards extends StatefulWidget {
  const CategorySwipeCards({
    super.key,
  });

  @override
  State<CategorySwipeCards> createState() => _CategorySwipeCardsState();
}

class _CategorySwipeCardsState extends State<CategorySwipeCards> {
  List<ProductViewPage> products = [
    ProductViewPage('assets/bag_1.png', 'Bag', 'Beautiful bag', 2.33),
    ProductViewPage(
        'assets/chairs.jpg', 'Chair', 'Cap with beautiful design', 10)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Categories",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryCard(
                image: "assets/Sofa.jpg",
                category: "Sofas",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[1])));
                },
              ),
              CategoryCard(
                image: "assets/tables.jpg",
                category: "Tables",
                press: () {},
              ),
              CategoryCard(
                image: "assets/lamps.jpg",
                category: "Lamps",
                press: () {
                  //TODO
                },
              ),
              CategoryCard(
                image: "assets/chairs.jpg",
                category: "Chairs",
                press: () {
                  //TODO
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.image,
    required this.press,
  });

  final String category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 230,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
