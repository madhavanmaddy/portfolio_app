import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/forms/designformpage.dart';
import 'package:portfolio/pages/projectdetailspage.dart';
import 'package:portfolio/services/crud.dart';
import 'package:portfolio/homepage.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/uiuxpage.dart';

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDesignPage1(),
    );
  }
}

class MyDesignPage1 extends StatefulWidget {
  MyDesignPage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDesignPage1> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot designprojects;
  int temp2;
  double temp3;

  @override
  void initState() {
    crudObj.getdatad().then((results) {
      setState(() {
        designprojects = results;
        temp2 = designprojects.documents.length;
        if (temp2 % 2 == 0) {
          temp2 = temp2 * 120;
          temp3 = temp2.toDouble();
        } else {
          // temp = projects.documents.length;
          temp2 = temp2 + 1;
          temp2 = temp2 * 120;
          temp3 = temp2.toDouble();
        }
      });
    });
    super.initState();
  }

  ScrollController _scrollController = new ScrollController();
  List<Widget> _messages = <Widget>[new Text('hello'), new Text('world')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0), bottom: Radius.circular(40.0)),
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.vertical,
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.symmetric(vertical: 40),
              children: <Widget>[
                // DrawerHeader(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 18.0),
                //     child: Center(
                //         child: Text(
                //           'Corona Virus Tracker ',
                //           style: TextStyle(fontSize: 27, color: Colors.white,fontWeight: FontWeight.bold),
                //         )),
                //   ),
                //   decoration: BoxDecoration(
                //       color: Colors.blue[500],
                //       //
                //       ),
                // ),
                SizedBox(height: 40),
                Image.asset('assets/images/menu.png'),
                SizedBox(height: 30),
                ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Recent projects',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Circular Air",
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'overallprojectspage');
                    }),
                    GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, 'teamspage');
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Teams',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'apppage');
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'App development',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        EnterExitRoute(
                            exitPage: MyHomePage(),
                            enterPage: MyDesignPage1()));
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Graphic Design',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        EnterExitRoute(
                            exitPage: MyHomePage(), enterPage: MyuiuxPage()));
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'UI/UX Design',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mycontact()),
                    );
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Contact us',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: new Text(
                "Hey there,",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xff101010),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: new Text(
                "Every great design begins with an even better story",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Image.asset('assets/images/Design.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'What do you want us to design ?',
                    style: TextStyle(
                      fontFamily: "Circular Air",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff101010),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _messages.insert(
                          5, new Text("message ${_messages.length}"));
                    });
                    _scrollController.animateTo(
                      5,
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 100.0,
              child: ListView(
                controller: _scrollController,

                reverse: true,
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Other Design Projects')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/others.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Others'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Ad Design')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/ads.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Ads'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Mockup Design')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/mockups.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Mockups'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Template Design')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/temp.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Templates'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Banner Design')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/Banner.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Banners'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Illustration Design')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/illustration.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Illustrations'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  designformpage('Poster Design')));
                    },
                    child: new Container(
                      height: 116.00,
                      width: 100.00,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(33.00),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/poster.png',
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Posters'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recents',
                    style: TextStyle(
                      fontFamily: "Circular Air",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xff101010),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        crudObj.getdatad().then((results) {
                          setState(() {
                            designprojects = results;
                            temp2 = designprojects.documents.length;
                            if (temp2 % 2 == 0) {
                              temp2 = temp2 * 120;
                              temp3 = temp2.toDouble();
                            } else {
                              // temp = projects.documents.length;
                              temp2 = temp2 + 1;
                              temp2 = temp2 * 120;
                              temp3 = temp2.toDouble();
                            }
                          });
                        });
                      })
                ],
              ),
            ),
            SizedBox(height: 30),
            recentprojects(),
            SizedBox(height: 30),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget recentprojects() {
    return designprojects != null
        ? SizedBox(
            height: temp3,
            child: GridView.builder(
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
              ),
              itemCount: designprojects.documents.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.00, 3.00),
                          color: Color(0xff000000).withOpacity(0.09),
                          blurRadius: 30,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.00),
                    ),
                    child: IconButton(
                      icon: Image.network(
                          designprojects.documents[index].data['image']),
                      onPressed: () {
                         Navigator.push(
                            context,
                            EnterExitRoute(
                                exitPage: MyDesignPage1(),
                                enterPage: MyDetailsPage(
                                    designprojects.documents[index].data['title'],
                                    designprojects.documents[index].data['desc'],
                                    designprojects.documents[index].data['image']
                                    )));
                      },
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
