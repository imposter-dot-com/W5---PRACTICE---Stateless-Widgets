import 'package:flutter/material.dart';

enum Product {
  dart(
    imagePath: 'assets/ex3/dart.png',
    name: 'Dart',
    description: 'The best object language',
  ),
  flutter(
    imagePath: 'assets/ex3/flutter.png',
    name: 'Flutter',
    description: 'The best mobile widget library',
  ),
  firebase(
    imagePath: 'assets/ex3/firebase.png',
    name: 'Firebase',
    description: 'The best cloud database',
  );

  final String imagePath;
  final String name;
  final String description;

  const Product({
    required this.imagePath,
    required this.name,
    required this.description,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              ProductCard(product: Product.dart),
              SizedBox(height: 16),
              ProductCard(product: Product.flutter),
              SizedBox(height: 16),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230, 
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
