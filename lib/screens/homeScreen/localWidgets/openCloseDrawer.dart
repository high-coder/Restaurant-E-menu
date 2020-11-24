import 'package:scoped_model/scoped_model.dart';

class OpenCloseDrawer {
  bool isDrawerOpen = false;

  change(){
    isDrawerOpen = !isDrawerOpen;
    //return isOpen;
  }
}

class CloseDrawer extends Model{
  bool isdrawerOpen = false;

  //bool get isDrawerOpen => isdrawerOpen;

  // this will actually change the value of the _isDrawerOpen to the opposite of what it was called upon
  bool change(bool localChange) {
    isdrawerOpen = localChange;
    return isdrawerOpen;

    // this will tell all
    notifyListeners();
  }

}