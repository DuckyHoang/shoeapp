import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shopshoe/models/category_model.dart';
import 'package:shopshoe/screens/main_screen.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategory;

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
                'Danh mục yêu thích',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: SizedBox(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: FirestoreListView<Category>(
                        scrollDirection: Axis.horizontal,
                        query: categoryCollection,
                        itemBuilder: (context, snapshot) {
                          Category category = snapshot.data();
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ActionChip(
                              backgroundColor:
                                  _selectedCategory == category.catName
                                      ? Colors.blue.shade900
                                      : Colors.grey,
                              label: Text(category.catName!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          _selectedCategory == category.catName
                                              ? Colors.white
                                              : Colors.black)),
                              onPressed: () {
                                setState(() {
                                  _selectedCategory = category.catName;
                                });
                              },
                            ),
                          );
                          ;
                        },
                      ),

                      //  ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: _categoryLabel.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.only(right: 8),
                      //         child: ActionChip(
                      //           backgroundColor: _index ==index? Colors.blue.shade900 :Colors.grey,
                      //             label: Text(
                      //               _categoryLabel[index],
                      //               style:  TextStyle(
                      //                   fontSize: 12, color: _index==index? Colors.white: Colors.black),
                      //             ),
                      //             onPressed: () {
                      //                setState(() {
                      //                  _index = index;
                      //                }
                      //               );
                      //             },

                      //         ),
                      //       );
                      //     }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.grey.shade400))),
                      child: IconButton(
                        //hiện all các danh mục
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MainScreen(
                                index: 1,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(IconlyLight.arrowDown),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
