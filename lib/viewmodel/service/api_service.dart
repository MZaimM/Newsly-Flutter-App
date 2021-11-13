import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsly/model/news.dart';

class ApiService{
  late String _category;
  String _country = "id";
  String _apiKey2 = "2321d66b033643c59f2179c5a077da24";
  String _baseUrl = "https://newsapi.org/v2/";

  List<News> parseNews(String responseBody){
    final parsed = jsonDecode(responseBody);
    final jsonObject = (parsed as Map<String,dynamic>)["articles"];
    return jsonObject.map<News>((json) => News.fromJson(json)).toList();
  }

  // Fetch News General
  Future<List<News>> fetchNewsGeneral(http.Client client) async {
    _category = "general";
    final response = await client.get(
      Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey2')
    );
    return parseNews(response.body);
  }
  Future<List<News>> fetchNewsSport(http.Client client) async {
    _category = "sport";
    final response = await client.get(
      Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey2')
    );
    return parseNews(response.body);
  }
  Future<List<News>> fetchNewsHealth(http.Client client) async {
    _category = "health";
    final response = await client.get(
      Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey2')
    );
    return parseNews(response.body);
  }
  Future<List<News>> fetchNewsBusiness(http.Client client) async {
    _category = "business";
    final response = await client.get(
      Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey2')
    );
    return parseNews(response.body);
  }
  Future<List<News>> fetchNewsTechnology(http.Client client) async {
    _category = "technology";
    final response = await client.get(
      Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey2')
    );
    return parseNews(response.body);
  }

 
}