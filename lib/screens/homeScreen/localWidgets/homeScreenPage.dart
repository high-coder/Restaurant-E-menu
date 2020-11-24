import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/pizzaContainer.dart';
import 'package:final_wala_final_pka/utils/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen_page extends StatefulWidget {
  @override
  _HomeScreen_pageState createState() => _HomeScreen_pageState();
}

class _HomeScreen_pageState extends State<HomeScreen_page> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false; // by default this will be false

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double availableWidth = size.width-40;
    return SingleChildScrollView(
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset,yOffset,0)..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        color: Colors.grey[200],
        child: SafeArea(
          child: Container(
            constraints: BoxConstraints(maxHeight: 2000), // adding this remov
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Align(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                xOffset = 230;
                                yOffset = 150;
                                scaleFactor = 0.7;
                                isDrawerOpen = true;
                              });
                            },
                              //padding: EdgeInsets.all(0),
                              child: isDrawerOpen? InkWell(
                                onTap:() {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios),
                              ):Icon(Icons.menu)
                          ),
                        )
                      ],
                    ),

                    Container(
                      //padding: EdgeInsets.only(top: 30),
                      //margin: EdgeInsets.only(right: 15),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFFF2BC57),
                              style: BorderStyle.solid,
                              width: 3),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Text(
                          "Gopal's", style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15
                      ),
                      )),
                    ),
                  ],
                ),

                // second child of the column a sized box
                SizedBox(height: 20,),

                // Third child of the column is a align widget inside of it is a column with 3 texts as children
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    //padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Good Evening \$name",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Montserrat'
                          ),),
                        SizedBox(height: 10,),
                        Text("Grab Your",style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Montserrat'
                        ),),
                        SizedBox(height: 10,),

                        Text("delicious meal!!", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                        ),),
                      ],
                    ),



                  ),
                ),

                SizedBox(height: 30,),


                // third child of the column is a row containing the search bar and the filter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: availableWidth/1.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              style: BorderStyle.solid,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(25)
                      ),

                        child:Container(
                            width: 200,
                            child: TextField(
                              inputFormatters: [
                                //FilteringTextInputFormatter.digitsOnly
                              ],
                              //keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  prefixIcon:Icon(Icons.search,color: Colors.black,),
                                  contentPadding: EdgeInsets.fromLTRB(0,10, 0, 0),
                                  hintText: 'Meals, desert, burgers',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,  // this is the default border applied the textfield
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16, color: Colors.black)),
                            ),
                          ),

                    ),
                    Container(
                      height: 55,
                      width: availableWidth/4.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              style: BorderStyle.solid,
                              width: 3
                          ),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.settings_input_component),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 30,),


                // fourth child of the column containing only the text Explore Categories...
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explore Categories", style: textStyleCustom,),
                    Text("...", style: textStyleCustom,),
                  ],
                ),
                SizedBox(height: 20,),

                // Fifth child of the column containing the categories in a list view builder
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                      // return Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       //padding: EdgeInsets.all(10),
                      //       margin: EdgeInsets.fromLTRB(00,0,20,0),
                      //       width: 80,
                      //       height:100,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(50),
                      //         color: Colors.white,
                      //         boxShadow: shadowList,
                      //       ),
                      //       child: Image.asset(categories[index]['path']),
                      //     ),
                      //     Center(child: Text(categories[index]['name'])),
                      //   ],
                      // );
                      return Container(
                        //padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 20,),
                        width: 80,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Container(
                              height:70,
                              width:70,
                              padding:EdgeInsets.only(top: 15),
                              child: Image.asset(categories[index]['path']),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(categories[index]['name'])),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20,),

                // Sixth child of the column containing the text Most polulat and ...
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Most Popular", style: textStyleCustom,),
                    Text("...", style: textStyleCustom,),
                  ],
                ),
                SizedBox(height: 20,),

              Expanded(
                child: Column(
                  children: [
                    //Builder.builder()
                    PizzaContainer(0),
                    PizzaContainer(1),
                    PizzaContainer(2),
                    PizzaContainer(3),
                    PizzaContainer(4),
                    PizzaContainer(5),
                    PizzaContainer(6),
                  ],
                ),
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
