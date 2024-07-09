import 'package:flutter/material.dart';
import 'package:pro_s6/screens/mode_view.dart';
import 'package:pro_s6/screens/product_display.dart';
import 'package:pro_s6/services/cart/cart_service.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ProductDisplay(
                  product: widget.product,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 130,
                  ),
                  child: Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Details',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          widget.product.description,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(vertical: BorderSide()),
                      color: Color.fromARGB(188, 54, 101, 244),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    height: 70,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ModelView(
                              model: widget.product.model,
                            ),
                          ),
                        );
                      },
                      child: const Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'View',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.vrpano_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       border: Border.symmetric(vertical: BorderSide()),
                //       color: Colors.red,
                //     ),
                //     height: 70,
                //     child: const Center(
                //         child: Icon(Icons.favorite_border_outlined)),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
