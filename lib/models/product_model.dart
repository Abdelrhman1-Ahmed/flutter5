import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String unit;
  final double price;
  final String description;
  final double rating;
  final int reviewsCount;
  final String nutritions;
  final String category;
  final String imageUrl;
  final Color badgeColor;
  final bool isExclusiveOffer;
  final bool isBestSelling;

  const Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.description,
    this.rating = 4.8,
    this.reviewsCount = 125,
    this.nutritions = '100gr',
    required this.category,
    required this.imageUrl,
    this.badgeColor = const Color(0xFFF2F3F2),
    this.isExclusiveOffer = false,
    this.isBestSelling = false,
  });
}

class SampleProducts {
  static const List<Product> allProducts = [
    // Exclusive Offer items
    Product(
      id: 'p1',
      name: 'Organic Bananas',
      unit: '7pcs, Price',
      price: 4.99,
      description: 'Organic bananas are high in potassium and vitamins. Great for morning smoothies or as an energetic quick snack.',
      rating: 4.9,
      reviewsCount: 210,
      nutritions: '100gr',
      category: 'Fresh Fruits & Vegetable',
      imageUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFFF9E5),
      isExclusiveOffer: true,
    ),
    Product(
      id: 'p2',
      name: 'Natural Red Apple',
      unit: '1kg, Price',
      price: 4.99,
      description: 'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthful and varied diet, the nutrients in apples can contribute to overall health.',
      rating: 5.0,
      reviewsCount: 340,
      nutritions: '100gr',
      category: 'Fresh Fruits & Vegetable',
      imageUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFDE8E4),
      isExclusiveOffer: true,
    ),

    // Best Selling items
    Product(
      id: 'p3',
      name: 'Bell Pepper Red',
      unit: '1kg, Price',
      price: 4.99,
      description: 'Crisp and sweet, organic red bell peppers are packed with vitamin C and antioxidants. Perfect for salads, sautéing, or grilling.',
      rating: 4.7,
      reviewsCount: 95,
      nutritions: '100gr',
      category: 'Fresh Fruits & Vegetable',
      imageUrl: 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFDE8E4),
      isBestSelling: true,
    ),
    Product(
      id: 'p4',
      name: 'Ginger',
      unit: '250g, Price',
      price: 4.99,
      description: 'Aromatic and spicy, fresh ginger root adds authentic depth to teas, marinades, and curries.',
      rating: 4.8,
      reviewsCount: 88,
      nutritions: '100gr',
      category: 'Fresh Fruits & Vegetable',
      imageUrl: 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFFF6EE),
      isBestSelling: true,
    ),

    // Groceries / Meat
    Product(
      id: 'p5',
      name: 'Beef Bone',
      unit: '1kg, Price',
      price: 4.99,
      description: 'Fresh quality beef soup bones, ideal for rich, nutritious, and hearty broths.',
      rating: 4.6,
      reviewsCount: 52,
      nutritions: '100gr',
      category: 'Meat & Fish',
      imageUrl: 'https://images.unsplash.com/photo-1603048588665-791ca8aea617?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFDE8E4),
    ),
    Product(
      id: 'p6',
      name: 'Broiler Chicken',
      unit: '1kg, Price',
      price: 4.99,
      description: 'Fresh farm broiler chicken, cleaned and dressed for roasting or cooking.',
      rating: 4.8,
      reviewsCount: 160,
      nutritions: '100gr',
      category: 'Meat & Fish',
      imageUrl: 'https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFFF6EE),
    ),

    // Beverages
    Product(
      id: 'p7',
      name: 'Diet Coke',
      unit: '355ml, Price',
      price: 1.99,
      description: 'Crisp, cold and calorie-free refreshment with the classic Diet Coke taste.',
      rating: 4.9,
      reviewsCount: 420,
      nutritions: '355ml',
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFEDF7FC),
    ),
    Product(
      id: 'p8',
      name: 'Sprite Can',
      unit: '325ml, Price',
      price: 1.50,
      description: 'Crisp, refreshing lemon-lime flavored soda. 100% natural flavors.',
      rating: 4.8,
      reviewsCount: 310,
      nutritions: '325ml',
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFEEF8F2),
    ),
    Product(
      id: 'p9',
      name: 'Apple & Grape Juice',
      unit: '2L, Price',
      price: 15.99,
      description: '100% blended pure fruit juice with no added artificial sugars or preservatives.',
      rating: 4.9,
      reviewsCount: 144,
      nutritions: '250ml',
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFF4EBF7),
    ),
    Product(
      id: 'p10',
      name: 'Orange Juice',
      unit: '2L, Price',
      price: 15.99,
      description: 'Freshly squeezed natural orange juice with juicy pulp and vitamin C.',
      rating: 4.9,
      reviewsCount: 180,
      nutritions: '250ml',
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFFF6EE),
    ),
    Product(
      id: 'p11',
      name: 'Coca Cola Can',
      unit: '325ml, Price',
      price: 4.99,
      description: 'The world’s favourite soft drink since 1886. Refreshing and uplifting.',
      rating: 4.9,
      reviewsCount: 560,
      nutritions: '325ml',
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1554866585-cd94860890b7?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFDE8E4),
    ),
    Product(
      id: 'p12',
      name: 'Pepsi Can',
      unit: '330ml, Price',
      price: 4.99,
      description: 'Bold, refreshing, robust cola flavor that satisfies your thirst.',
      rating: 4.7,
      reviewsCount: 290,
      nutritions: '330ml',
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1527960471264-932f39eb5846?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFEDF7FC),
    ),

    // Dairy & Eggs
    Product(
      id: 'p13',
      name: 'Egg Chicken Red',
      unit: '4pcs, Price',
      price: 1.99,
      description: 'Fresh brown farm eggs with wholesome yolks and rich protein.',
      rating: 4.8,
      reviewsCount: 90,
      nutritions: '100gr',
      category: 'Dairy & Eggs',
      imageUrl: 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFFF8E5),
    ),
    Product(
      id: 'p14',
      name: 'Egg Chicken White',
      unit: '180g, Price',
      price: 1.50,
      description: 'Grade A fresh white chicken eggs, selected for premium baking and breakfast.',
      rating: 4.7,
      reviewsCount: 75,
      nutritions: '100gr',
      category: 'Dairy & Eggs',
      imageUrl: 'https://images.unsplash.com/photo-1506976785307-8732e854ad03?w=500&auto=format&fit=crop&q=60',
      badgeColor: Color(0xFFFFF8E5),
    ),
  ];
}
