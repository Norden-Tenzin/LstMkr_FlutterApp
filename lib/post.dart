import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/post");
        },
        child: Container(
          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "List Title",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      child: Transform.scale(
                        alignment: Alignment(0, -3),
                        scale: .8,
                        child: Checkbox(
                          value: false,
                          onChanged: null,
                        ),
                      ),
                    ),
                    Container(
                      width: 350,
                      // margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam hendrerit nibh justo, ut mollis orci imperdiet vitae. Nulla nulla nulla, euismod quis ante sit amet, luctus pulvinar arcu. Vivamus a consequat nibh. In posuere maximus convallis. Vestibulum pharetra, lectus ut semper pulvinar, ligula lectus consectetur purus, in molestie nibh diam ac orci. Morbi venenatis ullamcorper pellentesque. Duis quis faucibus nisi. Pellentesque blandit porttitor elementum. Vivamus et justo ac turpis imperdiet lobortis. Donec id orci vitae leo gravida dapibus convallis nec libero. Donec consequat nulla a purus sagittis iaculis.',
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ));
  }
}
