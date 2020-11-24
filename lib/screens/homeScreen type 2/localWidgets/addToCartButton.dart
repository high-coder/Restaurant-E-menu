import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/FeatureProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/rebuildAddToCart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:provider/provider.dart';


class AddToCartButton extends StatelessWidget {
  final int index;
  AddToCartButton({this.index});
  int quantity = 1;
  bool isFirstTime = true;
  bool _listEmpty = true;
  @override
  Widget build(BuildContext context) {
    // MainScreenProvider providerInstance =
    // Provider.of<MainScreenProvider>(context, listen: false);
    FeatureProvider feature = Provider.of<FeatureProvider>(context, listen: false);
    AddToCartProvider instance = Provider.of<AddToCartProvider>(context, listen: false);
    //RebuildAddToCart instance2 = Provider.of<RebuildAddToCart>(context, listen: true);
    int localIndex;
    // instance.basket.forEach((element) {
    //   if(element.id == feature.FeaturedFood[index].id){
    //     localIndex = instance.basket.indexOf(element);
    //     //print("the local index is to be printed here");
    //     //print(localIndex);
    //   }
    // });
    // isFirstTime = instance.basket[localIndex].isFirstTime;
    // quantity = instance.basket[localIndex].quantity;
    if(instance.cart.isEmpty) {
      _listEmpty = true;
      localIndex = null;
    }


    else{
      instance.cart.forEach((element) {
        if(element.id == feature.FeaturedFood[index].id){
          _listEmpty = false;
          localIndex = instance.cart.indexOf(element);

        }
      });
    }
    isFirstTime = _listEmpty == false? instance.cart[localIndex].isFirstTime : true;
    quantity = _listEmpty == false ?instance.cart[localIndex].quantity : 0;
    //feature.FeaturedFood[index].id;
    return Container(
      height: 30,
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 3, color: Colors.white)
      ),
      child: isFirstTime ? InkWell(
        onTap: () {
          //instance2.getId(providerInstance.productAll[index].id, providerInstance.productAll, index);
          instance.firstTime(feature.FeaturedFood[index]);
        },
        child: Center(
          child: Text("Add +"),
        ),
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(onTap: () {
            if(quantity == 1) {
              instance.removeItem(0, feature.FeaturedFood[index].id);
            }
            instance.decrement(feature.FeaturedFood[index].id);
            print("this is that");
          },
              child: Icon(
                FontAwesomeIcons.minus, color: Colors.white, size: 15,)),
          Text(quantity.toString(), style: TextStyle(fontSize: 20),),
          InkWell(onTap: () {
            instance.increment(feature.FeaturedFood[index].id);
            print("Plus");
          },
              child: Icon(
                FontAwesomeIcons.plus, color: Colors.white, size: 15,)),
        ],
      ),
    );
  }
}
