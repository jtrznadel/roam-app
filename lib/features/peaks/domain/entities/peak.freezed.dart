// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Peak {

 String get id; String get name; int get altitudeMeters; double get latitude; double get longitude; String get regionId; String get rangeName; double get verificationRadiusMeters; bool get isActive;
/// Create a copy of Peak
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeakCopyWith<Peak> get copyWith => _$PeakCopyWithImpl<Peak>(this as Peak, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Peak&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.altitudeMeters, altitudeMeters) || other.altitudeMeters == altitudeMeters)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.rangeName, rangeName) || other.rangeName == rangeName)&&(identical(other.verificationRadiusMeters, verificationRadiusMeters) || other.verificationRadiusMeters == verificationRadiusMeters)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,altitudeMeters,latitude,longitude,regionId,rangeName,verificationRadiusMeters,isActive);

@override
String toString() {
  return 'Peak(id: $id, name: $name, altitudeMeters: $altitudeMeters, latitude: $latitude, longitude: $longitude, regionId: $regionId, rangeName: $rangeName, verificationRadiusMeters: $verificationRadiusMeters, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PeakCopyWith<$Res>  {
  factory $PeakCopyWith(Peak value, $Res Function(Peak) _then) = _$PeakCopyWithImpl;
@useResult
$Res call({
 String id, String name, int altitudeMeters, double latitude, double longitude, String regionId, String rangeName, double verificationRadiusMeters, bool isActive
});




}
/// @nodoc
class _$PeakCopyWithImpl<$Res>
    implements $PeakCopyWith<$Res> {
  _$PeakCopyWithImpl(this._self, this._then);

  final Peak _self;
  final $Res Function(Peak) _then;

/// Create a copy of Peak
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? altitudeMeters = null,Object? latitude = null,Object? longitude = null,Object? regionId = null,Object? rangeName = null,Object? verificationRadiusMeters = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,altitudeMeters: null == altitudeMeters ? _self.altitudeMeters : altitudeMeters // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,regionId: null == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String,rangeName: null == rangeName ? _self.rangeName : rangeName // ignore: cast_nullable_to_non_nullable
as String,verificationRadiusMeters: null == verificationRadiusMeters ? _self.verificationRadiusMeters : verificationRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Peak].
extension PeakPatterns on Peak {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Peak value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Peak() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Peak value)  $default,){
final _that = this;
switch (_that) {
case _Peak():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Peak value)?  $default,){
final _that = this;
switch (_that) {
case _Peak() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int altitudeMeters,  double latitude,  double longitude,  String regionId,  String rangeName,  double verificationRadiusMeters,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Peak() when $default != null:
return $default(_that.id,_that.name,_that.altitudeMeters,_that.latitude,_that.longitude,_that.regionId,_that.rangeName,_that.verificationRadiusMeters,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int altitudeMeters,  double latitude,  double longitude,  String regionId,  String rangeName,  double verificationRadiusMeters,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Peak():
return $default(_that.id,_that.name,_that.altitudeMeters,_that.latitude,_that.longitude,_that.regionId,_that.rangeName,_that.verificationRadiusMeters,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int altitudeMeters,  double latitude,  double longitude,  String regionId,  String rangeName,  double verificationRadiusMeters,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Peak() when $default != null:
return $default(_that.id,_that.name,_that.altitudeMeters,_that.latitude,_that.longitude,_that.regionId,_that.rangeName,_that.verificationRadiusMeters,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _Peak implements Peak {
  const _Peak({required this.id, required this.name, required this.altitudeMeters, required this.latitude, required this.longitude, required this.regionId, required this.rangeName, required this.verificationRadiusMeters, required this.isActive});
  

@override final  String id;
@override final  String name;
@override final  int altitudeMeters;
@override final  double latitude;
@override final  double longitude;
@override final  String regionId;
@override final  String rangeName;
@override final  double verificationRadiusMeters;
@override final  bool isActive;

/// Create a copy of Peak
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeakCopyWith<_Peak> get copyWith => __$PeakCopyWithImpl<_Peak>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Peak&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.altitudeMeters, altitudeMeters) || other.altitudeMeters == altitudeMeters)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.rangeName, rangeName) || other.rangeName == rangeName)&&(identical(other.verificationRadiusMeters, verificationRadiusMeters) || other.verificationRadiusMeters == verificationRadiusMeters)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,altitudeMeters,latitude,longitude,regionId,rangeName,verificationRadiusMeters,isActive);

@override
String toString() {
  return 'Peak(id: $id, name: $name, altitudeMeters: $altitudeMeters, latitude: $latitude, longitude: $longitude, regionId: $regionId, rangeName: $rangeName, verificationRadiusMeters: $verificationRadiusMeters, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PeakCopyWith<$Res> implements $PeakCopyWith<$Res> {
  factory _$PeakCopyWith(_Peak value, $Res Function(_Peak) _then) = __$PeakCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int altitudeMeters, double latitude, double longitude, String regionId, String rangeName, double verificationRadiusMeters, bool isActive
});




}
/// @nodoc
class __$PeakCopyWithImpl<$Res>
    implements _$PeakCopyWith<$Res> {
  __$PeakCopyWithImpl(this._self, this._then);

  final _Peak _self;
  final $Res Function(_Peak) _then;

/// Create a copy of Peak
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? altitudeMeters = null,Object? latitude = null,Object? longitude = null,Object? regionId = null,Object? rangeName = null,Object? verificationRadiusMeters = null,Object? isActive = null,}) {
  return _then(_Peak(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,altitudeMeters: null == altitudeMeters ? _self.altitudeMeters : altitudeMeters // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,regionId: null == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String,rangeName: null == rangeName ? _self.rangeName : rangeName // ignore: cast_nullable_to_non_nullable
as String,verificationRadiusMeters: null == verificationRadiusMeters ? _self.verificationRadiusMeters : verificationRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
