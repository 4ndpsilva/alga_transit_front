import 'package:flutter/foundation.dart';
import 'owner.dart';
import 'owner_service.dart';

class OwnerProvider with ChangeNotifier{
  final OwnerService _service = OwnerService();
  List<Owner> _resultList = [];

  List<Owner> get resultList => _resultList;

  Future<void> getAll() async{
    try{
      _resultList = await _service.getAll();
      notifyListeners();
    }
    catch(e){
      print('Error fetching owners: $e');
    }
  }

  Future<void> save(Owner owner) async{
    try{
      final newOwner = await _service.save(owner);
      _resultList.add(newOwner);
      notifyListeners();
    }
    catch(e){
      print('Error adding owner: $e');
    }
  }

  Future<void> update(Owner owner) async{
    try{
      final updatedOwner = await _service.update(owner);
      final index = _resultList.indexWhere((o) => o.id == updatedOwner.id);

      if(index != -1){
        _resultList[index] = updatedOwner;
        notifyListeners();
      }
    }
    catch(e){
      print('Error updating owner: $e');
    }
  }

  Future<void> delete(int id) async{
    try{
      await _service.delete(id);
      _resultList.removeWhere((owner) => owner.id == id);
      notifyListeners();
    }
    catch(e){
      print('Error deleting owner: $e');
    }
  }
}