import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_text_field.dart';
import 'core/widgets/carrot_icon.dart';
import 'core/widgets/product_card.dart';
import 'models/product_model.dart';
import 'beverages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exclusiveOffers = SampleProducts.allProducts
        .where((p) => p.isExclusiveOffer)
        .toList();
    final bestSelling = SampleProducts.allProducts
        .where((p) => p.isBestSelling)
        .toList();
    final groceryItems = SampleProducts.allProducts
        .where((p) => p.category == 'Meat & Fish')
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Header: Carrot Icon & Location
              Center(
                child: Column(
                  children: [
                    const CarrotIcon(size: 32),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, color: AppColors.darkText, size: 20),
                        SizedBox(width: 6),
                        Text(
                          'Dhaka, Banasree',
                          style: TextStyle(
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
              const SizedBox(height: 18),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextField(
                  label: '',
                  hint: 'Search Store',
                  controller: _searchController,
                  isSearchStyle: true,
                  onChanged: (val) {},
                ),
              ),
              const SizedBox(height: 20),

              // Fresh Vegetables Promo Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 12,
                        bottom: 4,
                        top: 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400&auto=format&fit=crop&q=60',
                            width: 130,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.eco, size: 70, color: AppColors.primary),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Fresh Vegetables',
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Get Up To 40% OFF',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Section: Exclusive Offer
              _buildSectionHeader(
                title: 'Exclusive Offer',
                onSeeAll: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CategoryProductsScreen(title: 'Beverages'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 245,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusiveOffers.length,
                  separatorBuilder: (_, index) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    return ProductCard(product: exclusiveOffers[index]);
                  },
                ),
              ),
              const SizedBox(height: 28),

              // Section: Best Selling
              _buildSectionHeader(
                title: 'Best Selling',
                onSeeAll: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CategoryProductsScreen(title: 'Beverages'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 245,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSelling.length,
                  separatorBuilder: (_, index) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    return ProductCard(product: bestSelling[index]);
                  },
                ),
              ),
              const SizedBox(height: 28),

              // Section: Groceries
              _buildSectionHeader(
                title: 'Groceries',
                onSeeAll: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CategoryProductsScreen(title: 'Beverages'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),

              // Groceries categories pills
              SizedBox(
                height: 90,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildGroceryCategoryCard(
                      title: 'Pulses',
                      bgColor: const Color(0xFFFFF6EE),
                      icon: Icons.grain,
                      iconColor: const Color(0xFFF8A44C),
                    ),
                    const SizedBox(width: 14),
                    _buildGroceryCategoryCard(
                      title: 'Rice',
                      bgColor: const Color(0xFFEEF8F2),
                      icon: Icons.rice_bowl,
                      iconColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Groceries Product Cards Horizontal
              SizedBox(
                height: 245,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: groceryItems.length,
                  separatorBuilder: (_, index) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    return ProductCard(product: groceryItems[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onSeeAll,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkText,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3,
            ),
          ),
          InkWell(
            onTap: onSeeAll,
            child: const Text(
              'See all',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroceryCategoryCard({
    required String title,
    required Color bgColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
