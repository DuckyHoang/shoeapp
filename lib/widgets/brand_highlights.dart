import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:shopshoe/firebase_service.dart';
import 'package:shopshoe/widgets/banner_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Brand_HighLights extends StatefulWidget {
  const Brand_HighLights({Key? key}) : super(key: key);

  @override
  State<Brand_HighLights> createState() => _Brand_HighLightsState();
}

class _Brand_HighLightsState extends State<Brand_HighLights> {
  double _scrollPosition = 0;

//kn đến csdl
  final FirebaseService _service = FirebaseService();
  final List _brandAds = [];

  @override
  void initState() {
    getBrandAd();
    super.initState();
  }

  getBrandAd() {
    return _service.brandAd.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _brandAds.add(doc);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sản phẩm nổi bật',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 20),
              ),
            ),
          ),
          Container(
            height: 166,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: PageView.builder(
              itemCount: _brandAds.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                height: 100,
                                color: Colors.deepOrange,
                                child: YoutubePlayer(
                                 controller: YoutubePlayerController(
                                initialVideoId: _brandAds[index]['youtube'],
                                flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: true,
                                    loop: true,
                                ),
                               ),
                                 ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      height: 50,
                                      color: Colors.red,
                                      child: CachedNetworkImage(
                                        imageUrl: _brandAds[index]['image1'],
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            GFShimmer(
                                          child: Container(
                                            child: Container(
                                                height: 50,
                                                color: Colors.grey.shade400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      height: 50,
                                      color: Colors.red,
                                      child: CachedNetworkImage(
                                        imageUrl: _brandAds[index]['image2'],
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            GFShimmer(
                                          child: Container(
                                            child: Container(
                                                height: 50,
                                                color: Colors.grey.shade400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            height: 160,
                            color: Colors.blue,
                            child: CachedNetworkImage(
                              imageUrl: _brandAds[index]['image3'],
                              fit: BoxFit.fill,
                              placeholder: (context, url) => GFShimmer(
                                child: Container(
                                  child: Container(
                                      height: 50, color: Colors.grey.shade400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (val) {
                setState(() {
                  _scrollPosition = val.toDouble();
                });
              },
              // children: [

              //nhân đôi contend
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 5,
              //       child: Column(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(4),
              //               child: Container(
              //                 height: 100,
              //                 color: Colors.deepOrange,
              //                 child: const Center(
              //                   child: Text(
              //                     'abcde',
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                         fontSize: 20,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 flex: 1,
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(8, 0, 4, 8),
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(4),
              //                     child: Container(
              //                       height: 50,
              //                       color: Colors.red,
              //                       child: const Center(
              //                         child: Text(
              //                           'ad',
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(4, 0, 4, 8),
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(4),
              //                     child: Container(
              //                       height: 50,
              //                       color: Colors.red,
              //                       child: const Center(
              //                         child: Text(
              //                           'abcde',
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: Padding(
              //         padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(4),
              //           child: Container(
              //             height: 160,
              //             color: Colors.blue,
              //             child: const Center(
              //               child: Text(
              //                 'abcde',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              //nhân đôi contend
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 5,
              //       child: Column(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(4),
              //               child: Container(
              //                 height: 100,
              //                 color: Colors.deepOrange,
              //                 child: const Center(
              //                   child: Text(
              //                     'abcde',
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                         fontSize: 20,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 flex: 1,
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(8, 0, 4, 8),
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(4),
              //                     child: Container(
              //                       height: 50,
              //                       color: Colors.red,
              //                       child: const Center(
              //                         child: Text(
              //                           'ad',
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(4, 0, 4, 8),
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(4),
              //                     child: Container(
              //                       height: 50,
              //                       color: Colors.red,
              //                       child: const Center(
              //                         child: Text(
              //                           'abcde',
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: Padding(
              //         padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(4),
              //           child: Container(
              //             height: 160,
              //             color: Colors.blue,
              //             child: const Center(
              //               child: Text(
              //                 'abcde',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // ],
            ),
          ),
          _brandAds.isEmpty? Container():
          DotsIndicatorWidget(scrollPosition: _scrollPosition,
          itemList: _brandAds,
          )
        ],
      ),
    );
  }
}
