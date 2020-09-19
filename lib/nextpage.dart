import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> categories = ["All", "Images", "Videos", "Documents"];

class NextPage extends StatefulWidget {
  final text;
  const NextPage(this.text);
  @override
  _NextPageState createState() => _NextPageState();
}

Color color = Colors.black;
Color color1 = Colors.black;

class _NextPageState extends State<NextPage> with TickerProviderStateMixin {
  TabController _tabController;
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _launchURL() async {
    var url = 'https://yaarme.com/login/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    var text1 = widget.text;
    return Scaffold(
      appBar: AppBar(
        title: Text("$text1"),
        centerTitle: true,
      ),
      body: text1 == 'YaarMe'
          ? Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 40),
                          child: Container(
                              height: 200,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/download.jpeg',
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          left: 20,
                          top: 140,
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'assets/0.jfif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'YaarMe',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Information services | Raipur, Chhatisgarh',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Build the world\'s most luxurious social media.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40),
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () => _launchURL(),
                          color: Colors.deepPurple,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Visit Website",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.launch,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 2,
                        tabs: <Widget>[
                          Tab(
                            text: "Home",
                          ),
                          Tab(
                            text: "About",
                          ),
                          Tab(
                            text: "Jobs",
                          ),
                          Tab(
                            text: "People",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 680,
                      child: TabBarView(controller: _tabController, children: <
                          Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Posts',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 55,
                                child: new ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categories.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SizedBox(
                                          child: RaisedButton(
                                            child: new Text(
                                                '${categories.elementAt(i)}'),
                                            onPressed: () {},
                                            //autofocus: true,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 250,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            child: Image.asset('assets/0.jfif'),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'YaarMe',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                '47 Followers',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                '2 mo',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          'We\'ll be launching our app very soon. Stay Tuned.\nCheck out our website.'),
                                      GestureDetector(
                                          onTap: () => _launchURL(),
                                          child: Text(
                                            'https://yaarme.com/',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      Text(
                                        '#yaarme #yaarmelife #socialmedia',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (color == Colors.black)
                                                setState(() {
                                                  color = Colors.blue;
                                                });
                                              else
                                                setState(() {
                                                  color = Colors.black;
                                                });
                                            },
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.thumb_up,
                                                  color: color,
                                                ),
                                                Text("Like"),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.comment),
                                              Text("Comment"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.share),
                                              Text("Share"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.near_me),
                                              Text("Send"),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 250,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            child: Image.asset('assets/0.jfif'),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'YaarMe',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                '47 Followers',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                '2 mo',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          'We have just started working to develop a social media platform which aims to connect you with your friends and family in most convinient way.'),
                                      GestureDetector(
                                          onTap: () => _launchURL(),
                                          child: Text(
                                            'https://yaarme.com/',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      Text(
                                        '#yaarme #yaarmelife #socialmedia',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (color1 == Colors.black)
                                                setState(() {
                                                  color1 = Colors.blue;
                                                });
                                              else
                                                setState(() {
                                                  color1 = Colors.black;
                                                });
                                            },
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.thumb_up,
                                                  color: color1,
                                                ),
                                                Text("Like"),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.comment),
                                              Text("Comment"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.share),
                                              Text("Share"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.near_me),
                                              Text("Send"),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 330,
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Overview',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Connecting you to the people and community you love.',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Website",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Phone",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Industry",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Company size",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Headquarters",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Type",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Founded",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () => _launchURL(),
                                                child: Text(
                                                  "https://yaarme.com",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () => customLaunch(
                                                    'tel:+919169538457'),
                                                child: Text(
                                                  "+919169538457",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Information Services",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "11-50 employees",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Raipur, Chhatisgarh",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Privately Held",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "2020",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 338,
                              width: double.infinity,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'People also viewed',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  child: Image.asset(
                                                      'assets/go.png'),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('GoTestSeries'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('E-Learning'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '40 Followers',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.check,
                                                    color: Colors.blue,
                                                  ),
                                                  Text(
                                                    'Following',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  child: Image.asset(
                                                      'assets/arm.png'),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Arm'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('Semiconductors'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '5001-10000 employees',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.blue,
                                                  ),
                                                  Text(
                                                    'Follow',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  child: Image.asset(
                                                      'assets/google.png'),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Google'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('Internet'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '10,001+ employees',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.blue,
                                                  ),
                                                  Text(
                                                    'Follow',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 80,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.notifications_none,
                                      size: 28,
                                    ),
                                    Text(
                                      'Create a job alert for Yaarme',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.blue,
                                      size: 32,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Image.asset('assets/nojobs.jpeg'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 200,
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Highlights',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '1 Connection',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child:
                                                Image.asset('assets/ak.jpg')),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Some Name'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 480,
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '4 employees',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child:
                                                  Image.asset('assets/ak.jpg'),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Somee Random Namee ● 1st',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'Developing worrl\'s most luxurious \nsocial media platform | NIT Raipur\n | web and app developer',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.deepPurple),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.message,
                                              color: Colors.deepPurple,
                                              size: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                  'assets/peop.png'),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Someone Hey ● 2nd                ',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'Web developer',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.deepPurple),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.person_add,
                                              color: Colors.deepPurple,
                                              size: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                  'assets/peop1.png'),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'People Surnamee ● 3rd      ',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'Android app developer trainee\nat Internshala / java / C / kotlin',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.deepPurple),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.person_add,
                                              color: Colors.deepPurple,
                                              size: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child:
                                                  Image.asset('assets/ak.jpg'),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Some Name Here ● 1st    ',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'Some great skills',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.deepPurple),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.message,
                                              color: Colors.deepPurple,
                                              size: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Center(
                  child: Text(
                "$text1\'s page Here",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
            ),
    );
  }
}
