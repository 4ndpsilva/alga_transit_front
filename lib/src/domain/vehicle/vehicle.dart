class Vehicle {
  int id = 0;
  _OwnerResponse owner = _OwnerResponse.fromJson(Map.of({}));
  String brand = '';
  String model = '';
  String plate = '';
  String status = '';
  String registrationDate = '';
  String? dateOfSeizure;

  Vehicle({
    required this.id,
    required this.owner,
    required this.brand,
    required this.model,
    required this.plate,
    required this.status,
    required this.registrationDate
  });

  factory Vehicle.fromJson(Map<String, dynamic> json){
    var owner = _OwnerResponse(id: json['owner']['id'], name: json['owner']['name']);

    return Vehicle(
      id: json['id'],
      owner: owner,
      brand: json['brand'],
      model: json['model'],
      plate: json['plate'],
      status: json['status'],
      registrationDate: json['registrationDate']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'ownerId': owner.id,
      'brand': brand,
      'model': model,
      'plate': plate
    };
  }
}

class _OwnerResponse{
  int id;
  String name;

  _OwnerResponse({required this.id, required this.name});

  factory _OwnerResponse.fromJson(Map<String, dynamic> json){
    return _OwnerResponse(id: json['id'] ?? 0, name: json['name'] ?? '');
  }
}