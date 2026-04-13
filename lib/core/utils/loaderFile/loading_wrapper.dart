import 'package:credify/core/constants/app_keys.dart';
import 'package:credify/core/utils/loaderFile/loading_spinkit.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoaderWrapper extends StatelessWidget {
  final Widget child;
  final bool loading;
  const LoaderWrapper({super.key, required this.child, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: child,
        ),
        LoadingContainer(loading: loading,)
      ],
    );
  }
}


class LoadingContainer extends StatelessWidget {
  final bool loading;
  const LoadingContainer({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    // print(loading);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: loading? Container(
        key: const ValueKey(AppKeys.loaderKey),
        alignment: Alignment.center,
        color: Colors.black.withOpacity(0.6),
        child: Container(
          alignment: Alignment.center,
          height: 50,
            width: 50,
            decoration: BoxDecoration(color: Theme.of(context).cardTheme.color, shape: BoxShape.circle),
            child: LoadingSpinKit()),
      ): const SizedBox(),
    );
  }
}
