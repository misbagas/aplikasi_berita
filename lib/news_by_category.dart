import 'package:aplikasi_berita/helper/data_request.dart';
import 'package:aplikasi_berita/helper/widget.dart';
import 'package:aplikasi_berita/main.dart';
import 'package:aplikasi_berita/models/ResponseNews.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'news_item.dart';

class NewsByCategorie extends StatefulWidget {
  final String newsCategory;

  const NewsByCategorie({this.newsCategory});

  @override
  _NewsByCategorieState createState() => _NewsByCategorieState(newsCategory);
}

class _NewsByCategorieState extends State<NewsByCategorie> {
  NewsByCategory newsByCategory = NewsByCategory();

  String newsCategory;

  _NewsByCategorieState(this.newsCategory);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: myAppbar(),
      body: FutureBuilder(
        future: newsByCategory.getNewsByCategory(newsCategory),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListNewsCategory(snapshot.data);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("data tidak itemukan"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListNewsCategory extends StatelessWidget {
  ResponseNews responseNews;

  ListNewsCategory(this.responseNews);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ListView.builder(
            itemCount: responseNews.articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsItem(
                imgurl: responseNews.articles[index].urlToImage ?? "",
                title: responseNews.articles[index].title ?? "",
                desc: responseNews.articles[index].description ?? "",
                content: responseNews.articles[index].content ?? "",
                posturl: responseNews.articles[index].url ?? "",
                name: responseNews.articles[index].source.name ?? "",
              );
            }),
      ),
    );
  }
}
