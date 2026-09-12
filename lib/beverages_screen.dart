import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/product_card.dart';
import 'models/product_model.dart';
import 'filter_bottom_sheet.dart';

typedef CategoryProductsScreen = BeveragesScreen;

class BeveragesScreen extends StatelessWidget {
  final String title;

  const BeveragesScreen({
    super.key,
    this.title = 'Beverages',
  });

  @override
  Widget build(BuildContext context) {
    final products = SampleProducts.allProducts
        .where((p) => p.category == title || title == 'Beverages' && p.category == 'Beverages')
        .toList();

    final displayProducts = products.isNotEmpty ? products : SampleProducts.allProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.darkText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AppColors.darkText, size: 24),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const FilterBottomSheet(),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.69,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemCount: displayProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: displayProducts[index]);
        },
      ),
    );
  }
}
