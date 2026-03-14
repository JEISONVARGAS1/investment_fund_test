// Constants for the app
import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';

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
