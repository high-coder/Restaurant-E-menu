import 'package:flutter/material.dart';


class _SliverAppBarDelagate extends SliverPersistentHeaderDelegate{

  final double minExtent;
  final double maxExtent;
  final Widget child;

  _SliverAppBarDelagate({
      this.minExtent,
      this.maxExtent,
      this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return new SizedBox.expand(child:child);
  }


  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

}


class HeaderTextCustom extends StatelessWidget {

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate:_SliverAppBarDelagate(
        minExtent: 30,
        maxExtent: 30,
        child: Container(
          decoration: BoxDecoration(
            color:Color(0xFFF4e55af),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            //color: Colors.white,
          ),
          child: Center(
            child: Text(headerText, style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),),
          ),
        )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
