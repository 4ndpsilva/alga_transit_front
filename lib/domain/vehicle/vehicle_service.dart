import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alga_transit_front/domain/vehicle/vehicle.dart';

class VehicleService{
  final String baseURL = 'http://localhost:8080/api/v1';
  final String context = 'vehicles';
  final int STATUS_OK = 200;

  Future<List<Vehicle>> getAll() async{
    final response = await http.get(Uri.parse('$baseURL/$context'));

    
    if(response.statusCode == STATUS_OK){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((v) => Vehicle.fromJson(v)).toList();
    }

    throw Exception('Failed to load vehicles');
  }

  Future<Vehicle> save(Vehicle vehicle) async{
    final response = await http.post(
      Uri.parse('$baseURL/$context'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vehicle.toJson())
    );

    if(response.statusCode == 201){
      return Vehicle.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to save vehicles');
  }

  Future<Vehicle> update(Vehicle vehicle) async{
    final response = await http.put(
      Uri.parse('$baseURL/$context/${vehicle.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vehicle)
    );

    if(response.statusCode == STATUS_OK){
      return Vehicle.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to update vehicles');
  }

  Future<void> delete(int id) async{
    final response = await http.delete(Uri.parse('$baseURL/$context/$id'));

    if(response.statusCode != 204){
      throw Exception('Failed to detele vehicles');
    }
  }
}