import 'package:flutter/material.dart';
import 'package:newsly/model/news.dart';
import 'package:newsly/viewmodel/service/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:newsly/view/widget/newsList.dart';
import 'package:newsly/view/widget/shimmerLoading.dart';

class TopHeadlinesTechnology extends StatelessWidget {
  const TopHeadlinesTechnology({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService api = ApiService();
     
    return Container(
      child: FutureBuilder<List<News>>(
        future: api.fetchNewsTechnology(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Pengambilan Data API Error"),
            );
          }else if (snapshot.hasData){
            return TopHeadlinesList(news: snapshot.data!);
          }
          return Center(
            child: ShimmerLoadingTopHead(),
          );
        },
      ),
    );
  }
}