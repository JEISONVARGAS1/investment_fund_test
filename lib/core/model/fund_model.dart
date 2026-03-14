import 'package:flutter/material.dart';
import 'package:investment_fund/core/util/handled_positivity_make_money.dart';

class FundModel {
  final int id;
  final String name;
  final String type;
  final String currency;
  final int minInvestment;
  final IconData iconData;
  final String profitProbability;

  FundModel({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    required this.minInvestment,
    required this.iconData,
    required this.profitProbability,
  });

  FundModel copyWith({
    int? id,
    String? name,
    String? type,
    String? currency,
    IconData? iconData,
    int? minInvestment,
    String? profitProbability,
  }) => FundModel(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    currency: currency ?? this.currency,
    minInvestment: minInvestment ?? this.minInvestment,
    iconData: iconData ?? this.iconData,
    profitProbability: profitProbability ?? this.profitProbability,
  );

  static IconData _iconFromString(String? name) {
    switch (name) {
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'oil_barrel':
        return Icons.oil_barrel;
      case 'request_quote':
        return Icons.request_quote;
      case 'trending_up':
        return Icons.trending_up;
      case 'insights':
        return Icons.insights;
      default:
        return Icons.pie_chart_outline;
    }
  }

  factory FundModel.fromJson(Map<String, dynamic> json) => FundModel(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    currency: json["currency"],
    minInvestment: json["minInvestment"],
    iconData: _iconFromString(json["iconData"]?.toString()),
    profitProbability: json["profitProbability"]?.toString() ?? '',
  );

  factory FundModel.init() => FundModel(
    id: 0,
    name: '',
    type: '',
    currency: '',
    iconData: Icons.pie_chart_outline,
    minInvestment: 0,
    profitProbability: handledPositivityMakeMoney(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "currency": currency,
    "minInvestment": minInvestment,
    "iconData": iconData.codePoint,
    "profitProbability": profitProbability,
  };
}
