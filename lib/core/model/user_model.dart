import 'package:investment_fund/core/model/investment_record_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String currency;
  final int initialBalance;
  final int availableBalance;
  final List<String> investments;
  final List<InvestmentRecordsModel> investmentRecords;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.currency,
    required this.initialBalance,
    required this.availableBalance,
    required this.investments,
    required this.investmentRecords,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? currency,
    int? initialBalance,
    int? availableBalance,
    List<String>? investments,
    List<InvestmentRecordsModel>? investmentRecords,
  }) => UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    currency: currency ?? this.currency,
    initialBalance: initialBalance ?? this.initialBalance,
    availableBalance: availableBalance ?? this.availableBalance,
    investments: investments ?? this.investments,
    investmentRecords: investmentRecords ?? this.investmentRecords,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    currency: json["currency"],
    initialBalance: json["initialBalance"],
    availableBalance: json["availableBalance"],
    investments: List<String>.from(json["investments"].map((x) => x)),
    investmentRecords: List<InvestmentRecordsModel>.from(
      json["investmentRecords"].map((x) => InvestmentRecordsModel.fromJson(x)),
    ),
  );

  factory UserModel.init() => UserModel(
    id: 0,
    name: '',
    email: '',
    currency: '',
    investments: [],
    initialBalance: 0,
    availableBalance: 0,
    investmentRecords: <InvestmentRecordsModel>[],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "currency": currency,
    "initialBalance": initialBalance,
    "availableBalance": availableBalance,
    "investments": List<dynamic>.from(investments.map((x) => x)),
    "investmentRecords": List<dynamic>.from(
      investmentRecords.map((x) => x.toJson()),
    ),
  };
}
