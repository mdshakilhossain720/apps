import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/model/post_model.dart';
import 'package:http/http.dart' as http;

class HomeApi extends StatefulWidget {
  const HomeApi({super.key});

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {

  List<PostModel> postModel=[];
  Future<List<PostModel>> getPostApi() async {
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(dynamic i in data){
        postModel.add(PostModel.fromJson(i));

      }
      return postModel;
    }else{
      return postModel;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ApI Course"),),
      
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPostApi(), builder: (context,snapshot){
              if(snapshot.hasData){
                return Text("Loading");
              }else{
                return ListView.builder(
                  itemCount: postModel.length,
                    itemBuilder:(context,index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(postModel[index].id.toString()),
                          Text(postModel[index].title.toString()),
                          Text(postModel[index].body.toString()),


                        ],
                      ),
                    ),
                  );
                });
              }
            
            }),
          )
          
        ],
      ),
    );
  }
}
