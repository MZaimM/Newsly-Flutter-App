import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsly/view/page/articles/articles_page.dart';
import 'package:newsly/viewmodel/service/firestore_service.dart';
import 'package:intl/intl.dart';

class FormUpdateArticle extends StatefulWidget {
  String id;
  String title = '';
  String date = '';
  String author = '';
  String urlArtikel = '';
  String deskripsi = '';
  String image = '';

  FormUpdateArticle(
      {Key? key,
      required this.id,
      required this.author,
      required this.date,
      required this.deskripsi,
      required this.image,
      required this.title,
      required this.urlArtikel})
      : super(key: key);

  @override
  _FormUpdateArticleState createState() => _FormUpdateArticleState(
      id: id,
      date: date,
      author: author,
      gambar: image,
      deskripsi: deskripsi,
      title: title,
      urlArtikel: urlArtikel);
}

class _FormUpdateArticleState extends State<FormUpdateArticle> {
  String title;
  String date;
  String author;
  String urlArtikel;
  String deskripsi;
  String id;
  String gambar;

  _FormUpdateArticleState(
      {required this.id,
      required this.date,
      required this.author,
      required this.gambar,
      required this.deskripsi,
      required this.title,
      required this.urlArtikel});

  DateTime? tgl;
  TextEditingController? _controllerTitle;
  TextEditingController? _controllerAuthor;
  TextEditingController? _controllerUrl;
  TextEditingController? _controllerDeskripsi;

  void initState() {
    super.initState();
    _controllerTitle = new TextEditingController()..text = title;
    _controllerAuthor = new TextEditingController()..text = author;
    _controllerDeskripsi = new TextEditingController()..text = deskripsi;
    _controllerUrl = new TextEditingController()..text = urlArtikel;
    tgl = DateTime.parse(date);
  }

  XFile? image;
  String? namaGambar;
  final ImagePicker _picker = ImagePicker();

  Future chooseImage() async {
    XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
      namaGambar = image!.name;
    });
  }

  Future<String> uploadItemImage() async {
    var url;
    if (image == null) {
      url = gambar;
    } else {
      Reference ref = FirebaseStorage.instance.ref().child(namaGambar!);

      UploadTask uploadTask = ref.putFile(File(image!.path));

      var downUrl = await uploadTask.then((res) => res.ref.getDownloadURL());
      url = downUrl.toString();
    }
    print("Download URL : " + url);

    updateItem(url);

    return url != null ? "upload sukses" : "Upload gagal";
  }

  Widget showImage() {
    return image == null ? uploadAreaID() : uploadArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Article",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  chooseImage();
                },
                child: showImage(),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerTitle,
                decoration: InputDecoration(
                    hintText: "Judul Artikel",
                    labelText: "Judul Artikel",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _controllerAuthor,
                decoration: InputDecoration(
                    hintText: "Author",
                    labelText: "Author",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              SizedBox(
                height: 16,
              ),
              DateTimeFormField(
                decoration: InputDecoration(
                    hintText: "Date",
                    labelText: "Date",
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                mode: DateTimeFieldPickerMode.date,
                dateFormat: DateFormat("yyyy-MM-dd"),
                initialValue: tgl,
                onDateSelected: (DateTime value) {
                  setState(() {
                    String formatDate = DateFormat("yyyy-MM-dd").format(value);
                    date = formatDate;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _controllerUrl,
                decoration: InputDecoration(
                    hintText: "Url Artikel",
                    labelText: "Url Artikel",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              SizedBox(
                height: 16
              ),
              TextField(
                maxLines: 8,
                controller: _controllerDeskripsi,
                decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              SizedBox(
                height: 16,
              ),
              MaterialButton(
                onPressed: () {
                  title = _controllerTitle!.text;
                  author = _controllerAuthor!.text;
                  urlArtikel = _controllerUrl!.text;
                  deskripsi = _controllerDeskripsi!.text;

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ArticlesPage()));

                  uploadItemImage().then((value) => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Data Berhasil Diupdate"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                },
                                child: Text("OK"))
                          ],
                        );
                      }));
                  

                  setState(() {
                    _controllerTitle!.clear();
                    _controllerAuthor!.clear();
                    _controllerDeskripsi!.clear();
                    _controllerUrl!.clear();
                    image = null;
                  });
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Update"),
                minWidth: double.infinity,
                padding: EdgeInsets.only(top: 14, bottom: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              )
            ],
          )),
    );
  }

  Future<void> updateItem(String url) {
    return FirestoreService.updateItem(
        title: title,
        author: author,
        published: date,
        urlArticle: urlArtikel,
        description: deskripsi,
        image: url,
        id: id);
  }

  Widget uploadArea() {
    return Container(
      height: 150,
      child: ClipRRect(
        child: Image.file(
          File(image!.path),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
    );
  }

  Widget uploadAreaID() {
    return Container(
      height: 150,
      child: ClipRRect(
        child: Image.network(
          gambar,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
