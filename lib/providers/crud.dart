
import 'dart:convert';
import 'package:examenam/models/posts.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

class CrudRepo{

      Future<List<dynamic>> getPosts() async{

       final response = await http.get(Uri.parse('https://app-parcial2.herokuapp.com/postslistar'));

       final decode = json.decode(response.body);
      print(response);
      
       return  decode['posts'];
        
      }


      deletepost(id) async{
            final res = await http.delete(Uri.parse('https://app-parcial2.herokuapp.com/posts/$id'));


            print(res);
      }
      
    Future<bool> crearpost(titulo,descripcion) async{
    final url = Uri.parse('https://app-parcial2.herokuapp.com/posts');
    Map data = {
        'titulo':titulo,'descripcion':descripcion,
    };

       Map<String,String> heade ={
         "content-type" : "application/json",
         "accept" : "application/json",
     };
    
    print(data);
    final response =await http.post(url ,headers:heade , body: jsonEncode(data));

    final decode= jsonDecode(response.body);
     
    if(response.statusCode == 200||response.statusCode == 304){
     print(decode);
       return true;
    }else{

    return false;
    }
    
  }

   Future<bool> update(titulo,descripcion,id) async{
    final url = Uri.parse('https://app-parcial2.herokuapp.com/posts/$id');
    Map data = {
       'titulo':titulo,'descripcion':descripcion,'idpost':id
    };

       Map<String,String> heade ={
         "content-type" : "application/json",
         "accept" : "application/json",
     };
    
    print(data);
    final response =await http.put(url ,headers:heade , body: jsonEncode(data));

    final decode= jsonDecode(response.body);
     
    if(response.statusCode == 200||response.statusCode == 304){
     print(decode);
       return true;
    }else{

    return false;
    }   

  }

}

