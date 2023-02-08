class DoctorProviderModel{
  final String name;
  final String description;
  final double fees;
  final String pic;
  final String location;
  final String qualification;
  final String uid;
  // final List<String> time;
  // Map<String , dynamic> workingDays{},

  DoctorProviderModel({
    required this.name,
    required this.description,
    required this.fees,
    required this.pic,
    required this.location,
    required this.qualification,
    required this.uid,

    // required this.time,
    // required this.workingDays,

  });

  Map<String, dynamic> toMap()
  {
    return {
      'name': name,
      'description': description,
      'fees': fees,
      'pic': pic,
      'location': location,
      'qualification': qualification,
      'uid':uid,
    };
  }
  factory DoctorProviderModel.fromMap(Map<String,dynamic> map){
    return DoctorProviderModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      fees: map['fees'] ?? 0,
      pic: map['pic'] ?? '',
      location: map['location'] ?? '',
      qualification: map['qualification'] ?? '',
    );
  }
}