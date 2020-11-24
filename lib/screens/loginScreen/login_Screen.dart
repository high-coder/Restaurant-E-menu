//import 'dart:collection';
//import 'dart:html';

//import 'package:final_wala_final_pka/abhi_files/contants.dart';
import 'package:final_wala_final_pka/screens/loginScreen/provider/loginProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'localWidgets/image_builder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {


  // This is the key for the Scaffold Widget
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String phoneNo, smsSent, verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _phoneNumberController =
  TextEditingController(); // The only Controller needed on this page
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final themeOfAppColor = Color(0XFFF70d5d);
  AnimationController
  _animController; // Declaration of the animation controller
  Animation<Offset> _offsetAnimation;
  Color _yellowish = Color(0xFFF2BC57);

  //int _currentPage = 0;
  // List<String> images = ["assets/images/1.png",
  //   "assets/images/2.png",
  //   "assets/images/3.png"];

  // void linkedlist() {
  //   var list = LinkedList<MyEntry>();
  //   list.add(MyEntry("assets/images/1.png"));
  //   list.add(MyEntry("assets/images/2.png"));
  //   list.add(MyEntry("assets/images/3.png"));
  // }
  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: Duration(seconds: 80),
      vsync: this,
    )
      ..repeat(reverse: false);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: const Offset(
        -1,
        0,
      ),
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _animController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider instanceP =
    Provider.of<LoginProvider>(context, listen: false);
    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final double textFieldWidth = screenWidth - 45 - 60;
    final double marginHeight = screenHeight / 7;

    // TextForm Fields controllers section
    // Either wrap this with the material or check why scaffols is not working
    return new Scaffold(
        key: scaffoldKey,
        //key: ,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topRight,
            //         end: Alignment.bottomLeft,
            //         colors: [
            //           Colors.yellow,
            //           Colors.yellowAccent,
            //           //Colors.orange[900]
            //           //Colors.orange[900]
            //         ]
            //     )
            // ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  //color: Colors.red,
                  //padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  child: Align(
                    //widthFactor: double.infinity,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      // When the user taps the button, show a snackbar.
                      onTap: () {},
                      child: Container(
                        //padding: EdgeInsets.all(1),
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          //border: BorderSide(),
                          border: Border.all(
                            color: themeOfAppColor.withOpacity(0.9),
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          //color: Colors.green,
                        ),
                        //padding: EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: _yellowish,
                                //color: Colors.black.withOpacity(0.5),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "APPETIZER",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontStyle: FontStyle.italic,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: _yellowish),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 0,
                ),

                Flexible(
                  flex: 4,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SlideTransition(
                        position: _offsetAnimation,
                        child: Row(
                          children: [
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                            ImageContainer(0),
                            ImageContainer(1),
                            ImageContainer(2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // here begins the text form field
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container(
                        //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        //     width: double.infinity,
                        //     height: 60.0,
                        //     child: TextFormField(
                        //       validator: (input) {
                        //         return null;
                        //       },
                        //       keyboardType: TextInputType.number,
                        //       inputFormatters: <TextInputFormatter>[
                        //         LengthLimitingTextInputFormatter(10),
                        //         WhitelistingTextInputFormatter.digitsOnly,
                        //
                        //       ],
                        //       decoration: InputDecoration(
                        //         errorBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(color: Colors.red),
                        //         ),
                        //         labelText:"Enter Phone Number",
                        //         hintText: "987787788x",
                        //         contentPadding: EdgeInsets.all(10),
                        //         labelStyle: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white70,
                        //           fontSize: 30,
                        //         ),
                        //       ),
                        //     )
                        // ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(20,0,20,0),
                        //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        //   width: double.infinity,
                        //   height: 60,
                        //   //padding: EdgeInsets.only(left:100, right:20),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30),
                        //       border: Border.all(
                        //           color: Colors.white, style: BorderStyle.solid)),
                        //   child: TextField(
                        //     //keyboardType: TextInputType.phone,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: <TextInputFormatter>[
                        //       LengthLimitingTextInputFormatter(10),
                        //       WhitelistingTextInputFormatter.digitsOnly,
                        //
                        //     ],
                        //     decoration: InputDecoration(
                        //         suffixIcon: Icon(
                        //           Icons.phone,
                        //           color: Colors.red,
                        //         ),
                        //         hintText: 'Enter your Phone',
                        //         enabledBorder: InputBorder.none,
                        //         focusedBorder: InputBorder.none,
                        //         hintStyle:
                        //         TextStyle(fontSize: 16, color: Colors.white)),
                        //   ),
                        // ),
                        Consumer<LoginProvider>(
                          builder: (context, _, Widget child) {
                            return Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                //border:BorderSide()
                                border: Border.all(
                                  color: instanceP.customColor,
                                  style: BorderStyle.solid,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: child,
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: _yellowish,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                    ),
                                  ),
                                  //color: Colors.green,
                                  width: 60,
                                  height: 54,
                                  child: Center(
                                      child: Text(
                                        "+91",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ))),
                              Container(
                                width: 184,
                                child: TextFormField(
                                  onChanged: (input) {
                                    instanceP.validator(input);
                                    phoneNo = "+91" + input;
                                  },

                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(10),
                                    WhitelistingTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (input) {
                                    return instanceP.validator(input);
                                  },
                                  //maxLength: 10,
                                  controller: _phoneNumberController,
                                  // this is the form Controller
                                  decoration: InputDecoration(
                                    contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    hintText: 'Enter your Phone',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    helperText: " ",
                                    disabledBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: _yellowish,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.all(0),
                              //   width:60,height:40,
                              //   child: FlatButton(
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(50)
                              //     ),
                              //     //padding: EdgeInsets.only(left: 20),
                              //     padding: EdgeInsets.all(0),
                              //     onPressed: () {},
                              //     child: SvgPicture.asset('assets/images/end.svg',color: themeOfAppColor,),
                              //   ),
                              // )

                              Container(
                                height: 40,
                                //minWidth: size.width / 2,
                                width: 50,
                                padding: EdgeInsets.only(left: 20),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  //color: themeOfAppColor,
                                  //height: 50,
                                  //minWidth: size.width / 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  onPressed: () {
                                    //final formState = _formKey.currentState;
                                    //instanceP.login(formState);
                                    //return null;
                                    if (instanceP.disableButton == true) {
                                      print("ti");
                                      scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Please Enter a valid number"),
                                          )
                                      );
                                    }
                                    else {
                                      FormState formState = _formKey
                                          .currentState;
                                      //_verifyPhone();
                                      instanceP.login(formState,
                                          scaffoldKey.currentContext);
                                    }
                                  },
                                  child: Consumer<LoginProvider>(
                                    builder: (context, _, Widget child) {
                                      return SvgPicture.asset(
                                        'assets/images/end.svg',
                                        color: instanceP.customColor,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // Container(
                        //   margin: EdgeInsets.only(left: 20, right: 20),
                        //   height: 60,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     //color: Colors.red,
                        //     //border:BorderSide()
                        //     border: Border.all(
                        //       color: _yellowish,
                        //       style: BorderStyle.solid,
                        //       width: 3,
                        //     ),
                        //     borderRadius: BorderRadius.circular(30),
                        //   ),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         enabled: true,
                        //         contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        //         hintText: 'Enter your Phone',
                        //         enabledBorder: InputBorder.none,
                        //         focusedBorder: InputBorder.none,
                        //         //helperText: " ",
                        //         disabledBorder: InputBorder.none,
                        //         focusedErrorBorder: InputBorder.none,
                        //         hintStyle: TextStyle(
                        //             fontFamily: 'Montserrat',
                        //             fontSize: 16,
                        //             color: _yellowish,
                        //             fontWeight: FontWeight.bold),
                        //         prefix: Container(
                        //             decoration: BoxDecoration(
                        //               color: _yellowish,
                        //               borderRadius: BorderRadius.only(
                        //                 topRight: Radius.circular(20),
                        //                 topLeft: Radius.circular(20),
                        //                 bottomLeft: Radius.circular(20),
                        //               ),
                        //             ),
                        //             //color: Colors.green,
                        //             width: 60,
                        //             child: Center(
                        //                 child: Text(
                        //               "+91",
                        //               style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 20,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontFamily: 'Montserrat'),
                        //             ))),
                        //         suffix: IconButton(
                        //             icon: Icon(Icons.navigate_next),
                        //             onPressed: () {
                        //               print("this si that");
                        //             })),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // )
                        // this is the button code
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        //   height: 50,
                        //   //minWidth: size.width / 2,
                        //   width: double.infinity,
                        //   child: FlatButton(
                        //     color: Colors.red,
                        //     //height: 50,
                        //     //minWidth: size.width / 2,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(30)),
                        //     onPressed: () {},
                        //     child: Text('Submit'),
                        //
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }


// Future<void> _verifyPhone() async{
//   print(phoneNo);
//   //_auth.verifyPhoneNumber(phoneNumber: null, verificationCompleted: null, verificationFailed: null, codeSent: null, codeAutoRetrievalTimeout: null)
//   final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
//     this.verificationId = verId;
//   };
//
//   final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResent])
//   async {
//     this.verificationId = verId;
//     smsCodeDialogue(context).then((value) {
//       print("Code Sent");
//     });
//   };
//   final PhoneVerificationCompleted verifiedSuccess = (PhoneAuthCredential phoneAuthCredential){};
//
//   final PhoneVerificationFailed verifyFailed = (FirebaseAuthException authException){
//     print(authException.code); // this is the updated version of the code
//   };
//   try {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       timeout: const Duration(seconds: 5),
//       verificationCompleted: verifiedSuccess,
//       verificationFailed: verifyFailed,
//       codeSent: smsCodeSent,
//       codeAutoRetrievalTimeout: autoRetrive,
//       //codeAutoRetrievalTimeout: null
//     );
//   } catch(e){
//     print(e);
//   }
// }
//
// Future <bool> smsCodeDialogue(BuildContext context)
// {
//   return showDialog(context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return new AlertDialog(
//         title: Text("Enter OTP"),
//         content: TextField(
//           onChanged: (value){
//             this.smsSent = value;
//           },
//         ),
//         contentPadding: EdgeInsets.all(20),
//         actions: [
//           FlatButton(
//             onPressed: (){
//               User _firebaseUser = _auth.currentUser;
//               if(_firebaseUser != null)
//               {
//                 Navigator.of(context).pop();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder:(context)=>LoginPage()
//                   ),
//                 );
//               }  else{
//                 Navigator.of(context).pop();
//                 signIn(smsSent);
//               }
//             },  // End of onPressed
//             child: Text('done',
//               style: TextStyle(
//                 color: Colors.white,fontSize: 20,
//               ),),
//           )
//         ],
//
//       );
//     },
//   );
// }
//
// Future<void> signIn(String smsCode) async{
//   final AuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verificationId , smsCode: smsCode);
//
//   try{
//     await _auth.signInWithCredential(credential);
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) => LoginPage(),
//     ),
//     );
//
//   } catch(e){
//
//     print(e);
//   }
//
// }


}
