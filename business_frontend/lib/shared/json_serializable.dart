abstract class JsonSerializable {
  static dynamic toClass(Map<String, dynamic> json) {
    // TODO: implement toClass
    throw UnimplementedError("Subclass function not implemented");
  }

  String toJson();
}