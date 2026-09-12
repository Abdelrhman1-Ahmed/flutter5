import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';
import 'shop_state.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopState = ShopState();

    return AnimatedBuilder(
      animation: shopState,
      builder: (context, _) {
        final items = shopState.cartItems;
        final subtotal = shopState.subtotal;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('My Cart'),
          ),
          body: items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 70,
                        color: AppColors.mutedText,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Your cart is empty',
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
                        itemCount: items.length,
                        separatorBuilder: (_, index) => const Divider(height: 32),
                        itemBuilder: (context, index) {
                          final cartItem = items[index];
                          final product = cartItem.product;

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Product Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product.imageUrl,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    width: 70,
                                    height: 70,
                                    color: product.badgeColor,
                                    child: const Icon(
                                      Icons.shopping_bag_outlined,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),

                              // Product Details & Counter
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            product.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: AppColors.darkText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            size: 20,
                                            color: AppColors.secondaryText,
                                          ),
                                          onPressed: () {
                                            shopState.removeFromCart(product.id);
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      product.unit,
                                      style: const TextStyle(
                                        color: AppColors.secondaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 12),

                                    // Counter Row & Price
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Counter
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                shopState.decrementQuantity(product.id);
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              child: Container(
                                                width: 38,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  border: Border.all(
                                                      color: AppColors.borderColor,
                                                      width: 1.2),
                                                ),
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 18,
                                                  color: AppColors.secondaryText,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 14),
                                              child: Text(
                                                '${cartItem.quantity}',
                                                style: const TextStyle(
                                                  color: AppColors.darkText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                shopState.incrementQuantity(product.id);
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              child: Container(
                                                width: 38,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  border: Border.all(
                                                      color: AppColors.borderColor,
                                                      width: 1.2),
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 18,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Total for this item
                                        Text(
                                          '\$${cartItem.totalPrice.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            color: AppColors.darkText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Checkout Button Bar
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: AppButton(
                          text: 'Go to Checkout',
                          trailingText: '\$${subtotal.toStringAsFixed(2)}',
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => CheckoutBottomSheet(totalCost: subtotal),
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
