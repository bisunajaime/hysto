import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLayer extends StatelessWidget {
  final Widget child;
  final List<BlocProvider> providers;
  const BlocLayer({Key? key, required this.child, required this.providers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: child,
    );
  }
}
