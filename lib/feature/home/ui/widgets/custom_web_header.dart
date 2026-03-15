import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/user_model.dart';
import 'package:investment_fund/core/widget/custom_bank_card.dart';

class CustomWebHeader extends StatelessWidget {
  final UserModel user;
  const CustomWebHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      child: CustomBankCard(user: user),
    );
  }
}
