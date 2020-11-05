import 'package:flutter/material.dart';
import 'post.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.orange,
          primaryColorDark: Colors.yellow,
        ),
        child: Scaffold(
            floatingActionButton: Container(
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, "/post");
                    })),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.infinite,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: TextField(
                    onChanged: (value) {},
                    controller: editingController,
                    cursorColor: Colors.blue[200],
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Search",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ))),
                  ),
                ),
              ),
              toolbarHeight: 120,
              title: Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'LstMkr.',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Post(),
                      Post(),
                    ],
                  ),
                )
              ],
            )));
  }
}
