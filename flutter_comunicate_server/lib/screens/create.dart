// ignore_for_file: unused_import, file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../Environment.dart';
import '../forms/AppForm.dart';
import 'package:http/http.dart' as http;

class Create extends StatefulWidget {
  final Function? refreshStudentList;

  Create({this.refreshStudentList});

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formkey = GlobalKey<FormState>();
  //props
  TextEditingController? nameController = TextEditingController();
  TextEditingController? ageController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekam Baru'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            //perintah untuk create
            if (formkey.currentState!.validate()) {
              onCreate(context);
            }
          },
          child: Text(
            'Create',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: AppForm(
              formKey: formkey,
              nameController: nameController,
              ageController: ageController,
              emailController: emailController,
              phoneController: phoneController,
            ),
          ),
        ),
      ),
    );
  }

  void onCreate(BuildContext context) async {
    await createStudent();
    //redirect
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  Future createStudent() async {
    final url = '${Environment.URL_PREFIX}/create.php';
    return await http.post(Uri.parse(url), body: {
      "name": nameController!.text,
      "age": ageController!.text,
      "email": emailController!.text,
      "phone": phoneController!.text
    });
  }
}