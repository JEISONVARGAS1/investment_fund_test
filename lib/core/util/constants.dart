// Constants for the app
import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/util/money_format.dart';

double get mobile => 600;
double get tablet => 900;
double get desktop => 900;
double get maxContentWidth => 1200;

/// images
String get metricImage => 'assets/image/metric.png';

// fund constants database
List<FundModel> get fundTypes => [
  FundModel.init().copyWith(
    id: 1,
    type: "FPV",
    currency: "COP",
    minInvestment: 75000,
    profitProbability: "0.65",
    iconData: Icons.account_balance_wallet,
    name: "FPV_BTG_PACTUAL_RECAUDADORA",
  ),
  FundModel.init().copyWith(
    id: 2,
    type: "FPV",
    currency: "COP",
    minInvestment: 125000,
    iconData: Icons.oil_barrel,
    profitProbability: "0.72",
    name: "FPV_BTG_PACTUAL_ECOPETROL",
  ),
  FundModel.init().copyWith(
    id: 3,
    type: "FIC",
    currency: "COP",
    name: "DEUDAPRIVADA",
    minInvestment: 50000,
    iconData: Icons.request_quote,
    profitProbability: "0.58",
  ),

  FundModel.init().copyWith(
    id: 4,
    name: "FDO-ACCIONES",
    type: "FIC",
    currency: "COP",
    minInvestment: 250000,
    iconData: Icons.trending_up,
    profitProbability: "0.75",
  ),
  FundModel.init().copyWith(
    id: 5,
    type: "FPV",
    currency: "COP",
    minInvestment: 100000,
    iconData: Icons.insights,
    profitProbability: "0.68",
    name: "FPV_BTG_PACTUAL_DINAMICA",
  ),
];

// alerts messages
String get insufficientFundsTitle => 'Saldo insuficiente';
String get insufficientFundsMessage =>
    'Tu saldo disponible es menor que la inversión mínima requerida para este fondo.';

String get lossesTitle => 'Pérdidas';
String lossesMessage(double amount, double newAmount) =>
    'Has vendido esta inversión con una desvalorización\n Compraste por ${moneyFormat(amount)} y vendiste por ${moneyFormat(newAmount)}.';

String get successToSellTitle => 'Venta exitosa';
String successToSellMessage(double amount, double newAmount) =>
    'Has vendido esta inversión con una valorización\n Compraste por ${moneyFormat(amount)} y vendiste por ${moneyFormat(newAmount)}.';
