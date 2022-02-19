//trang danh mục, đổ dlieu từ control web

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shopshoe/models/category_model.dart';
import 'package:shopshoe/widgets/category/main_category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _title = 'Categories';
  String? selectedCategory;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? _title : selectedCategory!,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(IconlyLight.search)),
          IconButton(onPressed: () {}, icon: Icon(IconlyLight.buy)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.grey.shade300,
            //copy tlieu nhét dl vào: https://pub.dev/documentation/flutterfire_ui/latest/firestore/FirestoreListView-class.html
            child: FirestoreListView<Category>(
              query: categoryCollection,
              itemBuilder: (context, snapshot) {
                Category category = snapshot.data();
                return InkWell(
                  onTap: () {
                    setState(() {
                      _title = category.catName!;
                      selectedCategory = category.catName;
                    });
                  },
                  child: Container(
                    height: 70,
                    color: selectedCategory==category.catName? Colors.white: Colors.grey.shade300,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 30,
                              child: CachedNetworkImage(
                                imageUrl: category.image!,
                                color: selectedCategory==category.catName? Theme.of(context).primaryColor :Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              category.catName!,
                              style: TextStyle(
                                  fontSize: 9.5,
                                  color: selectedCategory==category.catName? Theme.of(context).primaryColor :Colors.grey.shade700,
                                 ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            
          ),
          //hiện các dmuc phụ (file riêng)

          MainCategoryWidget(
            selectedCat: selectedCategory,
          )
        ],
      ),
    );
  }
}
