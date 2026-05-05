// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerError value)?  serverError,TResult Function( ConnectionError value)?  connectionError,TResult Function( OfflineError value)?  offlineError,TResult Function( AuthenticationError value)?  authenticationError,TResult Function( CancelError value)?  cancelError,TResult Function( ValidationError value)?  validationError,TResult Function( GeneralError value)?  generalError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case ConnectionError() when connectionError != null:
return connectionError(_that);case OfflineError() when offlineError != null:
return offlineError(_that);case AuthenticationError() when authenticationError != null:
return authenticationError(_that);case CancelError() when cancelError != null:
return cancelError(_that);case ValidationError() when validationError != null:
return validationError(_that);case GeneralError() when generalError != null:
return generalError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerError value)  serverError,required TResult Function( ConnectionError value)  connectionError,required TResult Function( OfflineError value)  offlineError,required TResult Function( AuthenticationError value)  authenticationError,required TResult Function( CancelError value)  cancelError,required TResult Function( ValidationError value)  validationError,required TResult Function( GeneralError value)  generalError,}){
final _that = this;
switch (_that) {
case ServerError():
return serverError(_that);case ConnectionError():
return connectionError(_that);case OfflineError():
return offlineError(_that);case AuthenticationError():
return authenticationError(_that);case CancelError():
return cancelError(_that);case ValidationError():
return validationError(_that);case GeneralError():
return generalError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerError value)?  serverError,TResult? Function( ConnectionError value)?  connectionError,TResult? Function( OfflineError value)?  offlineError,TResult? Function( AuthenticationError value)?  authenticationError,TResult? Function( CancelError value)?  cancelError,TResult? Function( ValidationError value)?  validationError,TResult? Function( GeneralError value)?  generalError,}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case ConnectionError() when connectionError != null:
return connectionError(_that);case OfflineError() when offlineError != null:
return offlineError(_that);case AuthenticationError() when authenticationError != null:
return authenticationError(_that);case CancelError() when cancelError != null:
return cancelError(_that);case ValidationError() when validationError != null:
return validationError(_that);case GeneralError() when generalError != null:
return generalError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message,  int? statusCode)?  serverError,TResult Function( String? message)?  connectionError,TResult Function()?  offlineError,TResult Function( String? message,  int? statusCode)?  authenticationError,TResult Function()?  cancelError,TResult Function( String? message,  int? statusCode)?  validationError,TResult Function( String? message,  int? statusCode)?  generalError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.message,_that.statusCode);case ConnectionError() when connectionError != null:
return connectionError(_that.message);case OfflineError() when offlineError != null:
return offlineError();case AuthenticationError() when authenticationError != null:
return authenticationError(_that.message,_that.statusCode);case CancelError() when cancelError != null:
return cancelError();case ValidationError() when validationError != null:
return validationError(_that.message,_that.statusCode);case GeneralError() when generalError != null:
return generalError(_that.message,_that.statusCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message,  int? statusCode)  serverError,required TResult Function( String? message)  connectionError,required TResult Function()  offlineError,required TResult Function( String? message,  int? statusCode)  authenticationError,required TResult Function()  cancelError,required TResult Function( String? message,  int? statusCode)  validationError,required TResult Function( String? message,  int? statusCode)  generalError,}) {final _that = this;
switch (_that) {
case ServerError():
return serverError(_that.message,_that.statusCode);case ConnectionError():
return connectionError(_that.message);case OfflineError():
return offlineError();case AuthenticationError():
return authenticationError(_that.message,_that.statusCode);case CancelError():
return cancelError();case ValidationError():
return validationError(_that.message,_that.statusCode);case GeneralError():
return generalError(_that.message,_that.statusCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message,  int? statusCode)?  serverError,TResult? Function( String? message)?  connectionError,TResult? Function()?  offlineError,TResult? Function( String? message,  int? statusCode)?  authenticationError,TResult? Function()?  cancelError,TResult? Function( String? message,  int? statusCode)?  validationError,TResult? Function( String? message,  int? statusCode)?  generalError,}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.message,_that.statusCode);case ConnectionError() when connectionError != null:
return connectionError(_that.message);case OfflineError() when offlineError != null:
return offlineError();case AuthenticationError() when authenticationError != null:
return authenticationError(_that.message,_that.statusCode);case CancelError() when cancelError != null:
return cancelError();case ValidationError() when validationError != null:
return validationError(_that.message,_that.statusCode);case GeneralError() when generalError != null:
return generalError(_that.message,_that.statusCode);case _:
  return null;

}
}

}

