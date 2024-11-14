import 'package:flutter/material.dart';

import '../../../constants/sizes/app_sizes.dart';
import '../../../constants/theme/app_colors.dart';
import '../../domain/company.dart';
import 'custom_gesture_detector.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return CustomOnTapGestureDetector(
      onTap: () {
        debugPrint('aaa');
      },
      child: Card(
        elevation: Sizes.p4,
        color: AppColors.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.p8))),
        child: Padding(
          padding: const EdgeInsets.only(
              left: Sizes.p32,
              top: Sizes.p24,
              bottom: Sizes.p24,
              right: Sizes.p8),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/icons/company.png'),
                    color: Colors.white,
                  ),
                  gapW16,
                  Text(
                    company.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.p18,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
