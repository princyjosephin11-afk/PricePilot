import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final String description;
  final int itemCount;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.description = '',
    this.itemCount = 0,
  });
}
