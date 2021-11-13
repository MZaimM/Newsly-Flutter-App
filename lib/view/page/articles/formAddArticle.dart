import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:newsly/viewmodel/service/firestore_service.dart';

class FormAddArticle extends StatefulWidget {
  FormAddArticle({Key? key}) : super(key: key);

  @override
  State<FormAddArticle> createState() => _FormAddArticleState();
}

class _FormAddArticleState extends State<FormAddArticle> {
  TextEditingController _controllerTitle = new TextEditingController();
  TextEditingController _controllerAuthor = new TextEditingController();
  TextEditingController _controllerUrl = new TextEditingController();
  TextEditingController _controllerDeskripsi = new TextEditingController();

  String _title = '';
  String _date = '';
  String _author = '';
  String _urlArtikel = '';
  String _deskripsi = '';

  XFile? image;
  String? namaGamber;
  final ImagePicker _picker = ImagePicker();

  Future chooseImage() async {
    XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
      namaGamber = image!.name;
    });
  }

  Widget showImage() {
    return image == null
        ? Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                color: HexColor("#F5F5F5"),
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
                child: Icon(
              Icons.add_photo_alternate_outlined,
              size: 40,
              color: Colors.grey,
            )))
        : uploadArea();
  }

  Future<String> uploadItemImage() async {
    Reference ref = FirebaseStorage.instance.ref().child(namaGamber!);

    UploadTask uploadTask = ref.putFile(File(image!.path));

    var downUrl = await uploadTask.then((res) => res.ref.getDownloadURL());
    var url = downUrl.toString();

    print("Download URL : " + url);

    tambahItem(url);

    return url != null ? "upload sukses" : "Upload gagal";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Article",
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
                onDateSelected: (DateTime value) {
                  setState(() {
                    String formatDate = DateFormat("yyyy-MM-dd").format(value);
                    _date = formatDate;
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
                height: 16,
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
                  _title = _controllerTitle.text;
                  _author = _controllerAuthor.text;
                  _urlArtikel = _controllerUrl.text;
                  _deskripsi = _controllerDeskripsi.text;

                  uploadItemImage();

                  setState(() {
                    _controllerTitle.clear();
                    _controllerAuthor.clear();
                    _controllerDeskripsi.clear();
                    _controllerUrl.clear();
                    image = null;
                  });
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Submit"),
                minWidth: double.infinity,
                padding: EdgeInsets.only(top: 14, bottom: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              )
            ],
          )),
    );
  }

  Future<void> tambahItem(String url) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference _articles = _firestore.collection('articles');

    return FirestoreService.addItem(
            title: _title,
            author: _author,
            published: _date,
            urlArticle: _urlArtikel,
            description: _deskripsi,
            image: url,
            id: _articles.doc().id)
        .then((value) => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Data Berhasil Ditambahkan"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"))
                ],
              );
            }));
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
}
