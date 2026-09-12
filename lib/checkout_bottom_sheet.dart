import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';
import 'shop_state.dart';
import 'order_accepted_screen.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final double totalCost;

  const CheckoutBottomSheet({
    super.key,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Checkout',
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.darkText, size: 24),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const Divider(),

          // Delivery Method
          _buildCheckoutOption(
            title: 'Delivery',
            value: 'Select Method',
            onTap: () {},
          ),
          const Divider(),

          // Payment
          _buildCheckoutOption(
            title: 'Payment',
            customTrailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.credit_card, size: 20, color: AppColors.darkText),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.darkText),
              ],
            ),
            onTap: () {},
          ),
          const Divider(),

          // Promo Code
          _buildCheckoutOption(
            title: 'Promo Code',
            value: 'Pick Discount',
            onTap: () {},
          ),
          const Divider(),

          // Total Cost
          _buildCheckoutOption(
            title: 'Total Cost',
            value: '\$${totalCost.toStringAsFixed(2)}',
            isValueBold: true,
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(height: 16),

          // Terms
          RichText(
            text: const TextSpan(
              text: 'By placing an order you agree to our ',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 13,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Terms And Conditions',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Place Order Button
          AppButton(
            text: 'Place Order',
            onPressed: () {
              ShopState().clearCart();
              Navigator.of(context).pop(); // dismiss sheet
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const OrderAcceptedScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildCheckoutOption({
    required String title,
    String? value,
    Widget? customTrailing,
    bool isValueBold = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            customTrailing ??
                Row(
                  children: [
                    if (value != null)
                      Text(
                        value,
                        style: TextStyle(
                          color: AppColors.darkText,
                          fontSize: 16,
                          fontWeight:
                              isValueBold ? FontWeight.bold : FontWeight.w600,
                        ),
                      ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios,
                        size: 14, color: AppColors.darkText),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
