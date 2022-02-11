import 'package:ezeness/Data_Model_Story.dart';
import 'package:ezeness/Data_Model_Story.dart';
import 'package:ezeness/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // ignore: prefer_const_constructors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        label: '',
        icon: Icon(
          CupertinoIcons.home,
          color: Colors.black,
        )),
    const BottomNavigationBarItem(
        label: '', icon: Icon(CupertinoIcons.cart, color: Colors.black)),
    const BottomNavigationBarItem(
        label: '', icon: Icon(CupertinoIcons.camera, color: Colors.black)),
    const BottomNavigationBarItem(
        label: '', icon: Icon(CupertinoIcons.memories, color: Colors.black)),
    const BottomNavigationBarItem(
        label: '', icon: Icon(CupertinoIcons.star, color: Colors.black)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130), child: Header()),
      bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).accentColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          // ignore: sized_box_for_whitespace
          child: Container(
            height: kBottomNavigationBarHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                    // sets the background color of the `BottomNavigationBar`
                    canvasColor: Colors.white,
                    // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                    primaryColor: Colors.red,
                    textTheme: Theme.of(context).textTheme.copyWith(
                        caption: const TextStyle(color: Colors.yellow))),
                child: BottomNavigationBar(
                    currentIndex: _currentIndex,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.black,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    items: items),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.grey.shade200,
              height: 50.0,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    // ignore: prefer_const_constructors
                    child: Text(
                      'HEAD TIL' + index.toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    alignment: Alignment.center,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Stack(alignment: Alignment.bottomRight, children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/banner.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    "50% OFF",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
            Row(
              children: [
                Container(
                    color: Colors.grey.shade50,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Best Practice Definition & Meaning',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )))),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'View All'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )))),
              ],
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                      // ignore: unnecessary_new
                      child: new Container(
                          child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://i.stack.imgur.com/UHa1c.png'),
                            )),
                        margin: const EdgeInsets.all(10),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text('Main Category' + index.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ))),
                    ],
                  )));
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
                color: Colors.grey.shade50,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '#Best Title'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )))),
            productList(),
            productList(),
            productList(),
            Container(
                color: Colors.grey.shade50,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '#Top Title'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )))),
            statusUi(),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://i.stack.imgur.com/UHa1c.png'),
                          )),
                    ),
                    const Text('Sub Category ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://i.stack.imgur.com/UHa1c.png'),
                          )),
                    ),
                    const Text('Sub Category ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    color: Colors.grey.shade50,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '#Shop by Category'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            )))),
                const Spacer(),
                Container(
                    color: Colors.grey.shade50,
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'View All'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            )))),
              ],
            ),
            productList(),
            footerUi(),
            footerFinalUi(),
          ],
        ),
      ),
    );
  }

  Widget footerUi() {
    return Row(
      children: [
        Spacer(),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Terms of Use'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )))),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Contact'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )))),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Career'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )))),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Area Range'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )))),
        Spacer(),
      ],
    );
  }

  Widget footerFinalUi() {
    return Row(
      children: [
        Spacer(),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'UP SELL'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )))),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'PROJECT BY'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ))),
        Container(
            color: Colors.grey.shade50,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  ' EZENESS TECHNOLOGY'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
        Spacer(),
      ],
    );
  }

  Widget statusUi() {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dummyStoryData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(dummyStoryData[index].profilepic),
                    )),
                margin: const EdgeInsets.all(10),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text('@User ' + index.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ))),
            ],
          ),
        ));
  }

  Widget productList() {
    return Container(
        color: Colors.grey.shade200,
        height: 300,
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  // if you need this
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(alignment: Alignment.bottomRight, children: <Widget>[
                      Image.network(
                        'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWVucyUyMGZhc2hpb258ZW58MHx8MHx8&w=1000&q=80',
                        height: 200.0,
                        width: 140.0,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "3 KM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text(
                                '00.00/',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20.0,
                                    decoration: TextDecoration.lineThrough),
                              )),
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                "00%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ])),
                    const Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          "00.00",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          "Product Service",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          'Title Product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        )),
                  ],
                ),
              );
            }));
  }

  List<Data_Model_Story> dummyStoryData = [
    new Data_Model_Story(
        name: "Rajat Palankar",
        postphoto:
            "https://d1kkg0o175tdyf.cloudfront.net/large/m_d2c4766b1ede-2019-01-27-14-00-16-000106.jpg",
        profilepic:
            "https://pbs.twimg.com/profile_images/1243950916362895361/Z__-CJxz_400x400.jpg"),
    new Data_Model_Story(
        name: "BB ki Vines",
        postphoto:
            "https://i.gadgets360cdn.com/large/bb_ki_vines_body_1579760395127.jpg",
        profilepic:
            "https://images-na.ssl-images-amazon.com/images/I/711q+ma1FQL.png"),
    new Data_Model_Story(
        name: "ashishchanchlani",
        postphoto:
            "https://assets.entrepreneur.com/content/3x2/2000/20200217104953-Ashish1.jpeg",
        profilepic:
            "https://yt3.ggpht.com/a/AATXAJwZGPuuePGI6Mr887w6f6ZxsnoDl-Xf10gKPKIOeg=s900-c-k-c0xffffffff-no-rj-mo"),
    new Data_Model_Story(
        name: "carryminati",
        postphoto: "https://i.ytimg.com/vi/zzwRbKI2pn4/maxresdefault.jpg",
        profilepic:
            "https://m.media-amazon.com/images/M/MV5BM2NlNzUyODUtZDgyNS00ZjU3LWI5NGUtOWFkYmQwMGVlNGRmXkEyXkFqcGdeQXVyMTE2MTc3MzU1._V1_.jpg"),
    new Data_Model_Story(
        name: "Leo",
        postphoto:
            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        profilepic:
            "https://cdn.pixabay.com/photo/2016/11/29/02/28/attractive-1866858__340.jpg"),
    new Data_Model_Story(
        name: "Jack",
        postphoto:
            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        profilepic:
            "https://cdn.pixabay.com/photo/2017/06/26/02/47/people-2442565__340.jpg"),
    new Data_Model_Story(
        name: "Amelia",
        postphoto:
            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        profilepic:
            "https://cdn.pixabay.com/photo/2018/01/24/19/49/people-3104635__340.jpg"),
    new Data_Model_Story(
        name: "Sophia",
        postphoto:
            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        profilepic:
            "https://cdn.pixabay.com/photo/2017/11/23/07/47/babe-2972221__340.jpg"),
    new Data_Model_Story(
        name: "Emily",
        postphoto:
            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        profilepic:
            "https://cdn.pixabay.com/photo/2015/07/31/15/01/man-869215__340.jpg"),
  ];
}
