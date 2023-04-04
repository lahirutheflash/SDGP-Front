import 'package:flutter/cupertino.dart';

import 'Disease.dart';
import 'demoData.dart';

class DiseaseProvider extends ChangeNotifier {
  List<Disease> _diseases = demoMediumCardData.map((data) {
    return Disease(
      name: data['name']!,
      image: data['image']!,
      description: data['des']!,
      isBookmarked: false,
    );
  }).toList();

  List<Disease> get diseases => _diseases;

  void toggleBookmark(int index) {
    _diseases[index].isBookmarked = !_diseases[index].isBookmarked;
    notifyListeners();
  }
}
