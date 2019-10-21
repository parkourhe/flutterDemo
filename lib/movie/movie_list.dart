import 'dart:async';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'movie_info.dart';

Dio dio = new Dio();

class MoveList extends StatefulWidget {
  MoveList({Key key, @required this.mt}) : super(key: key);

  final String mt;

  @override
  _MoveListState createState() => _MoveListState();
}

class _MoveListState extends State<MoveList> {
  int page = 1;

  int pageSize = 10;

  var mlist = [];

  var total;

  bool moreData = true;

  ScrollController _scrollController = new ScrollController();

  bool islodingDone = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMovieList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    
    setState(() {
      pageSize += 10;
    });

    getMovieList();

  }

  @override
  Widget build(BuildContext context) {
    if (!islodingDone) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemCount: mlist.length,
          itemBuilder: (BuildContext ctx, int i) {
            var mitem = mlist[i];
          
            if (i + 1 == mlist.length) {
              if (moreData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                );
              } else {
                return Center(
                  child: Text('没有数据了...'),
                );
              }
            } else {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext ctx){
                      return MovieInfo(id: '${mitem['id'].toString()}',title: '${mitem['title']}',);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: Image(
                          fit: BoxFit.cover,
                          height: 200.0,
                          image: NetworkImage(mitem['images']['small']),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        height: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('电影名称:' + '  ' + mitem['title']),
                            Text('上映年份:' + '  ' + mitem['year'] + '年'),
                            Text('电影类型' + '  ' + mitem['genres'].join(',')),
                            Text('豆瓣评分' +
                                '  ' +
                                '${mitem['rating']['average']}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          controller: _scrollController,
        ),
      );
    }
  }

  getMovieList() async {
    int offset = (page - 1) * pageSize;

    Response response = await dio.get(
        'http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pageSize');

    // http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=偏移量&count=每页显示多少
    var reslut = response.data;

    setState(() {
      if (mlist.length == reslut['subjects'].length) {
        moreData = false;
      }

      total = reslut['total'];

      mlist = reslut['subjects'];

      islodingDone = true;
    });
  }
}
