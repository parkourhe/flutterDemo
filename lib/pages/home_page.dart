import 'package:flutter/material.dart';
import 'package:moviepro/movie/movie_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: Text('电影列表'),
        // 居中
        centerTitle: true,
        // appbar的选项 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )

        ],
        
      ),
      // scaffold的侧边栏组件
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            // 用户头部区域
            UserAccountsDrawerHeader(
              accountEmail: Text('99575853@qq.com'),
              accountName: Text('何攀'),
              currentAccountPicture:CircleAvatar(
                backgroundImage: NetworkImage('https://img.alicdn.com/imgextra/i4/279512537/O1CN01n6qolB1UbzNqupQ3p_!!0-item_pic.jpg_430x430q90.jpg'),
              ),
              decoration: BoxDecoration(
                
                image:DecorationImage(
                  
                  fit: BoxFit.cover,
                  image: NetworkImage('https://img.alicdn.com/i2/O1CN01gKq1I51htvuGToTav_!!0-alitrip.jpg_400x400.jpg')
                )
              ),
            ),
            ListTile(title: Text('用户反馈'),trailing:Icon(Icons.sd_storage) ,),
            ListTile(title: Text('用户反馈'),trailing:Icon(Icons.sd_storage) ,),
            ListTile(title: Text('用户反馈'),trailing:Icon(Icons.sd_storage) ,),
            // 分割组件
            Divider(
              color: Colors.red,
            ),
            ListTile(title: Text('用户反馈'),trailing:Icon(Icons.sd_storage) ,),

          ],
        ),
      ),
      // https://img.alicdn.com/imgextra/i4/279512537/O1CN01n6qolB1UbzNqupQ3p_!!0-item_pic.jpg_430x430q90.jpg
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.black),
        height: 50.0,
        child: TabBar(
          labelStyle: TextStyle(height: 0),
          tabs: <Widget>[
            Tab(
              text: '正在热映',
              icon: Icon(Icons.movie_filter),
            ),
            Tab(
              text: '即将上',
              icon: Icon(Icons.movie_creation),
            ),
            Tab(
              text: "top250",
              icon: Icon(Icons.movie_filter),
            ),
          ],
        ),
        
      ),
      body: TabBarView(
        children: <Widget>[
           
           MoveList(mt:'in_theaters'),
           MoveList(mt:'coming_soon'),
           MoveList(mt:'top250'),

        ],

      ),
    ),

    );
  }
}