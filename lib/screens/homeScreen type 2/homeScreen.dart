import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/GridAddToCart.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/addToCartButton.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/FeatureProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/drawerOpenCloseProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/listviewthing.dart';
import 'package:final_wala_final_pka/screens/productScreen/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'localWidgets/headerTexts.dart';
import 'localWidgets/local.dart';
import 'localWidgets/topbarImg.dart';

Future categoryFuture;
Future FeaturedProducts;
Future getCategoryFood;

class HomeScreenType2 extends StatefulWidget {
  @override
  _HomeScreenType2State createState() => _HomeScreenType2State();
}

class _HomeScreenType2State extends State<HomeScreenType2> {
  double x = 0;
  double y = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  getFuturesFood() async {
    //print("Entering the function");

    MainScreenProvider providerInstance =
        Provider.of<MainScreenProvider>(context, listen: false);
    AddToCartProvider addToCart =
        Provider.of<AddToCartProvider>(context, listen: false);
    FeatureProvider providerInstanceFeature =
        Provider.of<FeatureProvider>(context, listen: false);
    print("Above load all data");
    if (providerInstance.isInitFirstTime == true) {
      print("Inside the if statement");
      await providerInstance.loadAllData();
      //addToCart.basket = providerInstance.basket;
      FeaturedProducts =
          providerInstanceFeature.getFeatured(providerInstance.productAll);
    }
    providerInstance.isInitFirstTime = false;
    print("Below load all data");

    // Step 4: Building the future of the category
  }

  Future<Null> refreshApp() async {
    //print("Entering the function");
    setState(() {});
    MainScreenProvider providerInstance =
        Provider.of<MainScreenProvider>(context, listen: false);
    AddToCartProvider addToCart =
        Provider.of<AddToCartProvider>(context, listen: false);
    //addToCart.basket.clear();
    //addToCart.cart.clear();
    providerInstance.productAll.clear();
    providerInstance.categoryList.clear();
    providerInstance.gridViewList.clear();

    FeatureProvider providerInstanceFeature =
        Provider.of<FeatureProvider>(context, listen: false);
    providerInstanceFeature.FeaturedFood.clear();
    print("Above load all data");
    await providerInstance.loadAllData();
    //await addToCart.basket.clear();
    //addToCart.basket = providerInstance.basket;
    FeaturedProducts =
        providerInstanceFeature.getFeatured(providerInstance.productAll);
    //providerInstance.isInitFirstTime = false;
    print("Below load all data");
    // Step 4: Building the future of the category
  }

  Future categoryFuture;
  HeaderTextCustom instanceHeaderClass = HeaderTextCustom();

  @override
  void initState() {
    super.initState();
    getFuturesFood();
  }

