// trang chủ + phần tách làm riêng
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopshoe/widgets/banner_widget.dart';
import 'package:shopshoe/widgets/brand_highlights.dart';
import 'package:shopshoe/widgets/category/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
          centerTitle: true,
          title: const Text('Shoes Store',style: TextStyle(
            letterSpacing: 2,
          ),
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.buy),
              onPressed: (){},
              )
          ],
        ),
      ),
      body:ListView(

        //khung tìm kiếm sp
        //tách widget, banner widget bên file riêng
        children: const [
          SearchWidget(),
          SizedBox(height: 10,), //khoảng cách 2 phần 
          BannerWidget(),
          Brand_HighLights(),
          CategoryWidget(),  //vài danh mục trên màn home
          
         
        ],

      )
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(
          height: 55,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                    hintText: 'Bạn tìm gì nào ?',
                    hintStyle: TextStyle(color: Colors.grey,),
                    prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey,)
                  ),
                ),
              ),
            ),
          ),
        ),
        //khung nổi bật
        SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: [
                Row(
                  children:const [
                    Icon(IconlyLight.infoSquare,size: 12, color: Colors.white),
                    Text('Chính hãng 100%',style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),),
                  ],
                ),
                Row(
                  children:const [
                    Icon(IconlyLight.infoSquare,size: 12, color: Colors.white,),
                    Text('7 ngày đổi trả',style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),),
                  ],
                ),
                Row(
                  children:const [
                    Icon(IconlyLight.infoSquare,size: 12, color: Colors.white,),
                    Text('Thanh toán an toàn',style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),),
                  ],
                ),

              ],
            ),
          ),
        
      ],
    );
  }
}