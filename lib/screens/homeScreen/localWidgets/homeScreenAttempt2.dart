import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_wala_final_pka/models/categoriesModels.dart';
import 'package:final_wala_final_pka/models/data.dart';
import 'package:final_wala_final_pka/models/foodCategory.dart';
import 'package:final_wala_final_pka/models/foodSpecificCategory.dart';
import 'package:final_wala_final_pka/models/menuCategoriesClass.dart';
import 'package:final_wala_final_pka/provider/changeColor.dart';
import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/loadingAnimationCategories.dart';
import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/openCloseDrawer.dart';
//import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/pizzaContainer.dart';
import 'package:final_wala_final_pka/utils/configuration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shimmer/shimmer.dart';
import 'MenuSpecificBuilder.dart';
import 'categoriesBuilder.dart';

String name = "Pizza";

final List<MenuCategories> menuCategories =
    []; // this list will contain instances of the category class

final List<FoodSpecificCategory> foodCategory =
    []; // this list will contain all the data about the on tap food;

class HomeScreenAttempt2 extends StatefulWidget {
  //final List<Categories> categoriesLocal;
  final List<CustomCategory> foodCategoryTypeLocal;

  const HomeScreenAttempt2(
      {@required
          this.foodCategoryTypeLocal}); // this list now contains all the data in the data.dart file
  @override
  _HomeScreenAttempt2State createState() => _HomeScreenAttempt2State();
}

class _HomeScreenAttempt2State extends State<HomeScreenAttempt2> {
  Future categoryWidgetFuture;
  Future specificCategoryFuture;
  final _firestoreInstance = FirebaseFirestore.instance;

  //Future<List<MenuCategories>>
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  OpenCloseDrawer instanceV = OpenCloseDrawer();

  //bool isDrawerOpen = false; // by default this will be false

  int _selectedIndex = 0;

  // Old code when We Implemented the color change using the setState();
  // void _colorCanhange(int index){
  //   setState(() {
  //
  //     specificCategoryFuture =  _getSpecificCategoryList(name);
  //     _selectedIndex = index;
  //   });
  // }
  //Future<List<MenuCategories>> _getCate

  Future<List<FoodSpecificCategory>> _getSpecificCategoryList(name) async {
    foodCategory.clear();
    await _firestoreInstance
        .collection('menu')
        .doc(name)
        .get()
        .then((snapshot) {
      snapshot.data().forEach((key, value) {
        foodCategory.add(
          FoodSpecificCategory(
            id: key.toString(),
            originalPrice: value['Originalprice'],
            name: value['name'],
            price: value['price'],
            imageLocationC: value['url'],
            wishlist: value['wishlist'],
          ),
        );
        debugPrint("Above the anme --------------------------------------");
        print(value['name']);
      });
      print(foodCategory);
      return foodCategory;
    });
    return foodCategory;
  }

  // Just remove the future thing from here and call this function in the init state with the future variable
  _getCategories() async {
    //get document is changed to .get() and the documents is changed to docs()
    // await _firestoreInstance.collection("menu").get().then((snapshot){
    //   snapshot.docs.forEach((element){
    //     debugPrint(element.data().toString());
    //     //print(element.data());
    //   });
    // });
    // print(document.get());
    //print("Below the initn");

    // await _firestoreInstance.collection("menu").where("id", isEqualTo: "Category").get()
    // .then((value){
    //   value.docs.forEach((element) {
    //     print(element.data());
    //   });
    // });
    // this will help us load all the categories directly from firebase
    menuCategories.clear();
    // directly add the return statement over here
    return await _firestoreInstance
        .collection("menu")
        .doc("category") //  The data would of the type future i believe
        .get()
        .then((snapShot) {
      snapShot.data().forEach((key, value) {
        menuCategories.add(
          MenuCategories(
            name: key.toString(),
            imgLocation: value['url'],
          ),
        );
        //print("In the loop");
        //print("success");
        print(key);
        //print(value['img']);
      });
      //return menuCategories;
    });
    return menuCategories;
  }

