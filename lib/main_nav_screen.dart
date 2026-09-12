import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'shop_state.dart';
import 'home_screen.dart';
import 'explore_screen.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'account_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final shopState = ShopState();

    return AnimatedBuilder(
      animation: shopState,
      builder: (context, _) {
        final cartCount = shopState.totalCartCount;

        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, -6),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: SafeArea(
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() => _currentIndex = index);
                },
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.darkText,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
                elevation: 0,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.storefront_outlined),
                    activeIcon: Icon(Icons.storefront),
                    label: 'Shop',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.manage_search_outlined),
                    activeIcon: Icon(Icons.manage_search),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Badge(
                      isLabelVisible: cartCount > 0,
                      label: Text('$cartCount'),
                      backgroundColor: AppColors.primary,
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                    activeIcon: Badge(
                      isLabelVisible: cartCount > 0,
                      label: Text('$cartCount'),
                      backgroundColor: AppColors.primary,
                      child: const Icon(Icons.shopping_cart),
                    ),
                    label: 'Cart',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
