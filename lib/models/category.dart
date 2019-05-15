import 'package:flutter/material.dart';

class Category {
  Category(this.id, this.name);

  int id;
  String name;

  IconData get iconData {
    IconData value;

    switch (id) {
      case 1:
        value = Icons.group;
        break;
      case 2:
        value = Icons.local_library;
        break;
      case 3:
        value = Icons.library_books;
        break;
      default:
        value = Icons.edit;
    }

    return value;
  }

  Color get color {
    Color value;

    switch (id) {
      case 1:
        value = Colors.orange;
        break;
      case 2:
        value = Colors.purple;
        break;
      case 3:
        value = Colors.red;
        break;
      default:
        value = Colors.grey;
    }

    return value;
  }
}
