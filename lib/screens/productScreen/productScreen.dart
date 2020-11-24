import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_wala_final_pka/screens/cartScreen/cart.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/featuredfoodModel.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  FeatureFood data;

  ProductScreen(this.data);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;
  bool isFirstTime = true;
  bool _listEmpty = true;
  int localIndex = 0;
  TextStyle _style = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontSize: 15);

  @override
  Widget build(BuildContext context) {
    AddToCartProvider instance =
        Provider.of<AddToCartProvider>(context, listen: false);
    // isFirstTime = instance.basket[localIndex].isFirstTime;
    // quantity = instance.basket[localIndex].quantity;

    // instance.basket.forEach((element) {
    //   if (element.id == widget.data.id) {
    //     localIndex = instance.basket.indexOf(element);
    //     print("the local index is to be printed here");
    //     print(localIndex);
    //   }
    // });

    if (instance.cart.isEmpty) {
      _listEmpty = true;
      localIndex = null;
    } else {
      instance.cart.forEach((element) {
        if (element.id == widget.data.id) {
          _listEmpty = false;
          localIndex = instance.cart.indexOf(element);
        }
      });
    }
    isFirstTime =
        _listEmpty == false ? instance.cart[localIndex].isFirstTime : true;
    quantity = _listEmpty == false ? instance.cart[localIndex].quantity : 0;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    //color:Colors.white,
                    height: size.height / 2.4,
                    width: double.infinity,
                  ),
                  Container(
                    height: size.height / 2.9,
                    width: double.infinity,
                    child: Hero(
                        tag: widget.data.url,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: widget.data.url,
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CartScreen(),
                                ));
                              },
                              icon: Icon(
                                FontAwesomeIcons.shoppingCart,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              child: Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.orange,
                                  ),
                                  child: Consumer<AddToCartProvider>(
                                    builder: (context, _, child) {
                                      return Container(
                                          child: Center(
                                        child: Text(
                                            instance.cart.length.toString()),
                                      ));
                                    },
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 42,
                          width: size.width / 3.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("4.5"),
                              Icon(Icons.star),
                              Text("(+20)"),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            height: 42,
                            width: size.width / 9,
                            //height: 40,
                            // width: 10,
                            child: Icon(FontAwesomeIcons.solidHeart,
                                color: Colors.red))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.data.name,
                        style: TextStyle(
                          fontSize: 25,
                          //fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 2,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 3,
                          width: 50,
                          color: Colors.grey[500],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                          "Jose Garces up this \$40 this is that my name is khan and this is thatn dnbgjkfdbngbfdigbiuderbrguibdfuguifdbg jbfdhjgbj fdbgbjfbgjk dfbgjkdfbgjkdbfgi "),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price", style: _style),
                        Text(
                          "Quantity",
                          style: _style,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data.price.toString(),
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 26),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 90,
                          height: 35,
                          child: Consumer<AddToCartProvider>(
                            builder: (context, _, Widget child) {
                              return ProductAddToCart(data: widget.data);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ProductAddToCart extends StatelessWidget {
  final FeatureFood data;

  //final String id;

  ProductAddToCart({this.data});

  int quantity = 0;
  bool isFirstTime = true;
  bool _listEmpty = true;
  int localIndex;

  @override
  Widget build(BuildContext context) {
    AddToCartProvider instance =
        Provider.of<AddToCartProvider>(context, listen: false);
    // isFirstTime = instance.basket[localIndex].isFirstTime;
    // quantity = instance.basket[localIndex].quantity;

    // instance.basket.forEach((element) {
    //   if (element.id == widget.data.id) {
    //     localIndex = instance.basket.indexOf(element);
    //     print("the local index is to be printed here");
    //     print(localIndex);
    //   }
    // });

    if (instance.cart.isEmpty) {
      _listEmpty = true;
      localIndex = null;
    } else {
      instance.cart.forEach((element) {
        if (element.id == data.id) {
          _listEmpty = false;
          localIndex = instance.cart.indexOf(element);
        }
      });
    }
    isFirstTime =
        _listEmpty == false ? instance.cart[localIndex].isFirstTime : true;
    quantity = _listEmpty == false ? instance.cart[localIndex].quantity : 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black,
          ),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.minus,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () {
                if(quantity == 1) {
                  instance.removeItem(0, data.id);
                }
                else if (quantity != 0) {
                  instance.decrement(data.id);
                } else {
                  return null;
                  //print(":thsis");
                }
              },
            ),
          ),
        ),
        Consumer<AddToCartProvider>(
          builder: (context, _, child) {
            return Container(child: Text(quantity.toString()));
          },
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.orange,
          ),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () {
                if (isFirstTime) {
                  instance.firstTime(data);
                } else {
                  instance.increment(data.id);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
