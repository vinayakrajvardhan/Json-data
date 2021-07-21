import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' as rootBundle;

import 'product_data_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            'Json Data',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<PostModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          items[index].firstName,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].lastName,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].address,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].gender,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].state,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].dateOfBirth,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].pincode,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[index].country,
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<List<PostModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/filejson.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => PostModel.fromJson(e)).toList();
  }
}
