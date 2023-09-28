import 'package:flutter/material.dart';
import 'package:pets_app/presentations/pages/pets_page.dart';

class FormData {
  final String name;
  final String email;
  final String password;

  FormData({required this.name, required this.email, required this.password});
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Sign Up Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: Name,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'field is req';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  controller: Email,
                  validator: (text) {
                    if (text == null ||
                        !text.contains('@') ||
                        text.startsWith('@') ||
                        !text.endsWith('.com') ||
                        text.length < 5) {
                      return 'invalid Email';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                  )),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  controller: Password,
                  validator: (pass) {
                    if (pass == null || pass.length < 6) {
                      return 'field is req';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                  )),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => petsPage(
                                      username: Name.text,
                                      email: Email.text,
                                      password: Password.text))
                                      );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
