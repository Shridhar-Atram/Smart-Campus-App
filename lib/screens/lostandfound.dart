import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './lost.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LostAndFound extends StatelessWidget {
  LostAndFound({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('item_list');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Lost & Found'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'title': e['title'],
                      'description': e['description'],
                      //  'postedBy': e['postedBy'],
                      // 'title':e['title'],
                    })
                .toList();

            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  Map thisItem = items[i];
                  return FinalItem(thisItem['id']);
                });
          }
          /*  return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: loadedItems.length,
              shrinkWrap: true,
              itemBuilder: (context, i) => FinalItem(
                  loadedItems[i].id,
                  loadedItems[i].title,
                  loadedItems[i].description,
                  loadedItems[i].postedBy,
                  loadedItems[i].imageUrl));*/
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: Container(
        height: 56,
        margin: EdgeInsets.symmetric(vertical: 1.3, horizontal: 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.redAccent,
                ),
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text('Lost?',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lost()));
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.green,
                ),
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text('Found!',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lost()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalItem extends StatelessWidget {
  FinalItem(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('item_list').doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  final User? user = FirebaseAuth.instance.currentUser;
  //final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                    color: Colors.blue.shade100,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 110.0,
                              height: 110.0,
                              color: Colors.white,
                              child: Image.network(
                                  'https://image.shutterstock.com/image-vector/clipboard-check-marks-flat-style-260nw-461616316.jpg'),
                            ),
                            //
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: Text('${data['title']}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(height: 5.0),
                                Text('${data['description']}',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            //    SizedBox(height:20.0),
                            Container(
                                // alignment: Alignment.bottomRight,
                                padding:
                                    EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 95.0),
                                child: Text('Found',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                        Container(
                            //alignment: Alignment.bottomLeft,
                            //   margin: const EdgeInsets.all(12.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              // color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // ignore: prefer_interpolation_to_compose_strings
                            child: Row(
                              children: [
                                Icon(Icons.mail),
                                SizedBox(width: 5.0),
                                Text("Contact-",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(153, 23, 1, 1),

                                      //decoration: TextDecoration.underline,
                                    )),
                                SizedBox(width: 8.0),
                                Text("${user?.email}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(153, 3, 83, 101),
                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            )),
                      ],
                    )),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
