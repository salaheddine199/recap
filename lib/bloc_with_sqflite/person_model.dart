
class PersonModel{

  final String name;
  final int age;
  final  String spec;

  PersonModel({
    required this.name,
    required this.age,
    required this.spec,
});

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    spec: json["spec"],
    name: json["name"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "spec": spec,
    "name": name,
    "age": age,
  };


}