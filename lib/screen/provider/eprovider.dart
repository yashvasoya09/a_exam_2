import 'dart:math';

import 'package:a_exam_2/screen/utills/api%20helper.dart';
import 'package:flutter/foundation.dart';

import '../model/emodel.dart';

class EProvider extends ChangeNotifier {
  int qindex = 0;
  int? randomIndex1;
  int? randomIndex2;
  int? randomIndex3;
  Future<EModel> getData() {
    rendomoO();
    return apiHelper.apihelper.getapi();
  }

  void next() {
    qindex++;
    if (qindex > 9) {
      qindex = 0;
    }
    notifyListeners();
  }

  void rendomoO() {
    randomIndex1 = Random().nextInt(3);
    randomIndex2 = Random().nextInt(3);
    randomIndex3 = Random().nextInt(3);

    if (randomIndex1 == randomIndex2 && randomIndex1 == randomIndex3) {
      randomIndex1 = Random().nextInt(3);
    }
    if (randomIndex2 == randomIndex1 && randomIndex2 == randomIndex3)
  {
    randomIndex2 = Random().nextInt(3);
  }
    if (randomIndex3 == randomIndex1 && randomIndex3 == randomIndex1)
    {
      randomIndex2 = Random().nextInt(3);
    }
    notifyListeners();
  }
}
