import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/addToCartButton.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/imageContainerCustom.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/FeatureProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/rebuildAddToCart.dart';
import 'package:final_wala_final_pka/screens/productScreen/productScreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


// this returns the build widgets to the listview Builder
class ListViewCustom extends StatefulWidget {
  int index;
  ListViewCustom({this.index});

  @override
  _ListViewCustomState createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<ListViewCustom> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    MainScreenProvider providerInstance =
        Provider.of<MainScreenProvider>(context, listen: false);
    FeatureProvider providerInstanceFeature =
        Provider.of<FeatureProvider>(context, listen: false);
    //AddToCartProvider addToCart = Provider.of<AddToCartProvider>(context, listen:false);
    //addToCart.basket.clear();
    //addToCart.basket = providerInstance.productAll;

    //print("Above add to cart");
    //print(addToCart.basket);
    //print("List View Custom rebuiling");
    //print(widget.index);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        //print("this si thaioth e");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductScreen(providerInstanceFeature.FeaturedFood[widget.index])
        ));
      },
      child: Row(
        children: [
          Container(
            width: size.width - 80,
            height: size.height / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(children: [
              //ImageContainerCustom(url:providerInstance.FeaturedFood[widget.index].url),
              Hero(
                tag:providerInstanceFeature.FeaturedFood[widget.index].url,
                child: Container(
                  width: size.width - 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Lottie.asset("assets/Lottie/loading.json"),
                      //placeholder: Lottie.asset("assets/Lottie/loading.json"),
                      fit: BoxFit.fitWidth,
                      imageUrl:
                          providerInstanceFeature.FeaturedFood[widget.index].url,
                    ),
                  ),
                ),
              ),
              // Container(
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(20)),
              //   width: size.width - 80,
              //   child: FutureProvider(
              //     create: (_) {
              //       return getImage(
              //           providerInstance.FeaturedFood[widget.index].url);
              //     },
              //     child: Consumer<String>(
              //       builder: (_, value, __) {
              //         print(value);
              //         return value != null
              //             ? ClipRRect(
              //                 borderRadius: BorderRadius.circular(20),
              //                 child: Image.network(
              //                   value,
              //                   fit: BoxFit.cover,
              //                 ),
              //               )
              //             : Center(child: CircularProgressIndicator(),);
              //       },
              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.white.withOpacity(0.1)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    )),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              providerInstanceFeature
                                  .FeaturedFood[widget.index].price.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        // Icon(
                        //   FontAwesomeIcons.solidHeart,
                        //   color: Colors.white,
                        // ),
                        LikeButton(),
                      ],
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    Text(
                      providerInstanceFeature.FeaturedFood[widget.index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text(
                      "Burgers",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      // width: size.width-100,
                      height: 30,
                      child: Row(
                        children: [
                          Text(
                            "4.5",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            FontAwesomeIcons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Spacer(
                            flex: 4,
                          ),
                          Consumer<AddToCartProvider>(
                            builder: (context, AddToCartProvider instanceV, Widget child){
                              //print("Inside the consumer of the list view custom");
                              //print(widget.index);
                              //print(addToCart.basket[widget.index].isFirstTime);
                              return AddToCartButton(index: widget.index);
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            width: widget.index == providerInstanceFeature.FeaturedFood.length - 1
                ? 0
                : 20,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
