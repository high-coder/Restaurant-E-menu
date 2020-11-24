import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_wala_final_pka/screens/OrderScreen/OurOrderScreen.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/headerTexts.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/screenDisablingCode.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HeaderTextCustom instanceHeaderClass = HeaderTextCustom();
  TextStyle _textStyle =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300);
  TextStyle _textStyleCart = TextStyle(
    color: Color(0xFFF4e55af),
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    bool _visibilitybool = true;
    Size size = MediaQuery.of(context).size;
    print("==================================Rebuilding the cart screen");
    AddToCartProvider providerInstance =
        Provider.of<AddToCartProvider>(context, listen: false);
    //var cart = context.watch<AddToCartProvider>(); // It rebuilds the whole build method whenever notify listeners are called
    //assign to a variable = the context.select<Name of the provider class, data type of the value>((value) => value.method/property)
    var cartLength =
        context.select<AddToCartProvider, int>((value) => value.cart.length);
    // triggers a rebuild to the entire build method of the parent
    //bool cartNotEmpty = providerInstance.cart.length;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Order Screen",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFF4e55af),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: 30,
              ),

              //print(providerInstance.cart[0].quantity);
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartLength,
                itemBuilder: (context, index) {
                  //print(providerInstance.cart[index].quantity);
                  return Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Dismissible(
                        onDismissed: (DismissDirection direction) {
                          //print("It is dismissed");
                          providerInstance.removeItem(
                              0,
                              providerInstance.cart[index].id);
                        },
                        secondaryBackground: Container(
                          //margin: EdgeInsets.only(left: 10, right: 10),

                          //margin: EdgeInsets.only(top: 14, left: 20, right: 20),
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                //topRight:
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)
                              )),
                          //margin: EdgeInsets.only(top: 20),

                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),

                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.delete),
                                  Text("Delete"),
                                ],
                              ),
                            ),
                            //width: 30,
                            //height: 100,
                          ),
                        ),
                        background: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                          ),
                        )),
                        key: UniqueKey(),
                        child: Container(
                            //padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                            // margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 0,
                                  spreadRadius: 1,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ], borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.height / 8,
                                  width: size.width / 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            providerInstance.cart[index].url,
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  width: size.width / 2,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        providerInstance.cart[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: _textStyle,
                                      ),
                                      Text(
                                        "Rs ${providerInstance.cart[index].price}",
                                        overflow: TextOverflow.ellipsis,
                                        style: _textStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  width: 40,
                                  //width: size.width/8,
                                  //width: size.width/6,
                                  height: 100,
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.end,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if(providerInstance.cart[index].quantity==1){
                                            providerInstance.removeItem(0, providerInstance.cart[index].id);
                                          }
                                          else{
                                            providerInstance.decrement(
                                                providerInstance.cart[index].id);
                                          }

                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFa1dbf5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Quantity(index),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          providerInstance.increment(
                                              providerInstance.cart[index].id);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFa1dbf5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              FontAwesomeIcons.plus,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(
                                        flex: 4,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))
                        // child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   //mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       height: size.height/6,
                        //       child: ListTile(
                        //         leading: ClipRRect(
                        //           child: CachedNetworkImage(
                        //             imageUrl: providerInstance.cart[index].url,
                        //           ),
                        //         ),
                        //         title: Row(
                        //           children: [
                        //             Container(
                        //               width: size.width /2,
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 //mainAxisAlignment: MainAxisAlignment.start,
                        //                 children: [
                        //                   Text(providerInstance.cart[index].name, overflow:TextOverflow.ellipsis,),
                        //                   Text(providerInstance.cart[index].price.toString()),
                        //                 ],
                        //
                        //               ),
                        //             ),
                        //
                        //
                        //           ],
                        //         ),
                        //         trailing: Column(
                        //           children: [
                        //             GestureDetector(
                        //               onTap: () {
                        //                 providerInstance.decrement(
                        //                     providerInstance
                        //                         .cart[index].index,
                        //                     providerInstance.cart[index].id);
                        //               },
                        //               child: Container(
                        //                 height: 30,
                        //                 width: 30,
                        //                 decoration: BoxDecoration(
                        //                   color: Colors.orange,
                        //                   borderRadius:
                        //                   BorderRadius.circular(20),
                        //                 ),
                        //                 child: Center(
                        //                   child: Icon(
                        //                     FontAwesomeIcons.minus,
                        //                     color: Colors.white,
                        //                     size: 20,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Spacer(
                        //               flex: 1,
                        //             ),
                        //             Quantity(index),
                        //             Spacer(
                        //               flex: 1,
                        //             ),
                        //             GestureDetector(
                        //               onTap: () {
                        //                 providerInstance.increment(
                        //                     providerInstance
                        //                         .cart[index].index,
                        //                     providerInstance.cart[index].id);
                        //               },
                        //               child: Container(
                        //                 height: 30,
                        //                 width: 30,
                        //                 decoration: BoxDecoration(
                        //                   color: Colors.orange,
                        //                   borderRadius:
                        //                   BorderRadius.circular(20),
                        //                 ),
                        //                 child: Center(
                        //                   child: Icon(
                        //                     FontAwesomeIcons.plus,
                        //                     color: Colors.white,
                        //                     size: 20,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Spacer(
                        //               flex: 4,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: 20,),
                        //   ],
                        // ),
                        // child: Container(
                        //   color: Colors.transparent,
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         width:380,
                        //         height: 100,
                        //         color: Colors.red,
                        //         child: Row(),
                        //       ),
                        //       ClipRRect(
                        //         clipBehavior: Clip.hardEdge,
                        //         borderRadius: BorderRadius.only(
                        //           bottomRight: Radius.circular(20),
                        //       ),
                        //         child: Container(
                        //           height:100,
                        //           width:30,
                        //           decoration: BoxDecoration(
                        //             color: Colors.orange,
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(40.0),
                        //   child: Container(
                        //     height: 100,
                        //     width: 410,
                        //     color: Colors.black,
                        //     child: Container(
                        //       height: 100.0,
                        //       width: 390,
                        //       color: Colors.blue,
                        //       child: Center(
                        //         child: new Text("Hi modal sheet"),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.only(
                        //     bottomRight: Radius.circular(20),
                        //   ),
                        //   child: Container(
                        //     //padding: EdgeInsets.only(left: 10,right: 10),
                        //
                        //     margin: EdgeInsets.only(top: 14),
                        //     decoration: BoxDecoration(
                        //       color: Colors.orange,
                        //       // borderRadius: BorderRadius.only(
                        //       //   //topLeft: Radius.circular(20),
                        //       //   //topRight:
                        //       //   //bottomLeft: Radius.circular(20),
                        //       //   //bottomRight: Radius.circular(20),
                        //       // )
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         //Text("this si tha tht aht tohtoiheifghghshfgihs"),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //               color: Colors.green,
                        //               borderRadius: BorderRadius.only(
                        //                 topLeft: Radius.circular(20),
                        //                 //topRight:
                        //                 bottomLeft: Radius.circular(20),
                        //                 bottomRight: Radius.circular(20),
                        //               )),
                        //           height: 100,
                        //           width: 380,
                        //           child: Row(
                        //             children: [
                        //               Container(
                        //                 width: 100,
                        //                 height: 100,
                        //                 decoration: BoxDecoration(
                        //                   borderRadius:
                        //                   BorderRadius.circular(20),
                        //                   color: Colors.green,
                        //                 ),
                        //                 child: CircleAvatar(
                        //                   child: CachedNetworkImage(
                        //                     imageUrl: providerInstance
                        //                         .cart[index].url,
                        //                     fit: BoxFit.contain,
                        //                   ),
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 20,
                        //               ),
                        //               Column(
                        //                 mainAxisAlignment:
                        //                 MainAxisAlignment.center,
                        //                 crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //                 children: [
                        //                   Container(
                        //                     width: 120,
                        //                     child: Text(
                        //                       providerInstance.cart[index].name,
                        //                       style: _textStyle,
                        //                       overflow: TextOverflow.ellipsis,
                        //                     ),
                        //                   ),
                        //                   Text(
                        //                     providerInstance.cart[index].price.toString(),
                        //                     style: _textStyle,
                        //                   ),
                        //                 ],
                        //               ),
                        //               Spacer(
                        //                 flex: 1,
                        //               ),
                        //               GestureDetector(
                        //                 onTap: () {
                        //                   providerInstance.decrement(
                        //                       providerInstance
                        //                           .cart[index].index,
                        //                       providerInstance.cart[index].id);
                        //                 },
                        //                 child: Container(
                        //                   height: 30,
                        //                   width: 30,
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.orange,
                        //                     borderRadius:
                        //                     BorderRadius.circular(20),
                        //                   ),
                        //                   child: Center(
                        //                     child: Icon(
                        //                       FontAwesomeIcons.minus,
                        //                       color: Colors.white,
                        //                       size: 20,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Spacer(
                        //                 flex: 1,
                        //               ),
                        //               Quantity(index),
                        //               Spacer(
                        //                 flex: 1,
                        //               ),
                        //               GestureDetector(
                        //                 onTap: () {
                        //                   providerInstance.increment(
                        //                       providerInstance
                        //                           .cart[index].index,
                        //                       providerInstance.cart[index].id);
                        //                 },
                        //                 child: Container(
                        //                   height: 30,
                        //                   width: 30,
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.orange,
                        //                     borderRadius:
                        //                     BorderRadius.circular(20),
                        //                   ),
                        //                   child: Center(
                        //                     child: Icon(
                        //                       FontAwesomeIcons.plus,
                        //                       color: Colors.white,
                        //                       size: 20,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Spacer(
                        //                 flex: 4,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //               color: Colors.orange,
                        //               borderRadius: BorderRadius.only(
                        //                 bottomRight: Radius.circular(20),
                        //                 //top
                        //               )),
                        //           width: 30,
                        //           height: 100,
                        //           child: Icon(FontAwesomeIcons.skullCrossbones),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),

              DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.2,
                maxChildSize: 0.7,
                builder: (context, scrollController) {
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      instanceHeaderClass.makeHeader("Total Amount "),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(20),
                          ),
                          height: size.height * 0.6,
                          width: 200,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              //
                              //Text("Total Amount", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cart Total",
                                    style: _textStyleCart,
                                  ),
                                  Consumer<AddToCartProvider>(
                                    builder: (context, _, Widget child) {
                                      return Text(
                                          "₹ ${providerInstance.orderTotalValue}");
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                height: 1,
                                color: Color(0xFFFbcbdca).withOpacity(0.4),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tax",
                                    style: _textStyleCart,
                                  ),
                                  Consumer<AddToCartProvider>(
                                    builder: (context, _, Widget child) {
                                      return Text("₹ ${providerInstance.tax}");
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                height: 1,
                                color: Color(0xFFFbcbdca).withOpacity(0.4),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Items",
                                    style: _textStyleCart,
                                  ),
                                  Consumer<AddToCartProvider>(
                                    builder: (context, _, Widget child) {
                                      return Text(
                                          "${providerInstance.cart.length}");
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                height: 1,
                                color: Color(0xFFFbcbdca).withOpacity(0.4),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: _textStyleCart,
                                  ),

                              // Subtotal
                              Consumer<AddToCartProvider>(
                                builder: (context, _, Widget child) {
                                  return Text(
                                      "₹ ${providerInstance.tax + providerInstance.orderTotalValue}");
                                },
                              ),

                                ],
                              ),
                              Container(
                                height: 1,
                                color: Color(0xFFFbcbdca).withOpacity(0.4),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFFf5eff9),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Payment",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Currently only cash option is available"),
                                              ));
                                            },
                                            child: Icon(
                                              FontAwesomeIcons.pen,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: Lottie.asset(
                                            "assets/Lottie/payment.json",
                                            reverse: true,
                                            delegates: LottieDelegates(
                                              text: (initialText) => "this is that",
                                            )
                                          ),
                                        ),

                                        //Icon(FontAwesomeIcons.moneyBill),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("Pay on Order Received"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              providerInstance.cart.length != 0
                                  ? Consumer<AddToCartProvider>(
                                      builder: (context, _, Widget child) {
                                        return Visibility(
                                          visible: _visibilitybool,
                                          child: child,
                                        );
                                      },
                                      child: ConfirmationSlider(
                                        foregroundColor: Color(0xFFF4e55af),
                                        iconColor: Colors.white,
                                        backgroundColorEnd: Colors.greenAccent,
                                        height: 80,
                                        width: 300,
                                        text: "Slide to Place order",
                                        //icon: Icon(FontAwesomeIcons.),
                                        backgroundColor: Colors.white,
                                        onConfirmation: () async {
                                          _visibilitybool =
                                              false; // change the visibily of the
                                          //print("This is that");
                                          String _retVal =
                                              await providerInstance
                                                  .placeOrder();

                                          if (_retVal == "success") {
                                            //print("this is called now");
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text("Order is placed"),
                                            ));
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OurOrderScreen()));
                                          } else {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content:
                                                  Text("Something went wrong"),
                                            ));
                                          }
                                        },
                                      ),
                                    )
                                  : Container(
                                      child: Text(
                                          "There is nothing here add items in the cart"),
                                    ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ScreenDisableCode(),
            ],
          ),
        ));
  }
}

class Quantity extends StatelessWidget {
  @override
  int index;

  Quantity(this.index);

  Widget build(BuildContext context) {
    //print("This is rebuilding");
    var cart = context.watch<AddToCartProvider>();
    return Consumer<AddToCartProvider>(
      builder: (context, AddToCartProvider instance, Widget child) {
        //print("this is rebuilding");
        return Text(cart.cart[index].quantity.toString());
      },
    );
  }
}
