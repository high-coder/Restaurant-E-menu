import 'answersModel.dart';

class QuestionModel {
  final String question;
  List<AnswerModel> answers; // This list will also contain instance of the answerModel

  QuestionModel({this.question, this.answers});
}