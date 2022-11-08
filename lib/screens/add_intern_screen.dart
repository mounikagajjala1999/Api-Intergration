import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/post_api.dart';

import '../models/search_model.dart';


// Define a custom Form widget.
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


  @override
  void dispose() {
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }
  // Future<void> _callApi() async {
  //   SearchModel? data= await apiPost.postData(myController, myController1, myController2, myController3);
  //   var postdes=data?.result!.designation;
  //   var postname=data?.result!.name;
  //   var postemail=data?.result!.email;
  //   var postmobile=data?.result!.mobile;
  //   print(postdes);
  //   print(postname);
  //   print(postemail);
  //   print(postmobile);
  //
  // }


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
              padding: EdgeInsets.only(top:30),
              height: 600,
              width: 300,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children:[
                        Padding(
                          padding: EdgeInsets.only(bottom:15),
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
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom:15),
                          child:TextFormField(
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
                                return 'Please enter some number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom:15),
                          child:TextFormField(
                            controller: myController2,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "designation",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom:15),
                          child: TextFormField(
                            controller: myController3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Email id",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                  FloatingActionButton.extended(



                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        apiPost.postData(myController.text, myController1.text, myController2.text, myController3.text);
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Intern Successfully Added'),
                            content: Text(myController.text+" Successfully Added"),
                            actions: <Widget>[
                              // TextButton(
                              //   onPressed: () => Navigator.pop(context, 'Cancel'),
                              //   child: const Text('Cancel'),
                              // ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MyApp()),
                                  );
                                },

                                // Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );



                        // showSnackBar(
                        //     const SnackBar(content:
                        //
                        //     Text('Processing Data')),);

                      }
                      //   showDialog<String>(
                      //   context: context,
                      //   builder: (BuildContext context) => AlertDialog(
                      //     title: const Text('Intern Successfully Added'),
                      //     content: Text(myController.text+" Successfully Added"),
                      //     actions: <Widget>[
                      //       // TextButton(
                      //       //   onPressed: () => Navigator.pop(context, 'Cancel'),
                      //       //   child: const Text('Cancel'),
                      //       // ),
                      //       TextButton(
                      //         onPressed: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(builder: (context) => const MyApp()),
                      //           );
                      //         },
                      //
                      //             // Navigator.pop(context, 'OK'),
                      //         child: const Text('OK'),
                      //       ),
                      //     ],
                      //   ),
                      // );
                      // snapshot.data!.result!.name.toString();
                      // myController.text;
                      // myController1.text;
                      // myController2.text;
                      // myController3.text;



                      // print(myController.text);
                      // print(myController1.text);
                      // print(myController2.text);
                      // print(myController3.text);


                    },

                    label: const Text("Save",style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    // Fill this out in the next step.
  }


// class SecondRoute extends StatelessWidget {
//   const SecondRoute({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Second Route'),
  //     ),
  //     body: Center(
  //       child: GestureDetector(
  //         onTap: () {
  //           Navigator.pop(context);
  //         },
  //         child: Container(
  //           height: 400,
  //           width: 300,
  //           child: Column(
  //             children: [
  //               Column(
  //                 children: const [
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom:15),
  //                     child: TextField(
  //
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         filled: true,
  //                         fillColor: Colors.white,
  //                         hintText: "Name",
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom:15),
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         filled: true,
  //                         fillColor: Colors.white,
  //                         hintText: "Mobile no.",
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom:15),
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         filled: true,
  //                         fillColor: Colors.white,
  //                         hintText: "designation",
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom:15),
  //                     child: TextField(
  //
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         filled: true,
  //                         fillColor: Colors.white,
  //                         hintText: "Email id",
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(20.0),
  //                 child: Container(
  //                   child: FloatingActionButton.extended(
  //                     onPressed: () {},
  //                     label: Text("Save",style: TextStyle(fontSize: 16)),
  //                   ),
  //
  //                   // MaterialButton(
  //                   //     color: Colors.blue,
  //                   //     child: const Text("Save",
  //                   //         style: TextStyle(color: Colors.white, fontSize: 20)),
  //                   //
  //                   //     onPressed: () {}),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
// }


