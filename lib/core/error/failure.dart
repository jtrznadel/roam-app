import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError({String? message, int? statusCode}) =
      ServerError;

  const factory Failure.connectionError({String? message}) = ConnectionError;

  const factory Failure.offlineError() = OfflineError;

  const factory Failure.authenticationError({
    String? message,
    int? statusCode,
  }) = AuthenticationError;

  const factory Failure.cancelError() = CancelError;

  const factory Failure.validationError({String? message, int? statusCode}) =
      ValidationError;

  const factory Failure.generalError({String? message, int? statusCode}) =
      GeneralError;
}
