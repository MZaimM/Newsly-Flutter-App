import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsly/view/page/business/breakNewsBusiness.dart';
import 'package:newsly/view/page/business/topHeadlinesBusiness.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({ Key? key }) : super(key: key);

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
              BreakNewsBusiness(),
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
              TopHeadlinesBusiness()
            ],
          ),
        ));
  }
}