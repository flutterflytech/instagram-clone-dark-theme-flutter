import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:insta_ui/status_view_insta.dart';
import 'name_json.dart';
import 'photos_json.dart';
import 'profile_insta.dart';
import 'user_profile_insta.dart';

class HomeInsta extends StatefulWidget {
  @override
  _HomeInstaState createState() => _HomeInstaState();
}

class _HomeInstaState extends State<HomeInsta> {
  List<Photos> photos_list = [];
  List<Name> name_list = [];

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    photos_list = await fetchPhotos();
    name_list = await fetchName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.photo_camera,
            size: 30,
          ),
        ),
        title: Text('Instagram'),
        actions: <Widget>[
          Transform.rotate(angle: pi / -4, child: Icon(Icons.send, size: 25)),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: Icon(Icons.search, size: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: Icon(Icons.add_box, size: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: Icon(Icons.favorite_border, size: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileInsta(
                                photosdata: photos_list,
                              )));
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"))),
                          ),
                          Positioned(
                              top: 55,
                              left: 50,
                              child: Container(
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.lightBlueAccent,
                                      border: Border.all(
                                          color: Colors.black, width: 1.5)),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  )))
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 320,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          //shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          children: List.generate(name_list.length, (index) {
                            Name namedata = name_list[index];

                            Photos photosdata = photos_list[index];

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StatusViewInsta(
                                              photosdata: photosdata,
                                              namedata: namedata,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: 80.0,
                                  height: 55.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              photosdata.thumbnailUrl))),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(name_list.length, (index) {
                    Name namedata = name_list[index];

                    Photos photosdata = photos_list[index];
                    return Container(
                      child: Card(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
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
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserProfileInsta(
                                                    photosdata: photos_list,
                                                    namedata: namedata,
                                                  )));
                                    },
                                    child: Text(
                                      namedata.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          contentPadding: EdgeInsets.all(20),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Report...'),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  'Turn On Post Notifications'),
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
                                              Text('Unfollow'),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text('Mute')
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.more_vert,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 450,
                                height: 400,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            photosdata.thumbnailUrl)))),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
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
                                    angle: pi / -4,
                                    child: Icon(Icons.send, size: 28)),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '2,325 likes',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Photos>> fetchPhotos() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/photos');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    var data = json.decode(response.body);
    var rest = data as List;
    List<Photos> photos_list =
        rest.map((json) => Photos.fromJson(json)).toList();
    return photos_list;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<List<Name>> fetchName() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    var data = json.decode(response.body);
    var rest = data as List;
    List<Name> name_list = rest.map((json) => Name.fromJson(json)).toList();
    return name_list;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
