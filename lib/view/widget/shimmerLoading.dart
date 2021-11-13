import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingBreakNews extends StatelessWidget {
  const ShimmerLoadingBreakNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white70,
      child: ListView.builder(
              itemCount: 10,   
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __){
                return Container(
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
                              
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 70,
                              margin: EdgeInsets.only(left: 16, right: 16),
                              
                            )
                          ],
                        ))),
                  ),
                );
              },
              ),
    );
  }
}

class ShimmerLoadingTopHead extends StatelessWidget {
  const ShimmerLoadingTopHead({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white70,
      child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,    
              reverse: true,   
              itemBuilder: (context, index) {
                return Container(
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
                          
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 16, bottom: 16),
                            width: 206,
                            )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}