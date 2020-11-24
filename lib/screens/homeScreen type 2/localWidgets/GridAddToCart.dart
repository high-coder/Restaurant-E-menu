import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GridAddToCard extends StatelessWidget {

  final int index;
  GridAddToCard({this.index});


  @override
  Widget build(BuildContext context) {

    //final int index;
    //AddToCartButton({this.index});
    int quantity = 1;
    bool isFirstTime = true;
    bool _listEmpty = true;
    // MainScreenProvider providerInstance =
    // Provider.of<MainScreenProvider>(context, listen: false);
    MainScreenProvider providerInstance = Provider.of<MainScreenProvider>(context, listen: false);
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
        if(element.id == providerInstance.gridViewList[index].id){
          _listEmpty = false;
          localIndex = instance.cart.indexOf(element);

        }
      });
    }
    isFirstTime = _listEmpty == false? instance.cart[localIndex].isFirstTime : true;
    quantity = _listEmpty == false ?instance.cart[localIndex].quantity : 0;

    // return Card(
    //   shape: new RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20)
    //   ),
    //   child: isFirstTime ? Container(
    //     width: 40,
    //     height: 40,
    //     child: Center(
    //       child: IconButton(
    //         onPressed: instance.firstTime(providerInstance.gridViewList[index]),
    //         icon: Icon(FontAwesomeIcons.shoppingBasket, color: Colors.red,size: 19,),
    //       ),
    //     ),
    //   ) : Row(
    //     children: [
    //       Container()
    //     ],
    //   ),
    // );
    // return Container(
    //   height: 30,
    //   width: 90,
    //   decoration: BoxDecoration(
    //       color: Colors.white.withOpacity(0.4),
    //       borderRadius: BorderRadius.circular(20),
    //       border: Border.all(width: 3, color: Colors.white)
    //   ),
    //   child: isFirstTime ? InkWell(
    //     onTap: () {
    //       //instance2.getId(providerInstance.productAll[index].id, providerInstance.productAll, index);
    //       instance.firstTime(providerInstance.gridViewList[index]);
    //     },
    //     child: Center(
    //       child: Text("Add +"),
    //     ),
    //   ) : Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       InkWell(onTap: () {
    //         if(quantity == 1) {
    //           instance.removeItem(0, providerInstance.gridViewList[index].id);
    //         }
    //         instance.decrement(providerInstance.gridViewList[index].id);
    //         print("this is that");
    //       },
    //           child: Icon(
    //             FontAwesomeIcons.minus, color: Colors.white, size: 15,)),
    //       Text(quantity.toString(), style: TextStyle(fontSize: 20),),
    //       InkWell(onTap: () {
    //         instance.increment(providerInstance.gridViewList[index].id);
    //         print("Plus");
    //       },
    //           child: Icon(
    //             FontAwesomeIcons.plus, color: Colors.white, size: 15,)),
    //     ],
    //   ),
    // );

    return Card(
      //borderOnForeground: false,
      elevation: 10,
      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 1, color: Colors.grey)),
      child: isFirstTime?GestureDetector(
        onTap: () {
          instance.firstTime(providerInstance.gridViewList[index]);
        },
        child: Container(
          width: 50,
          height: 40,
          child: Icon(Icons.shopping_basket, color: Colors.red,),
        ),
      ) : Container(
        width: 60,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if(quantity == 1) {
                  instance.removeItem(0, providerInstance.gridViewList[index].id);
                }
                instance.decrement(providerInstance.gridViewList[index].id);
              },
              child: Container(
                padding: EdgeInsets.only(top: 10),
                height: 25,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  //color: Colors.red
                ),
                child: Icon(FontAwesomeIcons.minus, color: Colors.pink, size: 13,),
              ),
            ),
            Container(
              height: 25,
              width: 18,

              child: Center(child: Text(quantity.toString())),
            ),
            GestureDetector(
              onTap: () {
                instance.increment(providerInstance.gridViewList[index].id);
              },
              child: Container(
                height: 25,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(FontAwesomeIcons.plus, color: Colors.pink, size: 15,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