  @override
  void initState() {
    bool isDrawerOpen = instanceV.isDrawerOpen;
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration(seconds: 3)).then((value) =>categoryWidgetFuture = _getCategories());
    // categoryWidgetFuture = _getCategories(); // this will contain all the info from the database
    print(menuCategories);
    categoryWidgetFuture = _getCategories(); // this is also the same thing here
    specificCategoryFuture = _getSpecificCategoryList(name);
  }

  @override
  Widget build(BuildContext context) {
    bool isDrawerOpen = instanceV.isDrawerOpen;
    print(
        "===========================================================================Building again");
    ChangeColor instanceOfProvider = Provider.of<ChangeColor>(context, listen: false);
    //print(categoriesWidgets);
    //final Categories firstCategory = widget.categoriesLocal.first;
    //final CustomCategory firstFoodCategory = widget.foodCategoryTypeLocal.first;

    //print(firstCategory.name);
    //print(menuCategories);
    //print(menuCategories[0]);
    print("Abbg9===================================");

    Size size = MediaQuery.of(context).size;
    double availableWidth = size.width - 40;
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(instanceV.isDrawerOpen ? 25 : 0),
        color: Colors.grey[200],
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),

      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Align(
                      child: InkWell(
                          onTap: () {
                            print("Open the ");
                            setState(() {
                              xOffset = 290;
                              yOffset = 80;
                              scaleFactor = 0.8;
                              instanceV.change(); // changing the value of the isDrawerOpen thing
                              //isDrawerOpen = true;
                            });
                          },
                          //padding: EdgeInsets.all(0),
                          child: isDrawerOpen
                              ? InkWell(
                                  onTap: () {
                                    print("The drawer is to be closed");
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      scaleFactor = 1;
                                      instanceV.change();
                                      //isDrawerOpen = false;
                                    });
                                  },
                                  child: Icon(Icons.arrow_back_ios),
                                )
                              : Icon(Icons.menu)),
                    ),
                  ],
                ),
                Container(
                  //padding: EdgeInsets.only(top: 30),
                  //margin: EdgeInsets.only(right: 15),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xFFF2BC57),
                          style: BorderStyle.solid,
                          width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Gopal's",
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                  )),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Container(
                //padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Good Evening \$name",
                      style: TextStyle(fontSize: 25, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Grab Your",
                      style: TextStyle(fontSize: 25, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "delicious meal!!",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // third child of the column is a row containing the search bar and the filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: availableWidth / 1.45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          style: BorderStyle.solid,
                          width: 2),
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    width: 200,
                    child: TextField(
                      inputFormatters: [
                        //FilteringTextInputFormatter.digitsOnly
                      ],
                      //keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          fillColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          hintText: 'Meals, desert, burgers',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // this is the default border applied the text field
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Colors.black)),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: availableWidth / 4.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          style: BorderStyle.solid,
                          width: 3),
                      borderRadius: BorderRadius.circular(25)),
                  child: IconButton(
                    icon: Icon(Icons.settings_input_component),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Categories",
                  style: textStyleCustom,
                ),
                Text(
                  "...",
                  style: textStyleCustom,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            FutureBuilder(
                //duration:
                //stream: null,
                future: categoryWidgetFuture,
                // this is the function that does all the wonders
                builder: (context, snapshot) {
                  if(menuCategories.isEmpty){
                    return ShimmerForCategories();
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("Loading");
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return ShimmerForCategories();

                    case ConnectionState.done:
                      print("The connection is done");

                      // when the data is loaded from firebase the below code runs building a list of categories
                      return Consumer<ChangeColor>(  // all the consumers will be rebuilt upon call to provider class
                        builder: (BuildContext context, ChangeColor instanceV,
                            Widget child) {
                          return Container(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: menuCategories.length, // list length
                              itemBuilder: (context, index) {
                                print("Rebuilding==========================================================");
                                return GestureDetector(
                                  onTap: () {
                                    name = menuCategories[index].name;
                                    specificCategoryFuture =
                                        _getSpecificCategoryList(name);
                                    _selectedIndex =
                                        instanceV.changeColor(
                                            index: index,
                                            selectedIndex: _selectedIndex);
                                    //_colorCanhange(index);

                                    //print(snapshot.data[index].name);

                                    //print(menuCategories[index].name);
                                    //_getSpecificCategoryList(menuCategories[index].name);
                                  },
                                  child: CategoriesBuilder(
                                    selectedIndex: _selectedIndex,
                                    index: index,name: menuCategories[index].name,
                                    imageLocation: menuCategories[index].imgLocation,
                                  )
                                );
                              },
                            ),
                          );
                        },
                      );
                    default:
                      return Text("Something Went Wrong");
                  }
                }),
            SizedBox(
              height: 20,
            ),

            // Sixth child of the column containing the text Most polular and ...
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular",
                  style: textStyleCustom,
                ),
                Text(
                  "...",
                  style: textStyleCustom,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // ignore: missing_required_param
            Consumer<ChangeColor>(
              builder:
                  (BuildContext context, ChangeColor instanceV2, Widget child) {
                return FutureBuilder(
                  future: specificCategoryFuture,
                  builder: (context, snapshot) {
                    if (foodCategory.isEmpty) {
                      return Container(child: Text('Loading data plz wait'));
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text("None state");
                      case ConnectionState.active:
                        return Text("active");
                      case ConnectionState.waiting:
                        return Text("Loading");
                      case ConnectionState.done:
                        //return Text(foodCategory[3].name);

                        return ListView.builder(
                            //scrollDirection:
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: foodCategory.length,
                            itemBuilder: (context, index) {
                              print(foodCategory.length);
                              return Container(
                                color: Colors.grey[200],
                                //padding: EdgeInsets.all(15),
                                padding :EdgeInsets.only(left: 10, bottom: 15, top:10,right: 10),
                                child: MenuSpecificBuilder(
                                  name: foodCategory[index].name,
                                  price: foodCategory[index].price,
                                  originalPrice:
                                      foodCategory[index].originalPrice,
                                  imageLocation:
                                      foodCategory[index].imageLocationC,
                                ),
                              );
                            });
                      default:
                        return Text("Some error Occured retry again");
                    }
                  },
                );
              },
            )

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Builder(
            //       builder: (BuildContext context){
            //         int i = 0;
            //         List<Widget> list = new List<Widget>();
            //         for(int i=0;i<pizzaCategories.length;i++){
            //           list.add(Container(
            //             child: MenuSpecificBuilder(
            //               name:
            //             ),
            //           ),);
            //         }
            //
            //
            //         // this is returning all the widgets as a list
            //         return Column(
            //           children: list.map((item) => new Container(child: item,)).toList()
            //           );
            //       },
            //     ),
            //     // PizzaContainer(0),
            //     // PizzaContainer(1),
            //     // PizzaContainer(2),
            //     // PizzaContainer(3),
            //     // PizzaContainer(4),
            //     // PizzaContainer(5),
            //     // PizzaContainer(6),
            //
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
