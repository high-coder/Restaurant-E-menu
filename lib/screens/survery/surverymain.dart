import 'package:final_wala_final_pka/provider/surveyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveyUi extends StatefulWidget {
  @override
  _SurveyUiState createState() => _SurveyUiState();
}

class _SurveyUiState extends State<SurveyUi> {
  @override
  void initState() {
    SurverProvider instance = Provider.of<SurverProvider>(context, listen:false);
    super.initState();
    instance.getSurveryQuestion();

  }
  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemCount: 5,
      itemBuilder:(context, i ) {
        return Column(
          children: [
            Container(width: 200, height: 100, color: Colors.red,)
          ],
        );
      }
    );
  }
}
