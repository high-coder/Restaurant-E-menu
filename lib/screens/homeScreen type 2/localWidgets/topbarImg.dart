import 'package:final_wala_final_pka/screens/cartScreen/cart.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/drawerOpenCloseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TopBarImg implements SliverPersistentHeaderDelegate {
  TopBarImg({
    this.minExtent,
    @required this.maxExtent,
  });

  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    DrawerOpenCloseProvider instance = Provider.of<DrawerOpenCloseProvider>(context, listen: false);
    Size _size = MediaQuery.of(context).size;
    print(_size.width);
    return Stack(
      children: [
        // The invisible container for total height of the stack
        Container(
          height: 400,
        ),
        Container(
          //width: double.infinity,
          height: _size.height/4,

          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(10),
              bottomLeft: Radius.circular(10),

            ),
            child: Image(
              image: AssetImage("assets/images/new/bgmain2.jpg",),
              //height: _size.height/3,
              //repeat: ImageRepeat.repeat,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<DrawerOpenCloseProvider>(
                builder: (context,_,__)
                {
                  return Container(
                    child: instance.isDrawerOpen? IconButton(
                      icon: Icon(FontAwesomeIcons.cross, color: Colors.white,),
                      onPressed: () {
                        instance.close();
                      },
                    )
                        : IconButton(
                      icon: Icon(Icons.restaurant_menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        instance.open();
                      },
                    ),
                  );
                },
              ),
              Container(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white
                    ),
                    hintText: "Restaurant Profile",
                    fillColor: Colors.white
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                //margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>CartScreen()
                      )
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.shoppingBasket,
                    color: Colors.red,
                    size: 15,
              ),
                )),
            ],
          ),
        ),

        Positioned(
          top:80,
          bottom: 1,
          left: 20,
          right: 20,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              //color: Colors.white,
              height: 200,
              width: _size.width-40,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          minRadius: 20,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Magic Kitchen", style: TextStyle(
                              fontSize: 25,fontWeight: FontWeight.bold,
                            ),),
                            Row(
                              children: [
                                Icon(Icons.my_location, color: Colors.red,),
                                SizedBox(width: 10,),
                                Text("4120 lella bhawan patiala")
                              ],
                            )
                          ],
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                    //Spacer(flex: 1,),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 25,
                          color: Colors.grey.withOpacity(0.5),
                          child: Center(child: Text("Fast")),
                        ),
                        Spacer(flex:1),
                        Container(
                          width: 50,
                          height: 25,
                          color: Colors.grey.withOpacity(0.5),
                          child: Center(child: Text("Burger, pizza", style: TextStyle(
                          ),overflow: TextOverflow.ellipsis,)),
                        ),
                        Spacer(flex:1),
                        Container(
                          width: 50,
                          height: 25,
                          color: Colors.grey.withOpacity(0.5),
                          child: Center(child: Text("Meal")),
                        ),
                      Spacer(flex: 3,)
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Icon(FontAwesomeIcons.biking, color: Colors.red,),
                        SizedBox(width: 15,),
                        Text("Free Delivery"),
                        Spacer(flex: 1,),

                        Icon(FontAwesomeIcons.stopwatch, color: Colors.red,),
                        Text("20-30 min"),
                        Spacer(flex: 3,),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
