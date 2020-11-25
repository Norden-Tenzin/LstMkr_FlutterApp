import 'package:flutter/material.dart';
import 'package:listapp/helper.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var post = PostMkr();
  var curr = 0;

  @override
  Widget build(BuildContext context) {
    var title;
    if (post.title == "") {
      title = "Title";
    } else {
      title = post.title;
    }
    var titleEditingController = TextEditingController(text: title);

    _removeLst(lst, e) {
      lst.removeAt(e);
      List temp = lst.sublist(e);
      List output = List();
      int i = e;
      temp.forEach((element) {
        element[0] = i;
        i++;
      });
      int j = 0;
      for (int j = 0; j != e; j++) {
        output.add(lst[j]);
      }

      output.addAll(temp);
      return output;
    }

    _addLst() {
      setState(() {
        post.addItems(curr);
        curr++;
      });
      print(post.lst);
    }

    _createLst(post) {
      var mapLst =
          Map.fromIterable(post.lst, key: (e) => e[0], value: (e) => e[1]);

      return mapLst.entries.map((entry) {
        var text;
        if (entry.value.itemValue == "") {
          text = "";
        } else {
          text = entry.value.itemValue;
        }
        var textEditingController = new TextEditingController(text: text);
        // textEditingControllers.putIfAbsent(text, () => textEditingController);
        return Container(
          margin: EdgeInsets.only(left: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                child: Transform.scale(
                  alignment: Alignment(0, -1),
                  scale: .8,
                  child: Checkbox(
                    value: entry.value.checked,
                    onChanged: (bool n) {
                      setState(() {
                        entry.value.flipChecked();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                  child: TextField(
                onChanged: (value) {},
                controller: textEditingController,
                maxLines: null,
                cursorColor: Colors.blue[200],
                cursorHeight: 25,
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: "",
                ),
              )),
              Container(
                height: 30,
                width: 30,
                child: Transform.translate(
                    offset: Offset(-5, -10),
                    child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          // print(entry.key);
                          print(curr);
                          print(entry.key);
                          print("Curr: " + post.lst[entry.key][0].toString());
                          setState(() {
                            post.lst = _removeLst(post.lst, entry.key);
                            curr = post.lst.length;
                            // print(post.lst.length % entry.key);
                            // print(entry.key % post.lst.length);
                            // print(post.lst);
                            // print(post.lst.indexOf(entry));
                          });
                        })),
              ),
            ],
          ),
        );
      }).toList();
    }

    return MaterialApp(
      home: Theme(
          data: ThemeData(
              primaryColor: Colors.orange,
              primaryColorDark: Colors.yellow,
              backgroundColor: Colors.orange[100]),
          child: Scaffold(
              backgroundColor: Colors.orange[100],
              appBar: AppBar(
                toolbarHeight: 50,
                elevation: 1,
                backgroundColor: Colors.orange[100],
                leading: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              body: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 10, right: 10),
                          child: TextField(
                            onChanged: (value) {
                              // print(value);
                              // setState(() {
                              //   title = value;
                              // });
                            },
                            controller: titleEditingController,
                            cursorColor: Colors.blue[200],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: "$title",
                            ),
                          )),
                      Column(children: _createLst(post)),
                      InkWell(
                        onTap: _addLst,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 20, top: 10, bottom: 150),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                child: Transform.scale(
                                  alignment: Alignment(0, -2),
                                  scale: .8,
                                  child: Icon(Icons.add),
                                ),
                              ),
                              Text("List Item")
                            ],
                          ),
                        ),
                      )
                    ]))
                  ]))),
    );
  }
}
