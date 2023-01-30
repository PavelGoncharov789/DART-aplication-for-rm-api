import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/CCdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CClist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CClistState();
  }
}

class CClistState extends State<CClist> {
  List<CCData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Awesome CC tracker')),
      body: Container(
          child: ListView(
        children: _buildList(),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _loadCC(),
      ),
    );
  }

  _loadCC() async {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/?page=1'));
    if (response.statusCode == 200) {
      var allData = (json.decode(response.body) as Map<String, dynamic>)['results']  ;
      // print("allData");
      // log('$allData');
      debugPrint(
          'movieTitle: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
     List<CCData> CCDataList = [];
      allData.forEach((dynamic val) {
        log('$val');
        var record = CCData(
            name: val['name'],
            status: val['status'],
            species: val['species'],
            gender: val['gender']);
        CCDataList.add(record);
      });

      setState(() {
        data = CCDataList;
      });
       log('CCDataList: $CCDataList');
    }
  }

  List<Widget> _buildList() {
    return data
        .map((CCData f) => ListTile(
              title: Text(f.name),
              subtitle: Text(f.species),
              // leading: CircleAvatar(child: Text(f.rank.toString())),
              leading: Text(f.gender),
              trailing: Text(f.status),
            ))
        .toList();
  }
}
