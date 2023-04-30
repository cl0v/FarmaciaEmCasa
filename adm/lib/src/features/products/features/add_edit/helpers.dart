extension Strings on String{
  List<String> splitByCommaAndCapitalize() => split(',').map<String>((e) => e.trimLeft().capitalize()).toList();

  String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}

extension ListString on List<String>{
  String joinWithComma() => join(",");
}