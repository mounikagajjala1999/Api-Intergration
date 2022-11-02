import 'package:flutter/material.dart';
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
              height: 400,
              width: 300,
              child: Column(
                children: [
                  Column(
                    children:  [
                      Padding(
                        padding: const EdgeInsets.only(bottom:15),
                        child: TextField(
                          controller: myController,

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Name",
                          ),
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(bottom:15),
                        child: TextField(
                          controller: myController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Mobile no.",
                          ),
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(bottom:15),
                        child: TextField(
                          controller: myController2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "designation",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom:15),
                        child: TextField(
                          controller: myController3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email id",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: FloatingActionButton.extended(


                        onPressed: () {
                          // snapshot.data!.result!.name.toString();
                          // myController.text;
                          // myController1.text;
                          // myController2.text;
                          // myController3.text;
                          apiPost.postData(myController.text, myController1.text, myController2.text, myController3.text);


                          // print(myController.text);
                          // print(myController1.text);
                          // print(myController2.text);
                          // print(myController3.text);


                        },

                        label: const Text("Save",style: TextStyle(fontSize: 16)),
                      ),

                      // MaterialButton(
                      //     color: Colors.blue,
                      //     child: const Text("Save",
                      //         style: TextStyle(color: Colors.white, fontSize: 20)),
                      //
                      //     onPressed: () {}),
                    ),
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


