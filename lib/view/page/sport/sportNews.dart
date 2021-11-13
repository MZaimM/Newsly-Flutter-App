import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsly/view/page/sport/breakNewsSport.dart';
import 'package:newsly/view/page/sport/topHeadlinesSport.dart';

class SportNews extends StatelessWidget {
  const SportNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  'Breaking News',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#4E3A55')),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              BreakNewsSport(),
              SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  'Top Headlines',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#4E3A55')),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TopHeadlinesSport()
            ],
          ),
        ));
  }
}