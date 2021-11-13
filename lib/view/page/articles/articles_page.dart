import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newsly/view/drawer.dart';
import 'package:newsly/view/widget/card_widget.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesPage extends StatelessWidget {
  ArticlesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference _articles = _firestore.collection('articles');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Articles",
          style:
              TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 0),
            child: IconButton(
                onPressed: () {}, icon: Image.asset('images/icon_user.png')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _articles.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return ItemCard(
                        author: data['author'],
                        title: data['title'],
                        published: data['published'],
                        description: data['description'],
                        image: data['image'],
                        urlArtikel: data['url'],
                        id: document.id,
                      );
                    }).toList());
                  } else {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white70,
                        child: Column(
                            children: [
                              Container(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Card(
                                  elevation: 1,
                                  shadowColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 160,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        height: 70,
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16),
                                      )
                                    ],
                                  ))),
                            ),
                          ),
                              Container(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Card(
                                  elevation: 1,
                                  shadowColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 160,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        height: 70,
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16),
                                      )
                                    ],
                                  ))),
                            ),
                          ),
                              Container(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Card(
                                  elevation: 1,
                                  shadowColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 160,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        height: 70,
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16),
                                      )
                                    ],
                                  ))),
                            ),
                          )
                            ]
                        ));
                  }
                })
          ],
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
