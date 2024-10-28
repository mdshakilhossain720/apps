
import 'dart:convert';

import 'package:apibaseproject/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> userModel=[];

  Future<List<UserModel>> getUserApi() async {
    final response =await get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(dynamic i in data){
        userModel.add(UserModel.fromJson(i));

      }

      return userModel;
    }else{
      return userModel;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User"),),
      body: Column(
        children: [
          FutureBuilder(future: getUserApi(), builder: (context,AsyncSnapshot<List<UserModel>>  indeex){
            return ListView.builder(
              itemCount: userModel.length,
                itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: [
                    ResuabelRow(title:'Name' , value:userModel[index].name.toString()),
                    ResuabelRow(title:'Name' , value:userModel[index].email.toString()),
                    ResuabelRow(title:'Name' , value:userModel[index].address!.city.toString()),
                    ResuabelRow(title:'Name' , value:userModel[index].phone.toString()),
                    ResuabelRow(title:'Name' , value:userModel[index].company!.bs.toString()),

                  ],
                ),
              );
            });
          })


        ],
      ),
    );
  }
}

class ResuabelRow extends StatelessWidget {
  const ResuabelRow({super.key, required this.title, required this.value});
  final String title,value;

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [

        Text(title),
        Text(value)

      ],
    );
  }
}

