import 'package:flutter/material.dart';
import 'package:pro_s6/app_properties.dart';
import 'package:pro_s6/services/cart/cart_service.dart';

class ProductDisplay extends StatelessWidget {
  final Product product;

  const ProductDisplay({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: const Alignment(-1, 0),
          child: Padding(
            padding: const EdgeInsets.only(right: 1.0, left: 1.0),
            child: SizedBox(
              height: screenAwareSize(240, context),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 18.0,
                    ),
                    child: Hero(
                      tag: product.image,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
