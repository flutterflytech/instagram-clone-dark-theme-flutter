import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'photos_json.dart';
import 'profile_image_view_insta.dart';

class ProfileInsta extends StatefulWidget {
  final List<Photos> photosdata;

  const ProfileInsta({Key key, this.photosdata}) : super(key: key);

  @override
  _ProfileInstaState createState() => _ProfileInstaState();
}

class _ProfileInstaState extends State<ProfileInsta> {
  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            settingModalBottomSheet(context);
          },
          child: Row(
            children: <Widget>[
              Text('Satyam Sangal'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 30,
              ),
            );
          }),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.black,
          margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Satyam Sangal',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Archive"),
                        leading: Icon(Icons.archive),
                      ),
                      ListTile(
                        title: Text("Your Activity"),
                        leading: Icon(Icons.folder_shared),
                      ),
                      ListTile(
                        title: Text("Nametag"),
                        leading: Icon(Icons.transfer_within_a_station),
                      ),
                      ListTile(
                        title: Text("Saved"),
                        leading: Icon(Icons.turned_in_not),
                      ),
                      ListTile(
                        title: Text("Close Friends"),
                        leading: Icon(Icons.list),
                      ),
                      ListTile(
                        title: Text("Discover People"),
                        leading: Icon(Icons.person_add),
                      ),
                      ListTile(
                        title: Text("Open Facebook"),
                        leading: Icon(Icons.collections_bookmark),
                        onTap: () async {
                          const url = 'https://fb.com/admin.satyam';

                          if (await canLaunch(url)) {
                            await launch(url, forceSafariVC: false);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Settings"),
                        leading: Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
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
                onPressed: () {},
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Container(
                                width: 90.0,
                                height: 90.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")))),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '10',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '102',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '295',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Satyam Sangal',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 800,
                  height: 30.0,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Center(
                      child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Story Highlights',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Keep your favorite stories on your profile',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 0.75)),
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black87),
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black87),
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black87),
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  '     New',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.1)),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: <Widget>[
                        Tab(
                          child: Icon(
                            Icons.grid_on,
                            size: 30,
                          ),
                        ),
                        Tab(
                          child: Icon(
                            Icons.person_outline,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: List.generate(
                      widget.photosdata.sublist(0, 10).length, (index) {
                    Photos photosdata = widget.photosdata[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileImageViewInsta(
                                    photosdata: photosdata)));
                      },
                      child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      widget.photosdata[index].thumbnailUrl)))),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                        leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")))),
                        trailing: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 6)),
                        ),
                        title: Text(
                          'Satyam Sangal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () => {}),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 0.75)),
                          child: Icon(Icons.add)),
                      title: Text(
                        'Add Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
