import 'package:equatable/equatable.dart';

/// Definition of http error data holder.
class CodepoHttpError with EquatableMixin {
  CodepoHttpError({
    this.error,
    this.stackTrace,
  });

  final dynamic error;
  final StackTrace? stackTrace;

  CodepoHttpError copyWith({
    dynamic error,
    StackTrace? stackTrace,
  }) {
    return CodepoHttpError(
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }

  @override
  List<Object?> get props => [error, stackTrace];
}
