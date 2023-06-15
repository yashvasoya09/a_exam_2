import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/emodel.dart';
class apiHelper
{
  static apiHelper apihelper = apiHelper();
  Future<EModel> getapi()
  async {
    String? link='https://opentdb.com/api.php?amount=10&category=28&difficulty=medium&type=multiple';
    var responce = await http.get(Uri.parse(link));
    var Json = jsonDecode(responce.body);
    return  EModel.fromJson(Json);
  }
}