import 'package:flutter/material.dart';
class Disease {
  final String name;
  final String image;
  final String description;
  bool isBookmarked;

  Disease({
    required this.name,
    required this.image,
    required this.description,
    this.isBookmarked = false,
  });
}
