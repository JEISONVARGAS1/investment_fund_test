class InvestmentRecordsModel {
  final int id;
  final int price;
  final int fundId;
  final bool isSell;
  final DateTime date;
  /// Precio de compra original. Solo aplica cuando [isSell] es true, para calcular ganancia/pérdida.
  final int? purchasePrice;

  InvestmentRecordsModel({
    required this.id,
    required this.date,
    required this.price,
    required this.fundId,
    required this.isSell,
    this.purchasePrice,
  });

  InvestmentRecordsModel copyWith({
    int? id,
    int? fundId,
    bool? isSell,
    int? price,
    DateTime? date,
    int? purchasePrice,
  }) => InvestmentRecordsModel(
    id: id ?? this.id,
    fundId: fundId ?? this.fundId,
    isSell: isSell ?? this.isSell,
    price: price ?? this.price,
    date: date ?? this.date,
    purchasePrice: purchasePrice ?? this.purchasePrice,
  );

  factory InvestmentRecordsModel.fromJson(Map<String, dynamic> json) =>
      InvestmentRecordsModel(
        id: json["id"],
        fundId: json["fundId"],
        isSell: json["isSell"],
        price: json["price"],
        date: DateTime.parse(json["date"]),
        purchasePrice: json["purchasePrice"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fundId": fundId,
    "isSell": isSell,
    "price": price,
    "date": date.toIso8601String(),
    if (purchasePrice != null) "purchasePrice": purchasePrice,
  };
}
