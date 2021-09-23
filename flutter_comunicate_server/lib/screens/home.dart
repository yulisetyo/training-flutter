// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Students.dart';
import '../Environment.dart';
import 'details.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*flutter menampilkan data dari web api harus menggunakan
    widget Future
  */
  Future<List<Students>>? students;
  final studentKeyList = GlobalKey<_HomeState>();

  @override
  void initState() {
    /* semua perintah didalam initState pasti dijalankan */
    super.initState();
    students = getStudentList();
  }

  Future<List<Students>>? getStudentList() async {
    final url = '${Environment.URL_PREFIX}/list.php'; // mengirimkan request
    final response = await http.get(
      // mendapatkan response
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ); // keluaran dalam bentuk json
    // konversi dari json menjadi maps / list
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    // hasil konversi diubah bentuknya menjadi Maps / List
    List<Students> students = items.map<Students>((json) {
      return Students.fromJson(json);
    }).toList();
    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentKeyList,
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Center(
        child: FutureBuilder<List<Students>>(
          future: students, // nilai konversi dari json ke List
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            student: data,
                          )
                        )
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}