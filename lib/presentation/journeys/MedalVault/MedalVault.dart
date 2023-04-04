import 'package:flutter/material.dart';

class MedalVault extends StatefulWidget {
  const MedalVault({Key? key}) : super(key: key);

  @override
  State<MedalVault> createState() => _MedalVaultState();
}

class _MedalVaultState extends State<MedalVault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
