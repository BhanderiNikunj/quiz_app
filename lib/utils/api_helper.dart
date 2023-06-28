import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/Quiz/model/quiz_model.dart';

class Helper
{
  static Helper helper=Helper();
  Future<QuizModel> quiz_Api()
  async {
    String link="https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple";
    var response=await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    QuizModel? quiz;
    quiz=QuizModel.fromJson(json);
    return quiz;
  }
}