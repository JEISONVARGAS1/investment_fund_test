import 'package:flutter/material.dart';
import 'package:investment_fund/core/widget/custom_bank_card.dart';

class CustomWebHeader extends StatelessWidget {
  const CustomWebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      child: CustomBankCard(number: '8,900.16'),
    );
  }
}
