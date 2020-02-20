import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insta_ui/photos_json.dart';

import 'name_json.dart';

class ImageViewInsta extends StatefulWidget {
  final Name namedata;
  final Photos photosdata;

  const ImageViewInsta({Key key, this.namedata, this.photosdata})
      : super(key: key);

  @override
  _ImageViewInstaState createState() => _ImageViewInstaState();
}

class _ImageViewInstaState extends State<ImageViewInsta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5, left: 2),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Posts',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")))),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.namedata.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              contentPadding: EdgeInsets.all(20),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Post to Other Apps...'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Copy Link'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Share to...'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Archive'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Edit'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Delete'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Turn Off Commenting'),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.more_vert,
                          size: 28,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 450,
                    height: 400,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                widget.photosdata.thumbnailUrl)))),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.chat_bubble_outline, size: 30),
                    SizedBox(
                      width: 15,
                    ),
                    Transform.rotate(
                        angle: pi / -4, child: Icon(Icons.send, size: 30)),
                    Spacer(),
                    Icon(Icons.turned_in_not, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Text(
                      'Liked by',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List.generate(10, (index) {
                      return Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: 399.0,
                                      // maxHeight: 1000.0,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Name : ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          TextSpan(text: 'Comments.'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                /*Container(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: 260.0,
                                       // maxHeight: 1000.0,

                                      ),
                                      child: Text(
                                          ' ' + widget.commentdata[index].body),
                                    )),*/
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
