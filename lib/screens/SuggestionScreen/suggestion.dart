import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuggestionScreen extends StatefulWidget {
  @override
  _SuggestionScreenState createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Here is what ",style: TextStyle(color: Colors.black, fontSize: 20),),
        leading: Icon(FontAwesomeIcons.backward),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: size.width - 50,
            //padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(10, 0, 10,10 ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            height: size.height/4,
            //color: Colors.green,
            child: Column(
              children: [
                Row()
              ],
            ),
          );
        },
      ),
    );
  }
}
