import 'dart:convert';
import 'package:http/http.dart' as http;
import 'owner.dart';

class OwnerService{
  final String baseURL = 'http://localhost:8080/api/v1';
  final String context = 'owners';
  final int STATUS_OK = 200;

  Future<List<Owner>> getAll() async{
    final response = await http.get(Uri.parse('$baseURL/$context'));

    if(response.statusCode == STATUS_OK){
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((owner) => Owner.fromJson(owner)).toList();
    }

    throw Exception('Failed to load owners');
  }

  Future<Owner> save(Owner owner) async{
    final response = await http.post(
      Uri.parse('$baseURL/$context'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(owner.toJson())
    );

    if(response.statusCode == 201){
      return Owner.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to save owners');
  }

  Future<Owner> update(Owner owner) async{
    final response = await http.put(
      Uri.parse('$baseURL/$context/${owner.id}'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(owner.toJson())
    );

    if(response.statusCode == STATUS_OK){
      return Owner.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to update owners');
  }

  Future<void> delete(int id) async{
    final response = await http.delete(Uri.parse('$baseURL/$context/$id'));

    if(response.statusCode != 204){
      throw Exception('Failed to delete owners');
    }
  }
}