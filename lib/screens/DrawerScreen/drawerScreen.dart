import 'package:final_wala_final_pka/abhi_files/update_my_file.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/drawerOpenCloseProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/openCloseDrawer.dart';
import 'package:final_wala_final_pka/screens/loginScreen/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DrawerScreentype2 extends StatefulWidget {
  @override
  _DrawerScreentype2State createState() => _DrawerScreentype2State();
}

class _DrawerScreentype2State extends State<DrawerScreentype2> {
  OpenCloseDrawer instance = OpenCloseDrawer();

  @override
  Widget build(BuildContext context) {
    DrawerOpenCloseProvider instanceDrawer =
        Provider.of<DrawerOpenCloseProvider>(context, listen: false);
    //print("Inside the widget build odf the menu thing gnkngngngiubdhbfghdbgbd-----------------------------------");
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double availbale_height = height * 0.7;
    double _topGap = height * 0.10;
    // print("=========================================================");
    // print(availbale_height);

    return Scaffold(
      body: Container(
        //color:Colors.red,
        //padding: EdgeInsets.only(left: 10),
        //color: Theme.of(context).accentColor,
        color: Colors.grey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                onTap: () {
                  instanceDrawer.close();
                },
                leading: Icon(Icons.close),
              ),
            ),
            SizedBox(
              height: _topGap - 40,
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
            //   },
            //   leading: Container(
            //     //height: 100,
            //     //width: 500,
            //     child: Lottie.asset("assets/Lottie/logo4.json",height: 300)),
            //   title: Text("Hello,"),
            //   isThreeLine: true,
            //   subtitle: Text("deepak", style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),),
            // ),
            GestureDetector(
              onTap: () {
                print("Kindly Login user");
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Lottie.asset("assets/Lottie/logo4.json"),
                  ),
                  Text("Hello Deepak")
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              leading: Icon(FontAwesomeIcons.home),
              title: Text("Home"),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              leading: Icon(FontAwesomeIcons.cartPlus),
              title: Text("Cart"),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              leading: Icon(FontAwesomeIcons.calendar),
              title: Text("Order History"),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              leading: Icon(FontAwesomeIcons.dochub),
              title: Text("Enter Promo Code"),
            ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.wallet),
            //   title: Text("Wallet"),
            // )
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              leading: Icon(FontAwesomeIcons.star),
              title: Text("Favourite"),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              leading: Icon(FontAwesomeIcons.arrowAltCircleDown),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
