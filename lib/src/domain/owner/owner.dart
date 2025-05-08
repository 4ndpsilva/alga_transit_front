class Owner{
  int id = 0;
  String name = '';
  String email = '';
  String phone = '';

  Owner({
    required this.id,
    required this.name,
    required this.email,
    required this.phone
  });

  factory Owner.fromJson(Map<String, dynamic> json){
    return Owner(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone
    };
  }
}