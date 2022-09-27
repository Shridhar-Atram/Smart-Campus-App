import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lost extends StatefulWidget {
  const Lost({Key? key}) : super(key: key);

  @override
  State<Lost> createState() => _LostState();
}

class _LostState extends State<Lost> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerdescription = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('item_list');
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lost an item?'),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal:2.0,vertical:4.0),
            child: 
               Form(
                  key: key,
                  child: Column(
                    children: [
                      Container(
                        margin:EdgeInsets.symmetric(vertical:10.0),
                    width:150.0,
                    height:150.0,
                    child: Image.network(
                        'https://www.pngitem.com/pimgs/m/245-2454007_lost-and-found-icon-hd-png-download.png'),
                  ),

                     // SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 20.0),
                        child: TextFormField(
                          controller: _controllerTitle,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 10.0),
                            hintText: 'Enter Name of an item',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            focusColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25.7)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 10.0),
                        child: TextFormField(
                          maxLines: 5,
                          controller: _controllerdescription,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 10.0),
                            hintText: 'Enter Description ',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            focusColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25.7)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the description';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2.0),
                      ElevatedButton(
                          onPressed: () async {
                            if (key.currentState!.validate()) {
                              String itemTitle = _controllerTitle.text;
                              String itemDescription =
                                  _controllerdescription.text;

                              Map<String, String> dataToSend = {
                                'title': itemTitle,
                                'description': itemDescription,
                              };
                                _reference.add(dataToSend);
                            }
                          
                          },
                          child: const Text('Submit')),
                    ],
                  )),
            ));
  }
}