/// @nodoc


class ServerError implements Failure {
  const ServerError({this.message, this.statusCode});
  

 final  String? message;
 final  int? statusCode;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'Failure.serverError(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@useResult
$Res call({
 String? message, int? statusCode
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? statusCode = freezed,}) {
  return _then(ServerError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ConnectionError implements Failure {
  const ConnectionError({this.message});
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionErrorCopyWith<ConnectionError> get copyWith => _$ConnectionErrorCopyWithImpl<ConnectionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.connectionError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConnectionErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ConnectionErrorCopyWith(ConnectionError value, $Res Function(ConnectionError) _then) = _$ConnectionErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ConnectionErrorCopyWithImpl<$Res>
    implements $ConnectionErrorCopyWith<$Res> {
  _$ConnectionErrorCopyWithImpl(this._self, this._then);

  final ConnectionError _self;
  final $Res Function(ConnectionError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ConnectionError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OfflineError implements Failure {
  const OfflineError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.offlineError()';
}


}




/// @nodoc


class AuthenticationError implements Failure {
  const AuthenticationError({this.message, this.statusCode});
  

 final  String? message;
 final  int? statusCode;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationErrorCopyWith<AuthenticationError> get copyWith => _$AuthenticationErrorCopyWithImpl<AuthenticationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationError&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'Failure.authenticationError(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $AuthenticationErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AuthenticationErrorCopyWith(AuthenticationError value, $Res Function(AuthenticationError) _then) = _$AuthenticationErrorCopyWithImpl;
@useResult
$Res call({
 String? message, int? statusCode
});




}
/// @nodoc
class _$AuthenticationErrorCopyWithImpl<$Res>
    implements $AuthenticationErrorCopyWith<$Res> {
  _$AuthenticationErrorCopyWithImpl(this._self, this._then);

  final AuthenticationError _self;
  final $Res Function(AuthenticationError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? statusCode = freezed,}) {
  return _then(AuthenticationError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class CancelError implements Failure {
  const CancelError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cancelError()';
}


}




/// @nodoc


class ValidationError implements Failure {
  const ValidationError({this.message, this.statusCode});
  

 final  String? message;
 final  int? statusCode;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationErrorCopyWith<ValidationError> get copyWith => _$ValidationErrorCopyWithImpl<ValidationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationError&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'Failure.validationError(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ValidationErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationErrorCopyWith(ValidationError value, $Res Function(ValidationError) _then) = _$ValidationErrorCopyWithImpl;
@useResult
$Res call({
 String? message, int? statusCode
});




}
/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._self, this._then);

  final ValidationError _self;
  final $Res Function(ValidationError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? statusCode = freezed,}) {
  return _then(ValidationError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class GeneralError implements Failure {
  const GeneralError({this.message, this.statusCode});
  

 final  String? message;
 final  int? statusCode;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralErrorCopyWith<GeneralError> get copyWith => _$GeneralErrorCopyWithImpl<GeneralError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralError&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'Failure.generalError(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $GeneralErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $GeneralErrorCopyWith(GeneralError value, $Res Function(GeneralError) _then) = _$GeneralErrorCopyWithImpl;
@useResult
$Res call({
 String? message, int? statusCode
});




}
/// @nodoc
class _$GeneralErrorCopyWithImpl<$Res>
    implements $GeneralErrorCopyWith<$Res> {
  _$GeneralErrorCopyWithImpl(this._self, this._then);

  final GeneralError _self;
  final $Res Function(GeneralError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? statusCode = freezed,}) {
  return _then(GeneralError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
