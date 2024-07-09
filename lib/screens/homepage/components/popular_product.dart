import 'package:flutter/material.dart';
import 'package:pro_s6/screens/favourite_view.dart';
import 'package:pro_s6/screens/homepage/components/section_title.dart';
import 'package:pro_s6/screens/product_view.dart';
import 'package:pro_s6/services/cart/cart_service.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  final String userId;
  const PopularProducts({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SectionTitle(
              title: "Popular Products",
            ),
          ),
          SingleChildScrollView(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Wrap(
                  children: products
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductPage(product: e),
                              ),
                            );
                          },
                          child: Container(
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
                                    color: const Color.fromRGBO(
                                        231, 77, 129, 1.000),
                                    borderRadius: BorderRadius.circular(60),
                                    image: DecorationImage(
                                      image: AssetImage(e.image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                InkWell(
                                  onTap: () {
                                    //TODO: add products to cart
                                    bool hasElement =
                                        cartProvider.cartItems.any(
                                      (element) => element.id == e.id,
                                    );
                                    if (hasElement) {
                                      cartProvider.removeProductFromCart(
                                        userId,
                                        e,
                                      );
                                    } else {
                                      cartProvider.addProductToCart(
                                        userId,
                                        e,
                                      );
                                    }
                                  },
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
                                      'ADD TO 🩷',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Product> products = [
  Product(
    name: 'Sofa',
    description: 'Beautiful bag',
    id: 1,
    image: 'assets/sofa.png',
    model: 'assets/models/single_sofa.glb',
  ),
  Product(
    name: 'Bed',
    description: 'Cap with beautiful design',
    id: 2,
    image: 'assets/bed.png',
    model: 'assets/models/Sofa2_V2.glb',
  ),
  Product(
    name: 'Chair',
    description: 'Cap with beautiful design',
    id: 3,
    image: 'assets/chair.png',
    model: 'assets/models/Chair1.glb',
  ),
  Product(
    name: 'Table',
    description: 'Cap with beautiful design',
    id: 4,
    image: 'assets/table.png',
    model: 'assets/models/Table1.glb',
  ),
  Product(
    name: 'Couch',
    description: 'Cap with beautiful design',
    id: 5,
    image: 'assets/couch.png',
    model: 'assets/models/Sofa1.glb',
  ),
  Product(
    name: 'Chair',
    description: 'Cap with beautiful design',
    id: 6,
    image: 'assets/chairs.jpg',
    model: 'assets/models/table2.glb',
  ),
];
