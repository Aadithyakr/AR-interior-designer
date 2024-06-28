import 'package:pro_s6/services/cart/product.dart';

abstract class CartProvider {
  Future<Iterable<Product>> get cartItems;

  void addToCart({required Product product});

  void removeFromCart({required Product product});

  void emptyCart();

  void checkOut({Product? product});
}
