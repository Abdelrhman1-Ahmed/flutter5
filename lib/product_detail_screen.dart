import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';
import 'models/product_model.dart';
import 'shop_state.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isDetailExpanded = true;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final shopState = ShopState();

    return AnimatedBuilder(
      animation: shopState,
      builder: (context, _) {
        final isFav = shopState.isFavorite(product.id);
        final totalPrice = product.price * _quantity;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined, size: 22),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Display Container
                      Container(
                        width: double.infinity,
                        height: 250,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.lightGray.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Hero(
                            tag: 'product_img_${product.id}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                product.imageUrl,
                                height: 200,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 80,
                                  color: AppColors.secondaryText.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Slider dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.borderColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.borderColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Title & Favorite
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.unit,
                                    style: const TextStyle(
                                      color: AppColors.secondaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => shopState.toggleFavorite(product.id),
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? AppColors.favoriteRed : AppColors.secondaryText,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Quantity and Price
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Counter
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_quantity > 1) {
                                      setState(() => _quantity--);
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.secondaryText,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: AppColors.borderColor, width: 1.2),
                                  ),
                                  child: Text(
                                    '$_quantity',
                                    style: const TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() => _quantity++);
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.primary,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Total Price
                            Text(
                              '\$${totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: AppColors.darkText,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(indent: 20, endIndent: 20),

                      // Product Detail Accordion
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isDetailExpanded = !_isDetailExpanded;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Product Detail',
                                    style: TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    _isDetailExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.darkText,
                                  ),
                                ],
                              ),
                              if (_isDetailExpanded) ...[
                                const SizedBox(height: 10),
                                Text(
                                  product.description,
                                  style: const TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const Divider(indent: 20, endIndent: 20),

                      // Nutritions
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Nutritions',
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    product.nutritions,
                                    style: const TextStyle(
                                      color: AppColors.secondaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: AppColors.darkText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(indent: 20, endIndent: 20),

                      // Reviews
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Review',
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => const Icon(
                                      Icons.star_rounded,
                                      color: AppColors.ratingAmber,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: AppColors.darkText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Bottom Button
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: AppButton(
                    text: 'Add To Basket',
                    onPressed: () {
                      shopState.addToCart(product, quantity: _quantity);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added $_quantity ${product.name} to basket!'),
                          duration: const Duration(seconds: 2),
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
