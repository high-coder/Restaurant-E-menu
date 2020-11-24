import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_wala_final_pka/models/SurveryQuestionModel.dart';
import 'package:final_wala_final_pka/models/answersModel.dart';
import 'package:flutter/cupertino.dart';

class SurverProvider extends ChangeNotifier{

  //Step 3 Creating a _fireStore instance in the provider class
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  List<QuestionModel> questionsList = [];

  // This function gets all of the questionsData fromo the firebase and adds it to a list in the
  getSurveryQuestion() async {
    //print("Entering the function =====================================");
    String question;
    var snapShot = await _fireStore.collection("TagQuestions").get().then((value) => value.docs.forEach((element) {
      List<AnswerModel> answers=[];

      //answers.clear();
      print(element.id);
      question = element.id.toString(); // this will store the question
      //print(element.data());
      element.data().forEach((key, value) {
        answers.add(AnswerModel(answer: key.toString(), tag: value));
       //print(key);
        //print(value);
      });
      print(answers);
      questionsList.add(QuestionModel(question: question,answers: answers));
    }));
    // print(questionsList[0].answers);
    // print(questionsList[0].question);
    // print(questionsList[3].answers);
  }
}