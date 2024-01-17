class UserModel {
  final int? u_id;
  final String name;
  final int age;
  final int weight;
  final int height;
  final String sex;
  final String career;
  final String accident;

  UserModel({
    required this.u_id,
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.sex,
    required this.career,
    required this.accident,
  });

  // A Dog.fromJson() constructor, for constructing a new Dog instance from a map structure.
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        u_id: json['u_id'],
        name: json['name'],
        age: json['age'],
        weight: json['weight'],
        height: json['height'],
        sex: json['sex'],
        career: json['career'],
        accident: json['accident'],
      );

  // A toJson() method, which converts a Dog instance into a map.
  Map<String, dynamic> toJson() => {
        'u_id': u_id,
        'name': name,
        'age': age,
        'weight': weight,
        'height': height,
        'sex': sex,
        'career': career,
        'accident': accident,
      };
}
