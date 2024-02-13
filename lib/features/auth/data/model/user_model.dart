class EmployeeModel {
 final String id;
 final String name;
 final String ? picture;
 final String  email;

  EmployeeModel({ required this.id,required this.name, required this.email, this.picture});

 factory EmployeeModel.fromJson(Map<dynamic, dynamic> map) =>EmployeeModel(
    id: map['userId'],
     name: map['name'] ,
      email: map['email'],
      picture : map['picture'] ?? '');
       
  
  
  toJson() {
    return {
      'userId': id,
      'name': name,
      'email': email,
      'picture': picture??'',
    };
  }
}