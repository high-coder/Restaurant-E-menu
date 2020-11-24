import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/openCloseDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  OpenCloseDrawer instance = OpenCloseDrawer();


  @override
  Widget build(BuildContext context) {
    print("Inside the widget build odf the menu thing gnkngngngiubdhbfghdbgbd-----------------------------------");
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double availbale_height = height*0.7;
    double _topGap = height *0.10;
    // print("=========================================================");
    // print(availbale_height);


    return Container(
      color:Colors.red,
      padding: EdgeInsets.only(left: 10),
      //color: Theme.of(context).primaryColor,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top:20),
            child: ListTile(
              onTap: () {
                setState(() {
                  instance.change();
                });
              },
              leading: Icon(Icons.close)
              ,),
          ),
          SizedBox(height: _topGap-40,),
          ListTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text("Hello,"),
            isThreeLine: true,
            subtitle: Text("deepak", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.cartPlus),
            title: Text("Cart"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.calendar),
            title: Text("Order History"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.dochub),
            title: Text("Enter Promo Code"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.wallet),
            title: Text("Wallet"),
          )
          ,ListTile(
            leading: Icon(FontAwesomeIcons.star),
            title: Text("Favourite"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.arrowAltCircleDown),
            title: Text("Logout"),
          )
          ,
        ],
      ),
    );
  }
}
