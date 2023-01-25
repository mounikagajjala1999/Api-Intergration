import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/post_api.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import '../models/search_model.dart';

class MyCustomText extends StatefulWidget {
  const MyCustomText({super.key});

  @override
  State<MyCustomText> createState() => _MyCustomTextState();
}

class _MyCustomTextState extends State<MyCustomText> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(top: 30),
            height: 600,
            width: 300,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: myController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Name",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: myController1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Mobile no.",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: myController2,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "designation",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your designation';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          controller: myController3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email id",
                          ),
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    if (loading == true) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                          title: Text("Please Wait...."),
                          actions: <Widget>[
                            const CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }
                    // else {
                    //   loading = false;
                    // }

                    if (_formKey.currentState!.validate()) {
                      SearchModel? data = await apiPost.postData(
                          myController.text,
                          myController1.text,
                          myController2.text,
                          myController3.text);


                      if (data!.code == 1) {
                        setState(() {
                          loading = false;
                        });

                        // if (loading == false) {
                        //   Navigator.pop;
                        // }
                        var id = data!.result!.id!.toString();

                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Intern Successfully Added'),
                            content: ListTile(
                              title: Container(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data!.result!.name.toString()),
                                    Text(data!.result!.email!.toString()),
                                    Text(data!.result!.mobile!.toString()),
                                    Text(data!.result!.designation!.toString()),
                                  ],
                                ),
                              ),
                              leading: Text(id),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyApp()),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else if (data!.code == 0) {
                        Text(data!.message.toString());
                      } else {
                        const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                  label: const Text("Save", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
