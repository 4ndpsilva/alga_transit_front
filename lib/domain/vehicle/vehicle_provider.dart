import 'package:flutter/foundation.dart';
import 'package:alga_transit_front/domain/vehicle/vehicle.dart';
import 'package:alga_transit_front/domain/vehicle/vehicle_service.dart';

class VehicleProvider with ChangeNotifier{
  final VehicleService _service = VehicleService();
  List<Vehicle> _resultList = [];

  List<Vehicle>  get resultList => _resultList;

  Future<void> getAll() async{
    try{
      _resultList = await _service.getAll();
      notifyListeners();
    }
    catch(e){
      print('Error fetching vehicles: $e');
    }
  }

  Future<void> save(Vehicle vehicle) async{
    try{
      final newVehicle = await _service.save(vehicle);
      _resultList.add(newVehicle);
      notifyListeners();
    }
    catch(e){
      print('Error adding vechicle: $e');
    }
  }

  Future<void> update(Vehicle vehicle) async{ 
    try{
      final updatedVehicle = await _service.update(vehicle);
      final index = _resultList.indexWhere((v) => v.id == updatedVehicle.id);

      if(index != -1){
        _resultList[index] = updatedVehicle;
        notifyListeners();
      }
    }
    catch(e){
      print('Error updating vechicle: $e');
    }
  }

  Future<void> delete(int id) async{
    try{
      await _service.delete(id);
      _resultList.removeWhere((v) => v.id == id);
      notifyListeners();
    }
    catch(e){
      print('Error deleting vechicle: $e');
    }
  }
}