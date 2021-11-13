import 'package:flutter/material.dart';
import 'package:newsly/view/page/articles/articles_page.dart';
import 'package:newsly/view/page/articles/formUpdateArticle.dart';
import 'package:newsly/viewmodel/service/firestore_service.dart';

class DetailDialog extends StatelessWidget {
  String? image;
  String? title;
  String? author;
  String? published;
  String? description;
  String? id;
  String? urlArtikel;

  DetailDialog(
      {Key? key,
      this.image,
      this.title,
      this.author,
      this.published,
      this.description,
      this.id,
      this.urlArtikel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        children: [
          Container(
            margin: EdgeInsets.only(right: 16, left: 16, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 180,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'images/icon_user.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          author!,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Text(published!, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(description!),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => FormUpdateArticle(
                                          id: id!,
                                          author: author!,
                                          date: published!,
                                          deskripsi: description!,
                                          image: image!,
                                          title: title!,
                                          urlArtikel: urlArtikel!)));
                            },
                            child: Text(
                              "Update",
                              style: TextStyle(color: Colors.green),
                            )),
                        SizedBox(
                          width: 4.0,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              FirestoreService.deleteItem(id: id!)
                                  .then((value) => showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Data Berhasil Dihapus"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ArticlesPage()));
                                                },
                                                child: Text("OK"))
                                          ],
                                        );
                                      }));
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                )
              ],
            ),
          ),
        ]);
  }
}
