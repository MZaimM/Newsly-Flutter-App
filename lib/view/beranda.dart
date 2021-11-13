
import 'package:flutter/material.dart';
import 'package:newsly/view/home.dart';
import 'package:newsly/view/page/articles/articles_page.dart';
import 'package:newsly/view/page/articles/formAddArticle.dart';

class Beranda extends StatefulWidget {
  const Beranda({ Key? key }) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket,child: currentScreen,),
       floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FormAddArticle()));
            },
            child: Icon(Icons.note_add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 16,
            shape: CircularNotchedRectangle(),
            notchMargin: 5,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = Home();
                          currentTab = 0;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = ArticlesPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article,
                          color: currentTab == 1
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          "Articles",
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.blue
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}