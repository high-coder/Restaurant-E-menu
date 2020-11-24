import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future ImageCustom;



///
///
/// NOT IN USE RIGHT NOW
///
///
///




class ImageContainerCustom extends StatefulWidget {
  String url;

  ImageContainerCustom({this.url});
  @override
  _ImageContainerCustomState createState() => _ImageContainerCustomState();
}

class _ImageContainerCustomState extends State<ImageContainerCustom>{

  StorageReference _reference = FirebaseStorage.instance.ref();

  Future<String> getImage(url) async {
    String img;
    await _reference.child(url).getDownloadURL().then((value) {
      img = value;
    });
    print(img);
    return img;
  }

  @override
  void initState() {
    super.initState();
    ImageCustom = getImage(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("In the Image classs======================================================");
    //print(widget.url);
    return Container(
      child: FutureBuilder(
        future: ImageCustom,
        builder: (context, snapshot){
          print(snapshot.data);
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Text("none");
            case ConnectionState.waiting:
              return Text("Waiting");
            case ConnectionState.done:
              return Container(
                width: size.width - 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );

            default:
              return Text("default");
          }

        },
      ),
      // child: FutureProvider(
      //   create: (_){
      //     return getImage(widget.url);
      //   },
      //   child: Consumer<String>(
      //     builder: (_, value, __) {
      //       //print("thisnfns-=-=====================================================");
      //       //print(value);
      //       return value != null
      //           ? ClipRRect(borderRadius: BorderRadius.circular(20),
      //         child: CachedNetworkImage(
      //           width: size.width - 80,
      //           fit: BoxFit.fitWidth,
      //           imageUrl: value,
      //           progressIndicatorBuilder:
      //               (context, url, downloadProgress) =>
      //               CircularProgressIndicator(
      //                   value: downloadProgress.progress),
      //           errorWidget: (context, url, error) =>
      //               Icon(Icons.error),
      //         ),
      //       )
      //           : Center(child: Text(' loading ... '));
      //     },
      //   ),
      // ),
    );
  }
}
