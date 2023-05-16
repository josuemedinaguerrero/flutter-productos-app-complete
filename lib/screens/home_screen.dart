import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (context, index) => GestureDetector(
          child: ProductCard(product: productsService.products[index]),
          onTap: () => Navigator.pushNamed(context, 'product'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
