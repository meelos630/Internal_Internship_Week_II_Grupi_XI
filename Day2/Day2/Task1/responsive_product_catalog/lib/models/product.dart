import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.color,
    required this.stockCount,
  });

  final String id;
  final String name;
  final String category;
  final double price;
  final IconData icon;
  final Color color;
  final int stockCount;

  bool get isInStock => stockCount > 0;
}

const List<Product> catalogProducts = [
  Product(
    id: 'p1',
    name: 'Wireless Headphones',
    category: 'Electronics',
    price: 79.99,
    icon: Icons.headset,
    color: Color(0xFF3A86FF),
    stockCount: 12,
  ),
  Product(
    id: 'p2',
    name: 'Smart Watch',
    category: 'Electronics',
    price: 129.50,
    icon: Icons.watch,
    color: Color(0xFF4361EE),
    stockCount: 8,
  ),
  Product(
    id: 'p3',
    name: 'Study Backpack',
    category: 'Accessories',
    price: 45.00,
    icon: Icons.work,
    color: Color(0xFF2D6A4F),
    stockCount: 20,
  ),
  Product(
    id: 'p4',
    name: 'Desk Lamp',
    category: 'Home',
    price: 24.99,
    icon: Icons.wb_incandescent,
    color: Color(0xFFFFB703),
    stockCount: 15,
  ),
  Product(
    id: 'p5',
    name: 'Running Shoes',
    category: 'Sports',
    price: 89.00,
    icon: Icons.directions_run,
    color: Color(0xFFE63946),
    stockCount: 6,
  ),
  Product(
    id: 'p6',
    name: 'Water Bottle',
    category: 'Sports',
    price: 14.75,
    icon: Icons.local_drink,
    color: Color(0xFF00B4D8),
    stockCount: 30,
  ),
  Product(
    id: 'p7',
    name: 'Notebook Set',
    category: 'School',
    price: 11.40,
    icon: Icons.book,
    color: Color(0xFF9B5DE5),
    stockCount: 18,
  ),
  Product(
    id: 'p8',
    name: 'Keyboard',
    category: 'Electronics',
    price: 54.90,
    icon: Icons.keyboard,
    color: Color(0xFF495057),
    stockCount: 10,
  ),
];
