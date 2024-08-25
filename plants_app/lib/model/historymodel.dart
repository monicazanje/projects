class Historymodel {
  final String? name;
  final bool? status;
  final String? image;
  final String? amount;
  
  Historymodel(
      {
      required this.name,
      required this.status,
      required this.amount,
      required this.image,
    });
}

List<Historymodel> historyData = [];