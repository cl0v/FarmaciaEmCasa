class DrugEntity {
  final String name;
  final double price;
  late final List<String> usage;
  final String description;

  DrugEntity(this.name, this.price, String usage, this.description) {
    this.usage = usage.split(',');
  }

  factory DrugEntity.usageList(
    String name,
    double value,
    List<String> usage,
    String description,
  ) {
    return DrugEntity(name, value, usage.join(','), description);
  }

  String get usageString => usage.join(',');
}
