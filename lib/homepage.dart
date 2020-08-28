import 'package:aplikasi_berita/helper/data_category.dart';
import 'package:aplikasi_berita/helper/data_request.dart';
import 'package:aplikasi_berita/helper/widget.dart';
import 'package:aplikasi_berita/main.dart';
import 'package:aplikasi_berita/models/category.dart';
import 'package:aplikasi_berita/news_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();


  List<Category> categories = List<Category>();

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: myAppbar(),
      body: SafeArea(
        child: FutureBuilder(
          future: news.getNews(),
          builder: (context, snapshot){

            //jika api mempunyai data
            if(snapshot.hasData){
//              return Center(child: Text('Data Ditemukan!'));
            return NewsPage(snapshot.data, categories);

              //jika api tidak mempunyai data gagal atau error
            } else if(snapshot.hasError){
              return Center(child: Text('Data tidak Ditemukan!'));
              }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
