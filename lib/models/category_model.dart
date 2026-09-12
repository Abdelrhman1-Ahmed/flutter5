import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CategoryItem {
  final String id;
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final IconData iconData;
  final String imageUrl;

  const CategoryItem({
    required this.id,
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconData,
    required this.imageUrl,
  });
}

class SampleCategories {
  static const List<CategoryItem> categories = [
    CategoryItem(
      id: 'c1',
      title: 'Fresh Fruits\n& Vegetable',
      backgroundColor: AppColors.catGreenBg,
      borderColor: AppColors.catGreenBorder,
      iconData: Icons.eco_outlined,
      imageUrl: 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=400&auto=format&fit=crop&q=60',
    ),
    CategoryItem(
      id: 'c2',
      title: 'Cooking Oil\n& Ghee',
      backgroundColor: AppColors.catOrangeBg,
      borderColor: AppColors.catOrangeBorder,
      iconData: Icons.opacity,
      imageUrl: 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=400&auto=format&fit=crop&q=60',
    ),
    CategoryItem(
      id: 'c3',
      title: 'Meat & Fish',
      backgroundColor: AppColors.catPinkBg,
      borderColor: AppColors.catPinkBorder,
      iconData: Icons.set_meal_outlined,
      imageUrl: 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400&auto=format&fit=crop&q=60',
    ),
    CategoryItem(
      id: 'c4',
      title: 'Bakery & Snacks',
      backgroundColor: AppColors.catPurpleBg,
      borderColor: AppColors.catPurpleBorder,
      iconData: Icons.bakery_dining_outlined,
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&auto=format&fit=crop&q=60',
    ),
    CategoryItem(
      id: 'c5',
      title: 'Dairy & Eggs',
      backgroundColor: AppColors.catYellowBg,
      borderColor: AppColors.catYellowBorder,
      iconData: Icons.egg_outlined,
      imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=400&auto=format&fit=crop&q=60',
    ),
    CategoryItem(
      id: 'c6',
      title: 'Beverages',
      backgroundColor: AppColors.catBlueBg,
      borderColor: AppColors.catBlueBorder,
      iconData: Icons.local_drink_outlined,
      imageUrl: 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=400&auto=format&fit=crop&q=60',
    ),
  ];
}
