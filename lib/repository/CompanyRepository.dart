

import 'dart:convert';

import 'package:flutter_app/repository/model/CompanyResponse.dart';
import 'package:flutter_app/repository/model/PostsResponse.dart';
import 'package:http/http.dart' as http;
class CompanyRepository{
  Future<CompanyResponse> getCompanyDetails() async{
    final url = "https://clouce.com/companies.json";
    final response = await http.get(url);
      if (response.statusCode == 200) {
        CompanyResponse companyResponse = CompanyResponse.fromJson(jsonDecode(response.body));
      return companyResponse;
      }else{
        throw Exception("unable to connect");
      }
  }

  //JSON ARRAY Sample
  Future<List<PostsResponse>> getPostsList() async{
    final url ="https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(url);
    if(response.statusCode == 200){
      Iterable l= jsonDecode(response.body);
      List<PostsResponse> posts = List<PostsResponse>.from(l.map((model)=> PostsResponse.fromJson(model)));
      return posts;
    }else{
      throw Exception("unable to connect");
    }
  }
}