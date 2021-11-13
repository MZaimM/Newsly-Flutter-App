import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsly/view/detailNews.dart';
import 'package:newsly/view/widget/dialog_widget.dart';

class ItemCard extends StatelessWidget {
  String title;
  String published;
  String author;
  String urlArtikel;
  String description;
  String image;
  String id;

  ItemCard(
      {Key? key,
      required this.author,
      required this.title,
      required this.published,
      required this.description,
      required this.image,
      required this.urlArtikel,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contex) => DetailNews(
                      source: author,
                      url: urlArtikel,
                    )));
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return DetailDialog(
                image: image,
                author: author,
                published: published,
                title: title,
                description: description,
                id: id,
                urlArtikel: urlArtikel,
              );
            });
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Card(
              elevation: 1,
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 160,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          image,
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
                          title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#4E3A55')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            published,
                            style: TextStyle(
                                fontSize: 14, color: HexColor('#999CA0')),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
        ),
      ),
    );
  }
}