  @override
  Widget build(BuildContext context) {
    FeatureProvider providerInstanceFeature =
        Provider.of<FeatureProvider>(context, listen: false);
    MainScreenProvider providerInstance =
        Provider.of<MainScreenProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Consumer<DrawerOpenCloseProvider>(
      builder: (context, DrawerOpenCloseProvider instanceDrawer, Widget child) {
        return AnimatedContainer(
          transform:
              Matrix4.translationValues(instanceDrawer.x, instanceDrawer.y, 0)
                ..scale(instanceDrawer.scaleFactor),
          duration: Duration(milliseconds: 400),
          child: child,
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: RefreshIndicator(
          onRefresh: refreshApp,
          child: SafeArea(
            child: CustomScrollView(slivers: [
              SliverPersistentHeader(
                pinned: false,
                //floating: true,
                delegate: TopBarImg(
                  minExtent: 250,
                  maxExtent: 280,
                ),
              ),
              //Image(image: AssetImage("assets/images/new/bgmain.jpg"),)
              //Text("this is tast"),
              //SampleText(),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  //padding: EdgeInsets.only(left: 20, right: 20),
                  //height: 100,
                  //child: Image(image: AssetImage("assets/images/new/bgmain.jpg"),height: 200,width: 200, fit: BoxFit.fitWidth,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Featured Items",
                            style: TextStyle(
                                fontSize: 25,
                                //fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Column(
                            children: [
                              Consumer<FeatureProvider>(
                                builder: (BuildContext context,
                                    FeatureProvider instanV2, Widget child) {
                                  return Container(
                                    child: FutureBuilder(
                                      future: FeaturedProducts,
                                      builder: (context, snapshot) {
                                        //print("In the future builder for category name");
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.none:
                                            return Text("loading.....");
                                          case ConnectionState.waiting:
                                            return Text("Waiting");
                                          case ConnectionState.done:
                                            return Container(
                                              height: 20,
                                              width: 20,
                                              child: Center(
                                                  child: Text(
                                                providerInstanceFeature
                                                    .FeaturedFood.length
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat'),
                                              )),
                                              decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            );

                                          default:
                                            return Text("Some error occured");
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                              Container(
                                height: 10,
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // this is the code that builds the feature items section of the app
                      Consumer<FeatureProvider>(
                        builder: (BuildContext context,
                            FeatureProvider instanceV, Widget child) {
                          return FutureBuilder(
                              future: FeaturedProducts,
                              builder: (context, snapShot) {
                                if (providerInstanceFeature
                                    .FeaturedFood.isEmpty) {
                                  return Text("Loading");
                                }
                                //print(providerInstance.FeaturedFood[0].name);
                                return Container(
                                  height: 200,
                                  child: ListView.builder(
                                    //cacheExtent: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: providerInstanceFeature
                                        .FeaturedFood.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return ListViewCustom(
                                        index: index,
                                      );
                                    },
                                  ),
                                );
                              });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // This section of the code builds the categories section of the app
                      Consumer<MainScreenProvider>(
                        builder: (BuildContext context,
                            MainScreenProvider instanceV, Widget child) {
                          return Container(
                            height: 50,
                            child: FutureBuilder(
                              future: providerInstance.categoryFuture,
                              builder: (context, snapshot) {
                                if (instanceV.categoryList.isEmpty) {
                                  return Text("waiting");
                                }
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return Text("None State");
                                  case ConnectionState.active:
                                    return Text("active");
                                  case ConnectionState.waiting:
                                    return Text("waiting for data");
                                  case ConnectionState.done:
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: instanceV.categoryList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap:(){
                                                providerInstance.convertCategory(name:snapshot.data[index].name);
                                              },
                                              child: Container(
                                                child: Text(
                                                  snapshot.data[index].name,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 25,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  default:
                                    return Text("some error occurred");
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //instanceHeaderClass.makeHeader("This is that"),
              Consumer<MainScreenProvider>(
                builder: (context, __, Widget child) {
                  return FutureBuilder(
                    future: providerInstance.getCategoryFood,
                    builder: (context, snapshot) {
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.width / 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.80,
                          //crossAxisCount: 2,
                        ),
                        // delegate: SliverChildBuilderDelegate(
                        //       (BuildContext context, int index) {
                        //     return Container(
                        //       height: 500,
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       //height: 400,
                        //       //width: size.width/2.2,
                        //       // child: Column(
                        //       //   crossAxisAlignment: CrossAxisAlignment.start,
                        //       //   mainAxisAlignment: MainAxisAlignment.start,
                        //       //   children: [
                        //       //     Container(
                        //       //       width: 200,
                        //       //       //color: Colors.green,
                        //       //       height: 130,
                        //       //       child: CachedNetworkImage(
                        //       //         imageUrl: providerInstance.gridViewList[index].url,
                        //       //         fit: BoxFit.cover,
                        //       //       ),
                        //       //     ),
                        //       //     Text(providerInstance.gridViewList[index].name, style: TextStyle(
                        //       //       fontSize: 15,  color: Colors.black, fontFamily: 'Montserrat'
                        //       //     ),),
                        //       //     //SizedBox(height: 10,),
                        //       //   ],
                        //       // ),
                        //       child: Stack(
                        //         children: [
                        //           Hero(
                        //             tag: providerInstance.gridViewList[index].name,
                        //             child: Container(
                        //               //height: size.height-50,
                        //               //width: size.width/2.2,
                        //               child: ClipRRect(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 child: CachedNetworkImage(
                        //                   width: size.width/2,
                        //                   height: 130,
                        //                   imageUrl: providerInstance.gridViewList[index].url,
                        //                   fit: BoxFit.fitWidth,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding: EdgeInsets.only(left: 5, right: 5, top:5),
                        //             child: Column(
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               children: [
                        //                 Row(
                        //                   children: [
                        //                     Container(
                        //                       width: 50,
                        //                       height: 25,
                        //                       decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.circular(10),
                        //                           color: Colors.white.withOpacity(0.5)
                        //                       ),
                        //                       child: Center(
                        //                         child: Text(
                        //                           "Rs ${providerInstance.gridViewList[index].price}",
                        //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        //                           overflow: TextOverflow.clip,
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //           Positioned(
                        //             bottom: 30,
                        //             child: Text(providerInstance.gridViewList[index].name,overflow:TextOverflow.ellipsis, style: TextStyle(
                        //                 color: Colors.black, fontSize: 15, fontFamily: 'Montserrat'
                        //             ),),
                        //           )
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   childCount: providerInstance.gridViewList.length,
                        // ),
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          double totalHeight = (size.width / 2) *
                              ((size.height / 3.9) / (size.width / 2));
                          //.double totalHeight = size.width/2-5;
                          print(totalHeight);
                          //print(totalheight);
                          //return Container(height:0,color: Colors.black,);
                          return Card(
                            shape: RoundedRectangleBorder(
                                //side: BorderSide(width: 2, color: Colors.white60),
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 9,
                            //borderOnForeground: true,
                            shadowColor: Colors.black45,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                //color: Colors.black,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: totalHeight,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      //topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Container(
                                      width: size.width/2-5,
                                      height: totalHeight*3.3/4,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) => Lottie.asset("assets/Lottie/loading3.json"),
                                        placeholderFadeInDuration: Duration(milliseconds: 100),
                                        fit: BoxFit.fill,
                                        imageUrl: providerInstance
                                            .gridViewList[index].url,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 2,
                                    //left: 0,
                                    child: Container(
                                      width: size.width/2-5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: 50,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: LikeButton(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //bottom: totalHeight,
                                    top: totalHeight*3.3/4,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      width: size.width/2-5,
                                      child: Text(
                                        providerInstance
                                            .gridViewList[index].name
                                            .toString(),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),

                                  // This here is the call to the add to cart function class
                                  Positioned(
                                    top: totalHeight*2.5/4,
                                    right: 5,
                                    child: Consumer<AddToCartProvider>(
                                        builder: (context, _, __) {
                                      return GridAddToCard(index: index);
                                    }),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 7),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            //topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            //topLeft: Radius.circular(10)
                                          ),
                                          color: Colors.white),
                                      //margin: EdgeInsets.only(top: 2),
                                      width: 60,
                                      height: 25,
                                      child: Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceAround,
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Text(
                                            providerInstance
                                                .gridViewList[index].price
                                                .toString(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: providerInstance.gridViewList.length),
                      );
                    },
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
