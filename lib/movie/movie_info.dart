import 'package:flutter/material.dart';

class MovieInfo extends StatefulWidget {
  
  final String id;
  final String title;

  MovieInfo({Key key,this.title,this.id});

  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(title: Center(child: Text('电影详情'),),),
        body: Container(

            child: Row(children: <Widget>[
              Text('${widget.id}'),
              Text('${widget.title}')
            ],)


        ),

    );
  }
}