import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shopshoe/models/main_category_model.dart';
import 'package:shopshoe/models/sub_category_model.dart';

class SubCategoryWidget extends StatelessWidget {
  final String? selectedSubCat;
  const SubCategoryWidget({this.selectedSubCat,Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      //chép tại:https://pub.dev/documentation/flutterfire_ui/latest/firestore/FirestoreQueryBuilder-class.html
      child: FirestoreQueryBuilder<SubCategory>(
     query: SubCategoryCollection(
       selectedSubCat: selectedSubCat
     ),
     builder: (context, snapshot, _) {
    if (snapshot.isFetching) {
      return const Center(child: const CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Text('error ${snapshot.error}');
    }

    return GridView.builder(
     shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: snapshot.docs.length==0? 1/.1: 1/1.1
      ),
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        
        SubCategory subCat = snapshot.docs[index].data();
        return Column(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CachedNetworkImage(
                  imageUrl: subCat.image!,
                  placeholder: (context,_){
                    return Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey.shade300,
                    );
                  },
                ),
              ),
            ),
            
            Text(subCat.subCatName!),
          ],
        );
      },
    );
  },
)
    );
  }
}
