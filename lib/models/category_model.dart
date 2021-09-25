import 'dart:math';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;

  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  Category({required this.id, this.title = ""});
}
