import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../core/constants/app_color.dart';

class ReuseContainer extends StatelessWidget {
  final Widget child;
  final double radius;

  const ReuseContainer({super.key, required this.child, this.radius = 5.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Theme.of(context).cardTheme.color,
      ),
      child: child,
    );
  }
}

class CustomPinPut extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onComplete;
  final int len;
  final bool readOnly;
  final double height;
  final TextInputType? type;
  final bool autoFocus;

  const CustomPinPut({
    super.key,
    required this.controller,
    required this.onComplete,
    required this.len,
    required this.readOnly,
    required this.height,
    this.type,
    this.autoFocus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      onCompleted: onComplete,
      keyboardType: type ?? TextInputType.number,
      readOnly: readOnly,
      errorTextStyle: TextStyle(color: Colors.red, fontSize: 20),
      length: len,
      autofocus: autoFocus,
      defaultPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary.withOpacity(0.2),
        ),
      ),
      submittedPinTheme: PinTheme(
        textStyle: TextStyle(fontSize: 17, color: Colors.white),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary.withOpacity(0.2),
        ),
      ),
      focusedPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blueGrey, width: 2),
          // color: Theme.of(context).colorScheme.onSurface,
          color: AppColors.primary.withOpacity(0.2),
        ),
      ),
      showCursor: true,
      cursor: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 20,
          height: 2,
          color: AppColors.blueGrey,
          margin: const EdgeInsets.only(bottom: 8.0),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool accent;

  const StatCard({
    required this.label,
    required this.value,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        // color: accent ? AppColors.moss : AppColors.panel,
        borderRadius: BorderRadius.circular(14),
        // border: Border.all(color: accent ? AppColors.moss : AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w600,
              // color: accent ? const Color(0xFFD7E3D3) : AppColors.muted
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // color: accent ? Colors.white : AppColors.ink
            ),
          ),
        ],
      ),
    );
  }
}






class _ProductCard extends StatelessWidget {
  // final Product product;
  const _ProductCard();

  @override
  Widget build(BuildContext context) {
    // final data = context.watch<AppData>();
    // final inCart = data.cart[product.id] ?? 0;
    // final disabled = product.isOutOfStock;

    return Opacity(
      opacity: 0.3,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        // onTap: disabled ? null : () => context.read<AppData>().addToCart(product.id),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // color: AppColors.panel,
            borderRadius: BorderRadius.circular(14),
            // border: Border.all(color: AppColors.line),
          ),
          child: Stack(
            children: [
              // if (inCart > 0)
              //   Positioned(
              //     top: 0,
              //     right: 0,
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              //       decoration: BoxDecoration( borderRadius: BorderRadius.circular(12)),
              //       child: Text('$inCart', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              //     ),
              //   ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(product.emoji, style: const TextStyle(fontSize: 26)),
                  // const SizedBox(height: 8),
                  // Text(product.name,
                  //     maxLines: 2,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.25)),
                  // const SizedBox(height: 6),
                  // Text(data.formatMoney(product.price),
                  //     style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600,)),
                  // const SizedBox(height: 2),
                  // Text(disabled ? 'Out of stock' : '${product.stock} in stock',
                  //     style: const TextStyle(fontSize: 10,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _ListCard extends StatelessWidget {
  final Widget child;
  const _ListCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.lightGrey),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
