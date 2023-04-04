import '../../models/university.dart';

// get a list of all Universities
Future<List<University>> getUniversities() async {
  await Future.delayed(const Duration(seconds: 0));

  return <University>[
    University(
        universityId: 1, name: "Chulalongkorn University", country: "Thailand"),
    University(
        universityId: 2, name: "Thammasat University", country: "Thailand"),
    University(universityId: 3, name: "Rangsit University", country: "Thailand")
  ];
}
