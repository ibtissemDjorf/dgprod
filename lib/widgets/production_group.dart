import 'package:flutter/material.dart';
import 'package:dgprod/core/res/color.dart';

class ProductionGroupContainer extends StatelessWidget {
  final MaterialColor color;
  final bool? isSmall;
  final IconData icon;
  final String prodGroup;
  
  final num prodCount;
  const ProductionGroupContainer({
    Key? key,
    required this.color,
    this.isSmall = false,
    required this.icon,
    required this.prodGroup,
    required this.prodCount,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color[400],
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(2, 6),
          )
        ],
        gradient: AppColors.getDarkLinearGradient(color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: isSmall! ? Alignment.centerLeft : Alignment.center,
            child: Icon(
              icon,
              size: isSmall! ? 60 : 120,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            prodGroup,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$prodCount prod",
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
