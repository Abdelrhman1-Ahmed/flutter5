import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';
import 'models/product_model.dart';
import 'shop_state.dart';
import 'product_detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopState = ShopState();

    return AnimatedBuilder(
      animation: shopState,
      builder: (context, _) {
        final favIds = shopState.favoriteProductIds;
        final favoriteProducts = SampleProducts.allProducts
            .where((p) => favIds.contains(p.id))
            .toList();

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Favorite'),
          ),
          body: favoriteProducts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.favorite_border,
                        size: 70,
                        color: AppColors.mutedText,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No favorites added yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    const Divider(),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        itemCount: favoriteProducts.length,
                        separatorBuilder: (_, index) => const Divider(height: 24),
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  // Product image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      product.imageUrl,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) =>
                                          Container(
                                        width: 60,
                                        height: 60,
                                        color: product.badgeColor,
                                        child: const Icon(
                                          Icons.shopping_bag_outlined,
                                          color: AppColors.secondaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 18),

                                  // Title & Unit
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            color: AppColors.darkText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          product.unit,
                                          style: const TextStyle(
                                            color: AppColors.secondaryText,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Price
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Chevron
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: AppColors.darkText,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Add All To Cart Button
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: AppButton(
                          text: 'Add All To Cart',
                          onPressed: () {
                            shopState.addAllFavoritesToCart();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('All favorites added to basket!'),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: AppColors.darkText,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
