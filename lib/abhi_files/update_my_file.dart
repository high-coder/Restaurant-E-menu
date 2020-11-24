// //import 'package:final_app/screens/localWidgets/image_builder.dart';
// import 'package:final_wala_final_pka/screens/loginScreen/localWidgets/image_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'contants.dart';
// //import 'package:practice_custom_paint/login/contants.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// //import 'pageView.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   AnimationController
//   _animController; // Declaration of the animation controller
//   Animation<Offset> _offsetAnimation;
//
//   //int _currentPage = 0;
//   List<String> images = [
//     "assets/images/1.png",
//     "assets/images/2.png",
//     "assets/images/3.png"
//   ];
//
//   // void linkedlist() {
//   //   var list = LinkedList<MyEntry>();
//   //   list.add(MyEntry("assets/images/1.png"));
//   //   list.add(MyEntry("assets/images/2.png"));
//   //   list.add(MyEntry("assets/images/3.png"));
//   // }
//   @override
//   void initState() {
//     super.initState();
//     _animController = AnimationController(
//       duration: Duration(seconds: 80),
//       vsync: this,
//     )..repeat(reverse: false);
//
//     _offsetAnimation = Tween<Offset>(
//       begin: Offset(0, 0),
//       end: const Offset(
//         -1,
//         0,
//       ),
//     ).animate(CurvedAnimation(
//       parent: _animController,
//       curve: Curves.linear,
//     ));
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _animController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double textFieldWidth = screenWidth - 45 - 60;
//     final double marginHeight = screenHeight / 7;
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Container(
//           // decoration: BoxDecoration(
//           //     gradient: LinearGradient(
//           //         begin: Alignment.topCenter,
//           //         end: Alignment.bottomLeft,
//           //         colors: [
//           //           Color(0xFFF2BC57).withOpacity(0.4), Color(0xFFFCFCFC),
//           //           //Colors.orange[900]
//           //           //Colors.orange[900]
//           //         ])),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.end,
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 //padding: EdgeInsets.all(20),
//                 margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
//                 child: Align(
//                   //widthFactor: double.infinity,
//                   alignment: Alignment.topRight,
//                   child: InkWell(
//                     // When the user taps the button, show a snackbar.
//                     onTap: () {},
//                     child: Container(
//                       //padding: EdgeInsets.all(1),
//                       width: 60,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         //border: BorderSide(),
//                         border: Border.all(
//                           color: Colors.grey.withOpacity(0.9),
//                           style: BorderStyle.solid,
//                           width: 2,
//                         ),
//                         //color: Colors.green,
//                       ),
//                       //padding: EdgeInsets.all(12.0),
//                       child: Center(
//                           child: Text(
//                             'Skip',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFFF2BC57),
//                               fontWeight: FontWeight.bold
//                             ),
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/logo.png',
//                       height: 90,
//                     ),
//                     RichText(
//                       text: TextSpan(children: [
//                         TextSpan(
//                           text: 'A',
//                           style: TextStyle(
//                             fontFamily: 'Ubuntu',
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFF2BC57),
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'p',
//                           style: TextStyle(
//                             fontFamily: 'Ubuntu',
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFF2BC57),
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'itizer',
//                           style: TextStyle(
//                             fontFamily: 'Ubuntu',
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFF2BC57),
//                           ),
//                         )
//                       ]),
//                     ),
//                   ],
//                 ),
//                 // child:
//               ),
//
//               SizedBox(
//                 height: 0,
//               ),
//
//               Flexible(
//                 flex: 4,
//                 child: ListView(
//                   physics: NeverScrollableScrollPhysics(), // bydeflaut
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     SlideTransition(
//                       position: _offsetAnimation,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                           ImageContainer(0),
//                           ImageContainer(1),
//                           ImageContainer(2),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // Flexible(
//               //   //flex: ,
//               //     child: SizedBox(height: 50,)
//               // ),
//
//               // here begins the text form field
//               SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(bottom: 20),
//                         width: size.width - 50,
//                         padding: EdgeInsets.only(
//                             left: kpadding * 10,right: kpadding*5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             border: Border.all(
//                                 color: Color(0xFFF2BC57),
//                                 style: BorderStyle.solid,
//                                 width: 3)),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 width: size.width - 80,
//                                 child: TextField(
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly
//                                   ],
//                                   keyboardType: TextInputType.phone,
//                                   decoration: InputDecoration(
//                                       hintText: 'Enter your Phone',
//                                       enabledBorder: InputBorder.none,
//                                       focusedBorder: InputBorder.none,
//                                       hintStyle: TextStyle(
//                                           fontSize: 16, color: Color(0xFFF2BC57))),
//                                 ),
//                               ),
//                             ),
//                             Container(width:60,height:40,
//                               child: FlatButton(
//                                 onPressed: () {},
//                                 child: SvgPicture.asset('assets/images/end.svg',color: Color(0xFFF2BC57),),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //
// // class MyEntry extends LinkedListEntry<MyEntry> {
// //   final String id;
// //   MyEntry(this.id);
// // }
// //
