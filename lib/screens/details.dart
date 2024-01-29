import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mda/screens/unique.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  final short;
  final full;
  final rate;
  final total;
  const Details({super.key, this.short, this.full, this.rate, this.total});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List items = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://office.laurenparkerway.com/api/mdas/unique?mda=${widget.full}'));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        setState(() {
          items = json.decode(response.body).toList();
        });

        print(items.length);
        print(items);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  showStatus(status) {
    if (status == "Not Started") {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.grey[900],
        ),
      );
    } else if (status == 'On Time') {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.amber,
        ),
      );
    } else if (status == 'Completed') {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.green,
        ),
      );
    } else if (status == 'Late') {
      return Text(
        '${status}',
        style: TextStyle(
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '${widget.full}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170.0,
                  height: 170.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Key Initiatives',
                        style: TextStyle(
                          color: Color(0xFF293D34),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF293D34),
                        radius: 40.0,
                        child: Text(
                          '${widget.total}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 170.0,
                  height: 170.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Completion Rate',
                        style: TextStyle(
                          color: Color(0xFF293D34),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF293D34),
                        radius: 40.0,
                        child: Text(
                          '${widget.rate}%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 45.0,
            color: Color(0xFF293D34),
            child: Text(
              '2024 Key Initiatives',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 13.0,
          ),
          items.length > 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, index) {
                      // Parse the date string
                      DateTime date = DateTime.parse(items[index]['date']);

                      // Format the date
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(date);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Unique(
                              objective: items[index]['objectives'],
                              initiative: items[index]['initiative'],
                              outcome: items[index]['outcome'],
                              budget: items[index]['budget'],
                              date: formattedDate,
                              owner: items[index]['owner'],
                              status: items[index]['status'],
                              support: items[index]['support'],
                              email: items[index]['email'],
                              mda: items[index]['mda'],
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 14.0,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4EF),
                          ),
                          child: ListTile(
                            title: Text('${items[index]['initiative']}'),
                            subtitle: Text(formattedDate),
                            trailing: Column(
                              children: [
                                showStatus(items[index]['status']),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 20.0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "No Key Initiative",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
        ],
      ),
    );
  }
}
