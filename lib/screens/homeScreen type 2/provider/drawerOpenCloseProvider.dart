import 'package:flutter/cupertino.dart';

class DrawerOpenCloseProvider extends ChangeNotifier{
  bool isDrawerOpen = false;
  double x = 0;
  double y = 0;
  double scaleFactor = 1;


  // Open the drawer Bitch!!!
   open() {
    isDrawerOpen = true;
     x = 230;
     y= 150;
     scaleFactor = 0.7;
     notifyListeners();
  }

  // close the drawer right now bitch!!!
  close() {
     isDrawerOpen = false;
     x = 0;
     y= 0;
     scaleFactor = 1;
    notifyListeners();
  }
}