import 'package:flutter/material.dart';

class Category {
  const Category({
    this.imageUrl,
    required this.id,
    required this.name,
    required this.sci_name,
    required this.climate,
    required this.soil,
    required this.season,
    required this.description,
    this.color = Colors.orange});
    
  final String? imageUrl;
  final String id;
  final String name;
  final String sciname;
  final String climate;
  final String soil;
  final String season;
  final String description;
  final Color color;
}