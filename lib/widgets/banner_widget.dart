import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopshoe/firebase_service.dart';
import 'package:getwidget/getwidget.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //connect hình trên csdl
  final FirebaseService _service = FirebaseService();
  double scrollPosition = 0;
  List _bannerImage = [];

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  getBanners() {
    return _service.homeBanner.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    });
  }
  //connect hình trên csdl

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              color: Colors.grey.shade200,
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: _bannerImage.length,
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    imageUrl: _bannerImage[index],
                    fit: BoxFit.fill,
                    placeholder: (context, url) => GFShimmer(
                      showShimmerEffect: true,
                      mainColor: Colors.grey.shade500,
                      secondaryColor: Colors.grey.shade300,
                      child: Container(
                        color: Colors.grey.shade300,
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  );
                },
                onPageChanged: (val) {
                  setState(() {
                    scrollPosition = val.toDouble();
                  });
                },
                // children: [
                //   Center(
                //     child: Text(
                //       'banner1',
                //       style:
                //           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   Center(
                //     child: Text(
                //       'banner2',
                //       style:
                //           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   Center(
                //     child: Text(
                //       'banner3',
                //       style:
                //           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ],
              ),
            ),
          ),
        ),
        _bannerImage.isEmpty ? Container():
        Positioned(
          bottom: 10.0,
          child: DotsIndicatorWidget(scrollPosition: scrollPosition,
          itemList: _bannerImage,
          
          ),
        )
      ],
    );
  }
}

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    Key? key,
    required this.scrollPosition,
    required this.itemList,
  }) : super(key: key);

  final double scrollPosition;
  final List itemList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: DotsIndicator(
              position: scrollPosition,
              dotsCount: itemList.length,
              decorator: DotsDecorator(
                  activeColor: Colors.blue.shade900,
                  spacing: const EdgeInsets.all(2),
                  size: const Size.square(6),
                  activeSize: const Size(12, 6),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
          ),
        ),
      ],
    );
  }
}

// class DotsIndicatorWidget extends StatelessWidget {
//   const DotsIndicatorWidget({
//     Key? key,
//     required this.scrollPosition,
//   }) : super(key: key);

//   final double scrollPosition;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: 10.0,
//       child: Row(
//         children: [
//           SizedBox(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: DotsIndicator(
//                 position: scrollPosition,
//                 dotsCount: 3,
//                 decorator: DotsDecorator(
//                   activeColor: Colors.blue.shade900,
//                     spacing: const EdgeInsets.all(2),
//                     size: const Size.square(6),
//                     activeSize: const Size(12,6),
//                     activeShape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4))),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
