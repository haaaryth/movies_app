import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie_detail.dart';

class DetailPage extends StatefulWidget {
  final String imdbId;
  DetailPage({required this.imdbId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  MovieDetail? _movie;
  @override
  void initState(){

    super.initState();
    loadData();
  }

  void loadData(){
    fetchMovie().then((movie){
      setState(() {
        _movie = movie;
      });

    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body: _movie == null? Center(child: CircularProgressIndicator())  : Column(
        children: [
          Text(_movie!.title)
        ],
      )
    );


  }
  Future<MovieDetail> fetchMovie() async{
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?i=${widget.imdbId}&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // I'm working with {} -> Call MovieDetail.fromJson method
      return MovieDetail.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie');
    }


}
}

