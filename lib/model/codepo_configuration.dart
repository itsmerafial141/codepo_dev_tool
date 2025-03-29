import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CodepoConfiguration with EquatableMixin {
  final GlobalKey<NavigatorState>? navigatorKey;

  CodepoConfiguration({
    GlobalKey<NavigatorState>? navigatorKey,
  }) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();

  CodepoConfiguration copyWith({
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return CodepoConfiguration(
      navigatorKey: navigatorKey ?? this.navigatorKey,
    );
  }

  @override
  List<Object?> get props => [navigatorKey];
}
