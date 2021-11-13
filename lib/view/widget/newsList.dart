import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsly/model/news.dart';
import 'package:newsly/view/detailNews.dart';

class BreakNewsList extends StatelessWidget {
  const BreakNewsList({ Key? key,  required this.news }) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: news.length,   
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => DetailNews(
                                author: news[index].author,
                                title: news[index].title,
                                image: news[index].image,
                                published: news[index].published,
                                content: news[index].content, 
                                url: news[index].url,
                                source: news[index].source,
                              )));
                },
                child: Container(
                  width: 304,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 144,
                              margin:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    news[index].image,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 70,
                              margin: EdgeInsets.only(left: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    news[index].title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('#4E3A55')),
                                  ),
                                 
                                  Text(
                                    news[index].published,
                                    style: TextStyle(
                                        fontSize: 14, color: HexColor('#999CA0')),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))),
                  ),
                ),
              );
            },
            );
  }
}

class TopHeadlinesList extends StatelessWidget {
  const TopHeadlinesList({ Key? key,  required this.news }) : super(key: key);

  final List<News> news;
  

  @override
  Widget build(BuildContext context) {

    return Flexible(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: news.length,    
            reverse: true,   
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => DetailNews(
                                author: news[index].author,
                                title: news[index].title,
                                image: news[index].image,
                                published: news[index].published,
                                content: news[index].content,
                                url: news[index].url,
                                source: news[index].source,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                  height: 120,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 73,
                          height: 77,
                          margin:
                              EdgeInsets.only(left: 16, top: 16, bottom: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.network(
                              news[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 16, bottom: 16),
                            width: 206,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news[index].title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#4E3A55')),
                                ),
                               
                                Text(
                                  news[index].content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: HexColor('#999CA0'),
                                    fontSize: 12
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
  }
}