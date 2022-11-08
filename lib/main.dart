import 'package:flutter/material.dart';
import 'package:untitled/api.dart';
import 'package:untitled/models/model.dart';
import 'package:untitled/models/search_model.dart';
import 'package:untitled/screens/add_intern_screen.dart';
import 'package:untitled/streams.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InternListScreen());
  }
}

class InternListScreen extends StatefulWidget {
  InternListScreen({Key? key}) : super(key: key);

  @override
  State<InternListScreen> createState() => _InternListScreenState();
}

class _InternListScreenState extends State<InternListScreen> {
  final _idController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    apiStream.getStreamData("157");


    super.initState();
  }

  @override
  void dispose() {
    apiStream.dispose();
    _idController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: const Text("Intern Info"),
          alignment: Alignment.topLeft,
          height: 30,
        ),
        actions: [
            // IconButton(
            //   icon: Icon(Icons.add,color: Colors.white,size: 30),
            //     onPressed: () => showDialog<String>(
            //       context: context,
            //       builder: (BuildContext context) => const AlertDialog(
            //         content: TextField(
            //           decoration: InputDecoration(
            //             filled: true,
            //             hintText: "Enter your name",
            //           ),
            //         ),
            //         // actions: <Widget>[
            //         //   TextButton(
            //         //     onPressed: () => Navigator.pop(context, 'Cancel'),
            //         //     child: const Text('Cancel'),
            //         //   ),
            //         //   TextButton(
            //         //     onPressed: () => Navigator.pop(context, 'OK'),
            //         //     child: const Text('OK'),
            //         //   ),
            //         //
            //         // ],
            //       ),
            //     ),
            // ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCustomText()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: TextField(
              controller: _idController,
              // onChanged: (a) {
              //   print(a);
              // },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter your id",
              ),
            ),
          ),
          MaterialButton(
              color: Colors.blue,
              child: const Text("search", style: TextStyle(color: Colors.white)),
              onPressed: () {
                apiStream.getStreamData(_idController.text);
              }),
          const SizedBox(height: 22.0),
          StreamBuilder(
              stream: apiStream.stream,
              builder:
                  (BuildContext context, AsyncSnapshot<SearchModel?> snapshot) {

                if (snapshot.hasData) {
                  // var name = snapshot.data!.result!.name;
                  // var email = snapshot.data!.result!.email;
                  // var mobile = snapshot.data!.result!.mobile;
                  // var desig = snapshot.data!.result!.designation;
                  // var id = snapshot.data!.result!.id!.toString();
                  // if (snapshot.data!.result!.length==0)
                  //   return Center(child: Text("NO DATA AVAILABLE"));

                  // return ListView.builder(
                  //     itemCount: snapshot.data!.result!.length,
                  //     itemBuilder: (context, index) {
                  print(snapshot.data!.result!.name.toString());
                  print(snapshot.data!.result!.email!.toString());
                  print(snapshot.data!.result!.mobile!.toString());
                  print(snapshot.data!.result!.designation!.toString());
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.result!.name.toString()),
                        Text(snapshot.data!.result!.email!.toString()),
                        Text(snapshot.data!.result!.mobile!.toString()),
                        Text(snapshot.data!.result!.designation!.toString()),
                      ],
                    ),
                    leading: Text(snapshot.data!.result!.id!.toString()),
                    // ignore: unnecessary_null_comparison
                    trailing: snapshot.data!.result!.profileImage!.toString() ==
                            null
                        ? const Text("no image")
                        : Image.network(
                            snapshot.data!.result!.profileImage!.toString()),
                  );
                  // });
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  //   print(snapshot.data);
                  return const Center(child: CircularProgressIndicator());
                }

                // StreamBuilderinner
              }) //// itemBuilder
        ],
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchId = [
//     "155",
//   ];
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Future<Widget>(BuildContext context) async {
//     List<String> matchQuery = [];
//     for (var id in searchId) {
//       if (id.contains("155")) {
//         matchQuery.add(id);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, id) {
//         var result = matchQuery[155];
//         return ListTile(
//           title: Text(result),
//
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> match = [];
//     for (var id in searchId) {
//       if (id.toLowerCase().contains(query.toLowerCase())) {
//         match.add(id);
//       }
//     }
//     return ListView.builder(
//       itemCount: match.length,
//       itemBuilder: (context, index) {
//         var result = match[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Column(
//       children: [
//         // TextField(
//         //   controller: _idController,
//         //   onChanged: (a) {
//         //     //print(a);
//         //   },
//         //   keyboardType: TextInputType.number,
//         //   // decoration: InputDecoration(
//         //   //   hintText: "Enter your id",
//         //   // ),
//         // ),
//         FutureBuilder(
//             future: Api().getDataIntern(),
//             builder: (BuildContext context, AsyncSnapshot<Model?> snapshot) {
//               if (snapshot.hasData) {
//                 var img = snapshot.data!.result!.profileImage;
//                 var name = snapshot.data!.result!.name;
//                 var email = snapshot.data!.result!.email;
//                 var mobile = snapshot.data!.result!.mobile;
//                 var desig = snapshot.data!.result!.designation;
//                 var id = snapshot.data!.result!.id!.toString();
//
//                 return ListTile(
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(name!),
//                       Text(email!),
//                       Text(mobile!),
//                       Text(desig!),
//                     ],
//                   ),
//                   leading: Text(id!),
//                   trailing:
//                   img == null ? Text("no image") : Image.network(img),
//                 );
//               } else if (snapshot.hasError) {
//                 return Container(
//                   child: Text(snapshot.error.toString()),
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             }),
//       ],
//     );
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }
// }
