import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fluttertoast/fluttertoast.dart';

class Unique extends StatefulWidget {
  final objective;
  final initiative;
  final outcome;
  final budget;
  final date;
  final owner;
  final status;
  final support;
  final email;
  final mda;
  const Unique(
      {super.key,
      this.objective,
      this.initiative,
      this.outcome,
      this.budget,
      this.date,
      this.owner,
      this.status,
      this.support,
      this.email,
      this.mda});

  @override
  State<Unique> createState() => _UniqueState();
}

class _UniqueState extends State<Unique> {
  showStatus(status) {
    if (status == "Not Started") {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (status == 'On Time') {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (status == 'Completed') {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (status == 'Late') {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  sendLate() async {
    try {
      final response = await http.post(
          Uri.parse('https://office.laurenparkerway.com/api/late/email'),
          body: {
            'owner': widget.owner,
            'initiative': widget.initiative,
            'date': widget.date,
            'email': widget.email,
          });

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        // setState(() {
        //   items = json.decode(response.body).toList();
        // });

        // print(items.length);
        // print(items);

        Fluttertoast.showToast(
            msg: "Sent Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF293D34),
        title: Text(
          "${widget.initiative}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 30.0,
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Objectives",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              '${widget.objective}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Initiative",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              '${widget.initiative}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Outcome",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              '${widget.outcome}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Budget",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              '${widget.budget}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Completion Date",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              '${widget.date}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Owner",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              '${widget.owner}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Status",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: showStatus(widget.status),
          ),
          Divider(),
          SizedBox(
            height: 10.0,
          ),
          widget.status == 'Late'
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: Colors.amber[100],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "This initiative is behind schedule, kindly click on the below button to call attention of the MDA Head",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              sendLate();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              child: Text(
                                'Call attention',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
