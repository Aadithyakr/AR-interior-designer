import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pro_s6/services/cart/cart_service.dart';

class ProductService {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) async {
    await productsCollection.doc(product.id.toString()).set(product.toMap());
  }

  Future<Product?> getProduct(int productId) async {
    final doc = await productsCollection.doc(productId.toString()).get();
    if (doc.exists) {
      return Product.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<List<Product>> getAllProducts() async {
    final querySnapshot = await productsCollection.get();
    return querySnapshot.docs
        .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateProduct(Product product) async {
    await productsCollection.doc(product.id.toString()).update(product.toMap());
  }

  Future<void> deleteProduct(int productId) async {
    await productsCollection.doc(productId.toString()).delete();
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductService _productService = ProductService();
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final products = await _productService.getAllProducts();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ListTile(
                  leading: Image.network(
                    product.images.isNotEmpty ? product.images.first : '',
                  ),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toString()}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProduct = Product(
            'model3D_url',
            id: DateTime.now().millisecondsSinceEpoch, // Example ID generation
            images: ['image_url'],
            title: 'New Product',
            price: 19.99,
            description: 'A new product description',
          );
          await _productService.addProduct(newProduct);
          _fetchProducts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
