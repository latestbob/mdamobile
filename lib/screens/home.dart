import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mda/screens/details.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic> summary = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://office.laurenparkerway.com/api/completionrate'));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        setState(() {
          summary = json.decode(response.body);
        });

        print(summary);
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
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Image(
                    image: NetworkImage(
                      'https://res.cloudinary.com/edifice-solutions/image/upload/v1706216565/edo_2_h0ozyo.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Welcome your Excellency",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 2.0,
            color: Colors.grey[300],
          ),

          SizedBox(
            height: 30.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
            ),
            child: Text(
              "Edo State Health MDAs",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(
                      full: 'State Ministry of Health',
                      short: 'EDSMoH',
                      rate: '${summary['smoh_completion_rate']}',
                      total: '${summary['total_smoh']}',
                    );
                  }));
                },
                child: Container(
                  width: 180.0,
                  height: 210.0,
                  decoration: BoxDecoration(
                    color: Color(
                      0xFFE3F2E5,
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'EDSMoH',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Completion Rate',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${summary['smoh_completion_rate']}%',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(
                      full: 'Edo State Hospitals Management Agency',
                      short: 'HMA',
                      rate: '${summary['hma_completion_rate']}',
                      total: '${summary['total_hma']}',
                    );
                  }));
                },
                child: Container(
                  width: 180.0,
                  height: 210.0,
                  decoration: BoxDecoration(
                    color: Color(
                      0xFFE3F2E5,
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'HMA',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Completion Rate',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${summary['hma_completion_rate']}%',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //////////////////
          ///
          ///
          ///
          SizedBox(
            height: 30.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(
                      full: 'Edo State Health Insurance Commission',
                      short: 'EDHIC',
                      rate: '${summary['edihic_completion_rate']}',
                      total: '${summary['total_edihic']}',
                    );
                  }));
                },
                child: Container(
                  width: 180.0,
                  height: 210.0,
                  decoration: BoxDecoration(
                    color: Color(
                      0xFFE3F2E5,
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'EDHIC',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Completion Rate',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${summary['edihic_completion_rate']}%',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(
                      full: 'Edo State Primary Health Care Development Agency',
                      short: 'EDSPHCDA',
                      rate: '${summary['phc_completion_rate']}',
                      total: '${summary['total_phc']}',
                    );
                  }));
                },
                child: Container(
                  width: 180.0,
                  height: 210.0,
                  decoration: BoxDecoration(
                    color: Color(
                      0xFFE3F2E5,
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'EDSPHCDA',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Completion Rate',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${summary['phc_completion_rate']}%',
                        style: TextStyle(
                          color: Color(0xFF285E2A),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15.0,
          ),

          Divider(
            thickness: 1.2,
            color: Color.fromARGB(255, 241, 241, 241),
          ),

          GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg:
                      "Completion rate measures the number of initiatives that had been completed within the portifolio",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(
                    0xFFE3F2E5,
                  ),
                  textColor: Color(0xFF285E2A),
                  fontSize: 14.0);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.info,
                  size: 35.0,
                  color: Color.fromARGB(255, 189, 195, 192),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
