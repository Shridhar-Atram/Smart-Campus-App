import 'package:flutter/material.dart';
import 'package:trial1/screens/E_library.dart';
import 'package:trial1/screens/academics.dart';
import 'package:trial1/screens/help.dart';
import 'package:trial1/screens/login.dart';
import 'package:trial1/screens/mis.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //height and width of our device
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: Icon(Icons.home),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.notifications_active_rounded,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {},
      //     )
      //   ],
      //   title: Text(
      //     'DASHBOARD',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25,
      //     ),
      //   ),
      //   backgroundColor: Color.fromARGB(255, 1, 205, 215),
      //   elevation: 10,
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .30,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/college.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    width: double.infinity,
                    height: 80,
                  ),
                  Container(
                    // margin: const EdgeInsets.only(left: 20.0),
                    child: SafeArea(
                      child: Row(),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 120,
                  ),
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    //childAspectRatio: .85,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 30,

                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => academics())));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(111, 10, 217, 232),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.computer_outlined,
                                  size: 50,
                                  color: Colors.blueAccent,
                                ),
                                // Spacer(),
                                Text(
                                  'E library',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => academics())));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(111, 10, 217, 232),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bookmark_border_sharp,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                // Spacer(),
                                Text(
                                  'Academics',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => help())));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(111, 10, 217, 232),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book,
                                  size: 50,
                                  color: Colors.blueAccent,
                                ),
                                // Spacer(),
                                Text(
                                  'MIS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) => mis())));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(111, 10, 217, 232),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.help,
                                  size: 50,
                                  color: Colors.blueAccent,
                                ),
                                //Spacer(),
                                Text(
                                  'HELP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            )),
                      ),
                      //logout
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginScreen())));
                        },
                        child: Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(111, 10, 217, 232),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.browse_gallery,
                                  size: 50,
                                  color: Colors.blueAccent,
                                ),
                                //Spacer(),
                                Text(
                                  'Gallery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            )),
                      ),
                      //Logout
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginScreen())));
                        },
                        child: Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(111, 10, 217, 232),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  size: 50,
                                  color: Colors.blueAccent,
                                ),
                                //Spacer(),
                                Text(
                                  'Logout',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            )),
                      ),

                      /*   CategoryCard(
                        svgSrc:
                            'https://media.istockphoto.com/photos/city-map-3d-illustration-picture-id477560990?s=612x612',
                        title: "Campus",
                        press: () {},
                      ),
                      CategoryCard(
                        svgSrc: 'assets/icons/icons8-home.svg',
                        title: "Attendance History",
                        press: () {},
                      ),
                      CategoryCard(
                        svgSrc: 'assets/icons/icons8-home.svg',
                        title: "Leave Application",
                        press: () {},
                      ),
                      CategoryCard(
                        svgSrc: 'assets/icons/icons8-home.svg',
                        title: "Leave Summary",
                        press: () {},
                      ),*/
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
