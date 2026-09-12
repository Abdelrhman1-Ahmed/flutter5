import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _AccountMenuItem(icon: Icons.shopping_bag_outlined, title: 'Orders'),
      _AccountMenuItem(icon: Icons.badge_outlined, title: 'My Details'),
      _AccountMenuItem(icon: Icons.location_on_outlined, title: 'Delivery Address'),
      _AccountMenuItem(icon: Icons.credit_card_outlined, title: 'Payment Methods'),
      _AccountMenuItem(icon: Icons.confirmation_num_outlined, title: 'Promo Card'),
      _AccountMenuItem(icon: Icons.notifications_none_outlined, title: 'Notifications'),
      _AccountMenuItem(icon: Icons.help_outline, title: 'Help'),
      _AccountMenuItem(icon: Icons.info_outline, title: 'About'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // User Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&auto=format&fit=crop&q=80',
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Afsar Hossen',
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.edit_outlined,
                              color: AppColors.primary,
                              size: 18,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'imshuvo97@gmail.com',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Menu Items List
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: menuItems.length,
                separatorBuilder: (_, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    leading: Icon(item.icon, color: AppColors.darkText, size: 22),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        color: AppColors.darkText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: AppColors.darkText,
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout, color: AppColors.primary, size: 20),
                      SizedBox(width: 14),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountMenuItem {
  final IconData icon;
  final String title;

  _AccountMenuItem({required this.icon, required this.title});
}
