// import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
// import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/listviewthing.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
//
// import 'headerTexts.dart';
// //import 'imageContainerCustom.dart';
//
// Future categoryFuture;
// Future FeaturedProducts;
//
// class SampleText extends StatefulWidget {
//   @override
//   _SampleTextState createState() => _SampleTextState();
// }
//
// class _SampleTextState extends State<SampleText> {
//
//   getFuturesFood() async {
//     MainScreenProvider providerInstance =
//         Provider.of<MainScreenProvider>(context, listen: false);
//
//     // await providerInstance.getProduct();   // It will get all the products inside of the database
//     // await providerInstance.getImageUrl();  // THIS will convert all the urls into the links
//     // //for (int i = 0; i < providerInstance.productAll.length; i++) {}
//     // await providerInstance.getCategory();
//     print("Above load all data");
//     await providerInstance.loadAllData();
//     print("Below load all data");
//     categoryFuture = providerInstance.getCategoryForFutureBuilder();
//
//     //categoryFuture = providerInstance.getCategory();
//    // providerInstance.convertCategory("Burger");
//     FeaturedProducts = providerInstance.getFeatured();
//   }
//
//   HeaderTextCustom instanceHeaderClass = HeaderTextCustom();
//
//   @override
//   void initState() {
//     super.initState();
//     MainScreenProvider providerInstance =
//         Provider.of<MainScreenProvider>(context, listen: false);
//     getFuturesFood();
//     //providerInstance.getFeatured();
//     //print(providerInstance.FeaturedItemsId);
//     //providerInstance.getProduct();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     MainScreenProvider providerInstance =
//         Provider.of<MainScreenProvider>(context, listen: false);
//     print("Whole app building --------------------------------------");
//     Size size = MediaQuery.of(context).size;
//     return SliverToBoxAdapter(
//       child: Container(
//         margin: EdgeInsets.only(top: 20),
//         padding: EdgeInsets.only(left: 20, right: 20),
//         //height: 100,
//         //child: Image(image: AssetImage("assets/images/new/bgmain.jpg"),height: 200,width: 200, fit: BoxFit.fitWidth,),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "Featured Items",
//                   style: TextStyle(
//                       fontSize: 25,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   width: 6,
//                 ),
//                 Column(
//                   children: [
//                     Consumer<MainScreenProvider>(
//                       builder: (BuildContext context, MainScreenProvider instanV2, Widget child){
//                         return Container(
//                           child: FutureBuilder(
//                             future: FeaturedProducts,
//                             builder: (context,snapshot){
//                               //print("In the future builder for category name");
//                               switch (snapshot.connectionState){
//                                 case ConnectionState.none:
//                                   return Text("loading.....");
//                                 case ConnectionState.waiting:
//                                   return Text("Waiting");
//                                 case ConnectionState.done:
//                                   return Container(
//                                     height: 20,
//                                     width: 20,
//                                     child: Center(
//                                         child: Text(
//                                           providerInstance.FeaturedFood.length.toString(),
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'Montserrat'),
//                                         )),
//                                     decoration: BoxDecoration(
//                                       color: Colors.yellow,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   );
//
//                                 default:
//                                   return Text("Some error occured");
//                               }
//                               // if(providerInstance.FeaturedFood.isEmpty){
//                               //   return Text("Loading.....");
//                               // }
//                               // else{
//                               //   return Container(
//                               //     height: 20,
//                               //     width: 20,
//                               //     child: Center(
//                               //         child: Text(
//                               //           providerInstance.FeaturedFood.length.toString(),
//                               //           style: TextStyle(
//                               //               color: Colors.white,
//                               //               fontWeight: FontWeight.bold,
//                               //               fontFamily: 'Montserrat'),
//                               //         )),
//                               //     decoration: BoxDecoration(
//                               //       color: Colors.yellow,
//                               //       borderRadius: BorderRadius.circular(10),
//                               //     ),
//                               //   );
//                               // }
//                             },
//                           ),
//                         );
//                       },
//
//                     ),
//                     // Container(
//                     //   height: 20,
//                     //   width: 20,
//                     //   child: Center(
//                     //       child: Text(
//                     //     "9",
//                     //     style: TextStyle(
//                     //         color: Colors.white,
//                     //         fontWeight: FontWeight.bold,
//                     //         fontFamily: 'Montserrat'),
//                     //   )),
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.yellow,
//                     //     borderRadius: BorderRadius.circular(10),
//                     //   ),
//                     // ),
//                     Container(
//                       height: 10,
//                       width: 10,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             // FutureBuilder(
//             //   future: FeaturedProducts,
//             //   builder: (context, snapshot){
//             //     if(providerInstance.fe)
//             //   },
//             // ),
//
//             Consumer<MainScreenProvider>(
//               builder: (BuildContext context, MainScreenProvider instanceV,
//                   Widget child) {
//                 return FutureBuilder(
//                     future: FeaturedProducts,
//                     builder: (context, snapShot) {
//                       if (providerInstance.FeaturedFood.isEmpty) {
//                         return Text("Loading");
//                       }
//                       //print(providerInstance.FeaturedFood[0].name);
//                       return Container(
//                         height: 200,
//                         child: ListView.builder(
//                           cacheExtent: 10,   // how many items should be cached
//                           //addAutomaticKeepAlives: true,
//                           scrollDirection: Axis.horizontal,
//                           itemCount: providerInstance.FeaturedFood.length,
//                           itemBuilder: (BuildContext context, index) {
//                             // print(
//                             //     "===========================================================================url");
//                             // print(providerInstance.FeaturedFood[index].url);
//                             // return Row(
//                             //   children: [
//                             //     Container(
//                             //       width: size.width - 80,
//                             //       height: size.height / 3,
//                             //       decoration: BoxDecoration(
//                             //         image: DecorationImage(
//                             //             image:
//                             //             AssetImage(
//                             //                 "assets/images/new/bgmain2.jpg"),
//                             //             fit: BoxFit.cover),
//                             //         borderRadius: BorderRadius.circular(20),
//                             //       ),
//                             //       child: Stack(
//                             //
//                             //           children: [
//                             //             ImageContainerCustom(url:providerInstance.FeaturedFood[index].url),
//                             //             Container(
//                             //               decoration: BoxDecoration(
//                             //                   borderRadius: BorderRadius
//                             //                       .circular(20),
//                             //                   gradient: LinearGradient(
//                             //                     colors: [
//                             //                       Colors.black.withOpacity(
//                             //                           0.6),
//                             //                       Colors.white.withOpacity(
//                             //                           0.1)
//                             //                     ],
//                             //                     begin: Alignment.bottomLeft,
//                             //                     end: Alignment.bottomRight,
//                             //                   )),
//                             //             ),
//                             //
//                             //             Padding(
//                             //               padding: EdgeInsets.only(
//                             //                   left: 20, right: 20, top: 20),
//                             //               child: Column(
//                             //                 crossAxisAlignment: CrossAxisAlignment
//                             //                     .start,
//                             //                 children: [
//                             //                   Row(
//                             //                     mainAxisAlignment: MainAxisAlignment
//                             //                         .spaceBetween,
//                             //                     children: [
//                             //                       Container(
//                             //                         width: 70,
//                             //                         height: 30,
//                             //                         decoration: BoxDecoration(
//                             //                           borderRadius: BorderRadius
//                             //                               .circular(20),
//                             //                           color: Colors.white,
//                             //                         ),
//                             //                         child: Center(
//                             //                           child: Text(
//                             //                             providerInstance.FeaturedFood[index]
//                             //                                 .price
//                             //                             ,
//                             //                             style: TextStyle(
//                             //                                 fontSize: 20,
//                             //                                 color: Colors
//                             //                                     .black,
//                             //                                 fontFamily: 'Montserrat',
//                             //                                 fontWeight: FontWeight
//                             //                                     .bold),
//                             //                           ),
//                             //                         ),
//                             //                       ),
//                             //                       Icon(FontAwesomeIcons
//                             //                           .solidHeart,
//                             //                         color: Colors.white,)
//                             //                     ],
//                             //                   ),
//                             //                   SizedBox(
//                             //                     height: size.height / 4 /
//                             //                         7,),
//                             //                   Text(providerInstance.FeaturedFood[index].name,
//                             //                     style: TextStyle(
//                             //                       color: Colors.white,
//                             //                       fontWeight: FontWeight
//                             //                           .bold,
//                             //                       fontSize: 25,
//                             //                       fontFamily: 'Montserrat',
//                             //                     ),),
//                             //                   Text("Cripsy Roll",
//                             //                     style: TextStyle(
//                             //                       color: Colors.white,
//                             //                       fontFamily: 'Montserrat',
//                             //                       fontWeight: FontWeight
//                             //                           .w600,
//                             //                     ),),
//                             //                   Container(
//                             //                     width: 60,
//                             //                     height: 30,
//                             //                     child: Row(
//                             //                       children: [
//                             //                         Text("4.5",
//                             //                           style: TextStyle(
//                             //                               color: Colors
//                             //                                   .white,
//                             //                               fontWeight: FontWeight
//                             //                                   .bold),),
//                             //                         Icon(
//                             //                           FontAwesomeIcons.star,
//                             //                           color: Colors.yellow,
//                             //                           size: 20,),
//                             //                       ],
//                             //                     ),
//                             //                   )
//                             //                 ],
//                             //               ),
//                             //             ),
//                             //           ]
//                             //       ),
//                             //     ),
//                             //     SizedBox(
//                             //       width: 30,
//                             //     ),
//                             //   ],
//                             // );
//                             return ListViewCustom(
//                               index: index,
//                             );
//                           },
//                         ),
//                       );
//                     });
//               },
//             ),
//             // FutureBuilder(
//             //        future: FeaturedProducts,
//             //        builder: (context, snapShot) {
//             //          print(
//             //              "Future Rebuildinggggg----------------------------------------------------------");
//             //          if (providerInstance.FeaturedFood.isEmpty) {
//             //            return Text("Loading");
//             //          }
//             //          print(providerInstance.FeaturedFood[0].name);
//             //          //print(snapShot.data[0].name);
//             //          return Consumer<MainScreenProvider>(
//             //            builder: (BuildContext context,
//             //                MainScreenProvider instanceV, Widget child) {
//             //              print("Rebuidling the conuemer future-------------------------------------");
//             //              return
//             //                Container(
//             //                  height: 200,
//             //                  child: ListView.builder(
//             //                    scrollDirection: Axis.horizontal,
//             //                    itemCount: 3,
//             //                    itemBuilder: (BuildContext context, index) {
//             //                      return Row(
//             //                        children: [
//             //                          Container(
//             //                            width: size.width - 80,
//             //                            height: size.height / 3,
//             //                            decoration: BoxDecoration(
//             //                              image: DecorationImage(
//             //                                  image:
//             //                                  AssetImage(
//             //                                      "assets/images/new/bgmain2.jpg"),
//             //                                  fit: BoxFit.cover),
//             //                              borderRadius: BorderRadius.circular(20),
//             //                            ),
//             //                            child: Stack(
//             //
//             //                                children: [
//             //                                  Container(
//             //                                    decoration: BoxDecoration(
//             //                                        borderRadius: BorderRadius
//             //                                            .circular(20),
//             //                                        gradient: LinearGradient(
//             //                                          colors: [
//             //                                            Colors.black.withOpacity(
//             //                                                0.6),
//             //                                            Colors.white.withOpacity(
//             //                                                0.1)
//             //                                          ],
//             //                                          begin: Alignment.bottomLeft,
//             //                                          end: Alignment.bottomRight,
//             //                                        )),
//             //                                  ),
//             //
//             //                                  Padding(
//             //                                    padding: EdgeInsets.only(
//             //                                        left: 20, right: 20, top: 20),
//             //                                    child: Column(
//             //                                      crossAxisAlignment: CrossAxisAlignment
//             //                                          .start,
//             //                                      children: [
//             //                                        Row(
//             //                                          mainAxisAlignment: MainAxisAlignment
//             //                                              .spaceBetween,
//             //                                          children: [
//             //                                            Container(
//             //                                              width: 70,
//             //                                              height: 30,
//             //                                              decoration: BoxDecoration(
//             //                                                borderRadius: BorderRadius
//             //                                                    .circular(20),
//             //                                                color: Colors.white,
//             //                                              ),
//             //                                              child: Center(
//             //                                                child: Text(
//             //                                                  snapShot.data[index]
//             //                                                      .price
//             //                                                  ,
//             //                                                  style: TextStyle(
//             //                                                      fontSize: 20,
//             //                                                      color: Colors
//             //                                                          .black,
//             //                                                      fontFamily: 'Montserrat',
//             //                                                      fontWeight: FontWeight
//             //                                                          .bold),
//             //                                                ),
//             //                                              ),
//             //                                            ),
//             //                                            Icon(FontAwesomeIcons
//             //                                                .solidHeart,
//             //                                              color: Colors.white,)
//             //                                          ],
//             //                                        ),
//             //                                        SizedBox(
//             //                                          height: size.height / 4 /
//             //                                              7,),
//             //                                        Text(snapShot.data[index].name,
//             //                                          style: TextStyle(
//             //                                            color: Colors.white,
//             //                                            fontWeight: FontWeight
//             //                                                .bold,
//             //                                            fontSize: 25,
//             //                                            fontFamily: 'Montserrat',
//             //                                          ),),
//             //                                        Text("Cripsy Roll",
//             //                                          style: TextStyle(
//             //                                            color: Colors.white,
//             //                                            fontFamily: 'Montserrat',
//             //                                            fontWeight: FontWeight
//             //                                                .w600,
//             //                                          ),),
//             //                                        Container(
//             //                                          width: 60,
//             //                                          height: 30,
//             //                                          child: Row(
//             //                                            children: [
//             //                                              Text("4.5",
//             //                                                style: TextStyle(
//             //                                                    color: Colors
//             //                                                        .white,
//             //                                                    fontWeight: FontWeight
//             //                                                        .bold),),
//             //                                              Icon(
//             //                                                FontAwesomeIcons.star,
//             //                                                color: Colors.yellow,
//             //                                                size: 20,),
//             //                                            ],
//             //                                          ),
//             //                                        )
//             //                                      ],
//             //                                    ),
//             //                                  ),
//             //                                ]
//             //                            ),
//             //                          ),
//             //                          SizedBox(
//             //                            width: 30,
//             //                          ),
//             //                        ],
//             //                      );
//             //                    },
//             //                  ),
//             //                );
//             //            },
//             //          );
//             //        }
//             //      ),
//
//             // Container(
//             //   //color: Colors.blue,
//             //   height: 220,
//             //   //width: 100,
//             //   // This listview will be built using the data from the firebase
//             //   child: Container(
//             //     child: ListView.builder(
//             //       scrollDirection: Axis.horizontal,
//             //       itemCount: 3,
//             //       itemBuilder: (BuildContext context, index) {
//             //         return Row(
//             //           children: [
//             //             Container(
//             //               width: size.width - 80,
//             //               height: size.height/3,
//             //               decoration: BoxDecoration(
//             //                 image: DecorationImage(
//             //                     image:
//             //                         AssetImage("assets/images/new/bgmain2.jpg"),
//             //                     fit: BoxFit.cover),
//             //                 borderRadius: BorderRadius.circular(20),
//             //               ),
//             //               child: Stack(
//             //
//             //                 children:[
//             //                   Container(
//             //                     decoration: BoxDecoration(
//             //                         borderRadius: BorderRadius.circular(20),
//             //                         gradient: LinearGradient(
//             //                           colors: [
//             //                             Colors.black.withOpacity(0.6),
//             //                             Colors.white.withOpacity(0.1)
//             //                           ],
//             //                           begin: Alignment.bottomLeft,
//             //                           end: Alignment.bottomRight,
//             //                         )),
//             //                   ),
//             //
//             //                   Padding(
//             //                   padding: EdgeInsets.only(left: 20,right: 20, top: 20),
//             //                   child: Column(
//             //                     crossAxisAlignment: CrossAxisAlignment.start,
//             //                     children: [
//             //                       Row(
//             //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                         children: [
//             //                           Container(
//             //                             width: 70,
//             //                             height: 30,
//             //                             decoration: BoxDecoration(
//             //                               borderRadius: BorderRadius.circular(20),
//             //                               color: Colors.white,
//             //                             ),
//             //                             child: Center(
//             //                               child: Text(
//             //                                 "Rs 99",
//             //                                 style: TextStyle(
//             //                                     fontSize: 20,
//             //                                     color: Colors.black,
//             //                                     fontFamily: 'Montserrat',
//             //                                     fontWeight: FontWeight.bold),
//             //                               ),
//             //                             ),
//             //                           ),
//             //                           Icon(FontAwesomeIcons.solidHeart, color: Colors.white,)
//             //                         ],
//             //                       ),
//             //                       SizedBox(height:size.height/4/7,),
//             //                       Text("Chicken Roll", style: TextStyle(
//             //                         color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25,
//             //                         fontFamily: 'Montserrat',
//             //                       ),),
//             //                       Text("Cripsy Roll", style: TextStyle(
//             //                         color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.w600,
//             //                       ),),
//             //                       Container(
//             //                         width: 60,
//             //                         height: 30,
//             //                         child: Row(
//             //                           children: [
//             //                             Text("4.5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//             //                             Icon(FontAwesomeIcons.star, color:Colors.yellow, size: 20,),
//             //                           ],
//             //                         ),
//             //                       )
//             //                     ],
//             //                   ),
//             //                 ),
//             //               ]
//             //               ),
//             //             ),
//             //             SizedBox(
//             //               width: 30,
//             //             ),
//             //           ],
//             //         );
//             //       },
//             //     ),
//             //   ),
//             // ),
//             SizedBox(
//               height: 20,
//             ),
//
//             Consumer<MainScreenProvider>(
//               builder: (BuildContext context, MainScreenProvider instanceV,
//                   Widget child) {
//                 return Container(
//                   height: 50,
//                   child: FutureBuilder(
//                     future: categoryFuture,
//                     builder: (context, snapshot) {
//                       if (instanceV.categoryList.isEmpty) {
//                         return Text("waiting");
//                       }
//                       switch (snapshot.connectionState) {
//                         case ConnectionState.none:
//                           return Text("None State");
//                         case ConnectionState.active:
//                           return Text("active");
//                         case ConnectionState.waiting:
//                           return Text("waiting for data");
//                         case ConnectionState.done:
//                           return ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: instanceV.categoryList.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Text(
//                                       snapshot.data[index].name,
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 25,
//                                           fontFamily: 'Montserrat'),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         default:
//                           return Text("some error occured");
//                       }
//                     },
//                   ),
//                 );
//               },
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
