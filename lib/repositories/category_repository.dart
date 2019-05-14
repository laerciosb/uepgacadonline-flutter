import 'package:uepgacadonline_flutter/models/category.dart';

class CategoryRepository {
  List<Category> categories = <Category>[
    Category(null, ''),
    Category(1, 'Apresentação'),
    Category(2, 'Prova'),
    Category(3, 'Trabalho'),
    Category(4, 'Outro')
  ];

  List<Category> all() {
    return categories;
  }

  Category find(int id) {
    return categories.where((category) => (category.id == id)).first ?? null;
  }
}

final categoryRepository = CategoryRepository();
