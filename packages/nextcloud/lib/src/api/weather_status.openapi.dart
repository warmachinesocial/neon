// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'weather_status.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  WeatherStatusClient get weatherStatus => WeatherStatusClient(this);
}

class WeatherStatusClient {
  WeatherStatusClient(this._rootClient);

  final Client _rootClient;

  /// Change the weather status mode. There are currently 2 modes: - ask the browser - use the user defined address.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [mode] New mode.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Weather status mode updated
  ///
  /// See:
  ///  * [setModeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusSetModeResponseApplicationJson, void>> setMode({
    required int mode,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setModeRaw(
      mode: mode,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Change the weather status mode. There are currently 2 modes: - ask the browser - use the user defined address.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [mode] New mode.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Weather status mode updated
  ///
  /// See:
  ///  * [setMode] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusSetModeResponseApplicationJson, void> setModeRaw({
    required int mode,
    bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $mode = jsonSerializers.serialize(mode, specifiedType: const FullType(int));
    parameters['mode'] = $mode;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/mode{?mode*}').expand(parameters);
    return DynamiteRawResponse<WeatherStatusSetModeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusSetModeResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Try to use the address set in user personal settings as weather location.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Address updated
  ///
  /// See:
  ///  * [usePersonalAddressRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusUsePersonalAddressResponseApplicationJson, void>> usePersonalAddress({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = usePersonalAddressRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Try to use the address set in user personal settings as weather location.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Address updated
  ///
  /// See:
  ///  * [usePersonalAddress] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusUsePersonalAddressResponseApplicationJson, void> usePersonalAddressRaw({
    bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/use-personal').expand(parameters);
    return DynamiteRawResponse<WeatherStatusUsePersonalAddressResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get stored user location.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location returned
  ///
  /// See:
  ///  * [getLocationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusGetLocationResponseApplicationJson, void>> getLocation({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getLocationRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get stored user location.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location returned
  ///
  /// See:
  ///  * [getLocation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusGetLocationResponseApplicationJson, void> getLocationRaw({bool? oCSAPIRequest}) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/location').expand(parameters);
    return DynamiteRawResponse<WeatherStatusGetLocationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusGetLocationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set address and resolve it to get coordinates or directly set coordinates and get address with reverse geocoding.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [address] Any approximative or exact address.
  ///   * [lat] Latitude in decimal degree format.
  ///   * [lon] Longitude in decimal degree format.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location updated
  ///
  /// See:
  ///  * [setLocationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusSetLocationResponseApplicationJson, void>> setLocation({
    String? address,
    double? lat,
    double? lon,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setLocationRaw(
      address: address,
      lat: lat,
      lon: lon,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set address and resolve it to get coordinates or directly set coordinates and get address with reverse geocoding.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [address] Any approximative or exact address.
  ///   * [lat] Latitude in decimal degree format.
  ///   * [lon] Longitude in decimal degree format.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location updated
  ///
  /// See:
  ///  * [setLocation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusSetLocationResponseApplicationJson, void> setLocationRaw({
    String? address,
    double? lat,
    double? lon,
    bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $address = jsonSerializers.serialize(address, specifiedType: const FullType(String));
    parameters['address'] = $address;

    final $lat = jsonSerializers.serialize(lat, specifiedType: const FullType(double));
    parameters['lat'] = $lat;

    final $lon = jsonSerializers.serialize(lon, specifiedType: const FullType(double));
    parameters['lon'] = $lon;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/location{?address*,lat*,lon*}').expand(parameters);
    return DynamiteRawResponse<WeatherStatusSetLocationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusSetLocationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get forecast for current location.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Forecast returned
  ///   * 404: Forecast not found
  ///
  /// See:
  ///  * [getForecastRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusGetForecastResponseApplicationJson, void>> getForecast({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getForecastRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get forecast for current location.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Forecast returned
  ///   * 404: Forecast not found
  ///
  /// See:
  ///  * [getForecast] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusGetForecastResponseApplicationJson, void> getForecastRaw({bool? oCSAPIRequest}) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/forecast').expand(parameters);
    return DynamiteRawResponse<WeatherStatusGetForecastResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusGetForecastResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get favorites list.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites returned
  ///
  /// See:
  ///  * [getFavoritesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusGetFavoritesResponseApplicationJson, void>> getFavorites({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getFavoritesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get favorites list.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites returned
  ///
  /// See:
  ///  * [getFavorites] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusGetFavoritesResponseApplicationJson, void> getFavoritesRaw({bool? oCSAPIRequest}) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/favorites').expand(parameters);
    return DynamiteRawResponse<WeatherStatusGetFavoritesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusGetFavoritesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set favorites list.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [favorites] Favorite addresses.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites updated
  ///
  /// See:
  ///  * [setFavoritesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusSetFavoritesResponseApplicationJson, void>> setFavorites({
    required BuiltList<String> favorites,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setFavoritesRaw(
      favorites: favorites,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set favorites list.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [favorites] Favorite addresses.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites updated
  ///
  /// See:
  ///  * [setFavorites] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusSetFavoritesResponseApplicationJson, void> setFavoritesRaw({
    required BuiltList<String> favorites,
    bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $favorites =
        jsonSerializers.serialize(favorites, specifiedType: const FullType(BuiltList, [FullType(String)]));
    parameters['favorites%5B%5D'] = $favorites;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/favorites{?favorites%5B%5D*}').expand(parameters);
    return DynamiteRawResponse<WeatherStatusSetFavoritesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface {
  bool get success;
}

abstract class WeatherStatusSetModeResponseApplicationJson_Ocs_Data
    implements
        $WeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusSetModeResponseApplicationJson_Ocs_Data,
            WeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusSetModeResponseApplicationJson_Ocs_Data([
    void Function(WeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusSetModeResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusSetModeResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetModeResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusSetModeResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetModeResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusSetModeResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusSetModeResponseApplicationJson_Ocs
    implements
        $WeatherStatusSetModeResponseApplicationJson_OcsInterface,
        Built<WeatherStatusSetModeResponseApplicationJson_Ocs, WeatherStatusSetModeResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusSetModeResponseApplicationJson_Ocs([
    void Function(WeatherStatusSetModeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusSetModeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusSetModeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetModeResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusSetModeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetModeResponseApplicationJsonInterface {
  WeatherStatusSetModeResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusSetModeResponseApplicationJson
    implements
        $WeatherStatusSetModeResponseApplicationJsonInterface,
        Built<WeatherStatusSetModeResponseApplicationJson, WeatherStatusSetModeResponseApplicationJsonBuilder> {
  factory WeatherStatusSetModeResponseApplicationJson([
    void Function(WeatherStatusSetModeResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusSetModeResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusSetModeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetModeResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetModeResponseApplicationJson> get serializer =>
      _$weatherStatusSetModeResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  double? get lat;
  double? get lon;
  String? get address;
}

abstract class WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data
    implements
        $WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data,
            WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data([
    void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusUsePersonalAddressResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs
    implements
        $WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface,
        Built<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
            WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs([
    void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusUsePersonalAddressResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusUsePersonalAddressResponseApplicationJsonInterface {
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusUsePersonalAddressResponseApplicationJson
    implements
        $WeatherStatusUsePersonalAddressResponseApplicationJsonInterface,
        Built<WeatherStatusUsePersonalAddressResponseApplicationJson,
            WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder> {
  factory WeatherStatusUsePersonalAddressResponseApplicationJson([
    void Function(WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusUsePersonalAddressResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusUsePersonalAddressResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusUsePersonalAddressResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson> get serializer =>
      _$weatherStatusUsePersonalAddressResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface {
  double get lat;
  double get lon;
  String get address;
  int get mode;
}

abstract class WeatherStatusGetLocationResponseApplicationJson_Ocs_Data
    implements
        $WeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusGetLocationResponseApplicationJson_Ocs_Data,
            WeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs_Data([
    void Function(WeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusGetLocationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusGetLocationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusGetLocationResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetLocationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusGetLocationResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusGetLocationResponseApplicationJson_Ocs
    implements
        $WeatherStatusGetLocationResponseApplicationJson_OcsInterface,
        Built<WeatherStatusGetLocationResponseApplicationJson_Ocs,
            WeatherStatusGetLocationResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs([
    void Function(WeatherStatusGetLocationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusGetLocationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusGetLocationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusGetLocationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetLocationResponseApplicationJsonInterface {
  WeatherStatusGetLocationResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusGetLocationResponseApplicationJson
    implements
        $WeatherStatusGetLocationResponseApplicationJsonInterface,
        Built<WeatherStatusGetLocationResponseApplicationJson, WeatherStatusGetLocationResponseApplicationJsonBuilder> {
  factory WeatherStatusGetLocationResponseApplicationJson([
    void Function(WeatherStatusGetLocationResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusGetLocationResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusGetLocationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetLocationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetLocationResponseApplicationJson> get serializer =>
      _$weatherStatusGetLocationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  double? get lat;
  double? get lon;
  String? get address;
}

abstract class WeatherStatusSetLocationResponseApplicationJson_Ocs_Data
    implements
        $WeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusSetLocationResponseApplicationJson_Ocs_Data,
            WeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs_Data([
    void Function(WeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusSetLocationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusSetLocationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusSetLocationResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetLocationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusSetLocationResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusSetLocationResponseApplicationJson_Ocs
    implements
        $WeatherStatusSetLocationResponseApplicationJson_OcsInterface,
        Built<WeatherStatusSetLocationResponseApplicationJson_Ocs,
            WeatherStatusSetLocationResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs([
    void Function(WeatherStatusSetLocationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusSetLocationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusSetLocationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusSetLocationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetLocationResponseApplicationJsonInterface {
  WeatherStatusSetLocationResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusSetLocationResponseApplicationJson
    implements
        $WeatherStatusSetLocationResponseApplicationJsonInterface,
        Built<WeatherStatusSetLocationResponseApplicationJson, WeatherStatusSetLocationResponseApplicationJsonBuilder> {
  factory WeatherStatusSetLocationResponseApplicationJson([
    void Function(WeatherStatusSetLocationResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusSetLocationResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusSetLocationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetLocationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetLocationResponseApplicationJson> get serializer =>
      _$weatherStatusSetLocationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Instant_DetailsInterface {
  @BuiltValueField(wireName: 'air_pressure_at_sea_level')
  double get airPressureAtSeaLevel;
  @BuiltValueField(wireName: 'air_temperature')
  double get airTemperature;
  @BuiltValueField(wireName: 'cloud_area_fraction')
  double get cloudAreaFraction;
  @BuiltValueField(wireName: 'cloud_area_fraction_high')
  double get cloudAreaFractionHigh;
  @BuiltValueField(wireName: 'cloud_area_fraction_low')
  double get cloudAreaFractionLow;
  @BuiltValueField(wireName: 'cloud_area_fraction_medium')
  double get cloudAreaFractionMedium;
  @BuiltValueField(wireName: 'dew_point_temperature')
  double get dewPointTemperature;
  @BuiltValueField(wireName: 'fog_area_fraction')
  double get fogAreaFraction;
  @BuiltValueField(wireName: 'relative_humidity')
  double get relativeHumidity;
  @BuiltValueField(wireName: 'ultraviolet_index_clear_sky')
  double get ultravioletIndexClearSky;
  @BuiltValueField(wireName: 'wind_from_direction')
  double get windFromDirection;
  @BuiltValueField(wireName: 'wind_speed')
  double get windSpeed;
  @BuiltValueField(wireName: 'wind_speed_of_gust')
  double get windSpeedOfGust;
}

abstract class Forecast_Data_Instant_Details
    implements
        $Forecast_Data_Instant_DetailsInterface,
        Built<Forecast_Data_Instant_Details, Forecast_Data_Instant_DetailsBuilder> {
  factory Forecast_Data_Instant_Details([void Function(Forecast_Data_Instant_DetailsBuilder)? b]) =
      _$Forecast_Data_Instant_Details;

  // coverage:ignore-start
  const Forecast_Data_Instant_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Instant_Details.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Instant_Details> get serializer => _$forecastDataInstantDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_InstantInterface {
  Forecast_Data_Instant_Details get details;
}

abstract class Forecast_Data_Instant
    implements $Forecast_Data_InstantInterface, Built<Forecast_Data_Instant, Forecast_Data_InstantBuilder> {
  factory Forecast_Data_Instant([void Function(Forecast_Data_InstantBuilder)? b]) = _$Forecast_Data_Instant;

  // coverage:ignore-start
  const Forecast_Data_Instant._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Instant.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Instant> get serializer => _$forecastDataInstantSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next12Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
}

abstract class Forecast_Data_Next12Hours_Summary
    implements
        $Forecast_Data_Next12Hours_SummaryInterface,
        Built<Forecast_Data_Next12Hours_Summary, Forecast_Data_Next12Hours_SummaryBuilder> {
  factory Forecast_Data_Next12Hours_Summary([void Function(Forecast_Data_Next12Hours_SummaryBuilder)? b]) =
      _$Forecast_Data_Next12Hours_Summary;

  // coverage:ignore-start
  const Forecast_Data_Next12Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next12Hours_Summary.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next12Hours_Summary> get serializer => _$forecastDataNext12HoursSummarySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next12Hours_DetailsInterface {
  @BuiltValueField(wireName: 'probability_of_precipitation')
  double get probabilityOfPrecipitation;
}

abstract class Forecast_Data_Next12Hours_Details
    implements
        $Forecast_Data_Next12Hours_DetailsInterface,
        Built<Forecast_Data_Next12Hours_Details, Forecast_Data_Next12Hours_DetailsBuilder> {
  factory Forecast_Data_Next12Hours_Details([void Function(Forecast_Data_Next12Hours_DetailsBuilder)? b]) =
      _$Forecast_Data_Next12Hours_Details;

  // coverage:ignore-start
  const Forecast_Data_Next12Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next12Hours_Details.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next12Hours_Details> get serializer => _$forecastDataNext12HoursDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next12HoursInterface {
  Forecast_Data_Next12Hours_Summary get summary;
  Forecast_Data_Next12Hours_Details get details;
}

abstract class Forecast_Data_Next12Hours
    implements $Forecast_Data_Next12HoursInterface, Built<Forecast_Data_Next12Hours, Forecast_Data_Next12HoursBuilder> {
  factory Forecast_Data_Next12Hours([void Function(Forecast_Data_Next12HoursBuilder)? b]) = _$Forecast_Data_Next12Hours;

  // coverage:ignore-start
  const Forecast_Data_Next12Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next12Hours.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next12Hours> get serializer => _$forecastDataNext12HoursSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next1Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
}

abstract class Forecast_Data_Next1Hours_Summary
    implements
        $Forecast_Data_Next1Hours_SummaryInterface,
        Built<Forecast_Data_Next1Hours_Summary, Forecast_Data_Next1Hours_SummaryBuilder> {
  factory Forecast_Data_Next1Hours_Summary([void Function(Forecast_Data_Next1Hours_SummaryBuilder)? b]) =
      _$Forecast_Data_Next1Hours_Summary;

  // coverage:ignore-start
  const Forecast_Data_Next1Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next1Hours_Summary.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next1Hours_Summary> get serializer => _$forecastDataNext1HoursSummarySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next1Hours_DetailsInterface {
  @BuiltValueField(wireName: 'precipitation_amount')
  double get precipitationAmount;
  @BuiltValueField(wireName: 'precipitation_amount_max')
  double get precipitationAmountMax;
  @BuiltValueField(wireName: 'precipitation_amount_min')
  double get precipitationAmountMin;
  @BuiltValueField(wireName: 'probability_of_precipitation')
  double get probabilityOfPrecipitation;
  @BuiltValueField(wireName: 'probability_of_thunder')
  double get probabilityOfThunder;
}

abstract class Forecast_Data_Next1Hours_Details
    implements
        $Forecast_Data_Next1Hours_DetailsInterface,
        Built<Forecast_Data_Next1Hours_Details, Forecast_Data_Next1Hours_DetailsBuilder> {
  factory Forecast_Data_Next1Hours_Details([void Function(Forecast_Data_Next1Hours_DetailsBuilder)? b]) =
      _$Forecast_Data_Next1Hours_Details;

  // coverage:ignore-start
  const Forecast_Data_Next1Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next1Hours_Details.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next1Hours_Details> get serializer => _$forecastDataNext1HoursDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next1HoursInterface {
  Forecast_Data_Next1Hours_Summary get summary;
  Forecast_Data_Next1Hours_Details get details;
}

abstract class Forecast_Data_Next1Hours
    implements $Forecast_Data_Next1HoursInterface, Built<Forecast_Data_Next1Hours, Forecast_Data_Next1HoursBuilder> {
  factory Forecast_Data_Next1Hours([void Function(Forecast_Data_Next1HoursBuilder)? b]) = _$Forecast_Data_Next1Hours;

  // coverage:ignore-start
  const Forecast_Data_Next1Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next1Hours.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next1Hours> get serializer => _$forecastDataNext1HoursSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next6Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
}

abstract class Forecast_Data_Next6Hours_Summary
    implements
        $Forecast_Data_Next6Hours_SummaryInterface,
        Built<Forecast_Data_Next6Hours_Summary, Forecast_Data_Next6Hours_SummaryBuilder> {
  factory Forecast_Data_Next6Hours_Summary([void Function(Forecast_Data_Next6Hours_SummaryBuilder)? b]) =
      _$Forecast_Data_Next6Hours_Summary;

  // coverage:ignore-start
  const Forecast_Data_Next6Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next6Hours_Summary.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next6Hours_Summary> get serializer => _$forecastDataNext6HoursSummarySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next6Hours_DetailsInterface {
  @BuiltValueField(wireName: 'air_temperature_max')
  double get airTemperatureMax;
  @BuiltValueField(wireName: 'air_temperature_min')
  double get airTemperatureMin;
  @BuiltValueField(wireName: 'precipitation_amount')
  double get precipitationAmount;
  @BuiltValueField(wireName: 'precipitation_amount_max')
  double get precipitationAmountMax;
  @BuiltValueField(wireName: 'precipitation_amount_min')
  double get precipitationAmountMin;
  @BuiltValueField(wireName: 'probability_of_precipitation')
  double get probabilityOfPrecipitation;
}

abstract class Forecast_Data_Next6Hours_Details
    implements
        $Forecast_Data_Next6Hours_DetailsInterface,
        Built<Forecast_Data_Next6Hours_Details, Forecast_Data_Next6Hours_DetailsBuilder> {
  factory Forecast_Data_Next6Hours_Details([void Function(Forecast_Data_Next6Hours_DetailsBuilder)? b]) =
      _$Forecast_Data_Next6Hours_Details;

  // coverage:ignore-start
  const Forecast_Data_Next6Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next6Hours_Details.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next6Hours_Details> get serializer => _$forecastDataNext6HoursDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_Data_Next6HoursInterface {
  Forecast_Data_Next6Hours_Summary get summary;
  Forecast_Data_Next6Hours_Details get details;
}

abstract class Forecast_Data_Next6Hours
    implements $Forecast_Data_Next6HoursInterface, Built<Forecast_Data_Next6Hours, Forecast_Data_Next6HoursBuilder> {
  factory Forecast_Data_Next6Hours([void Function(Forecast_Data_Next6HoursBuilder)? b]) = _$Forecast_Data_Next6Hours;

  // coverage:ignore-start
  const Forecast_Data_Next6Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next6Hours.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data_Next6Hours> get serializer => _$forecastDataNext6HoursSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Forecast_DataInterface {
  Forecast_Data_Instant get instant;
  @BuiltValueField(wireName: 'next_12_hours')
  Forecast_Data_Next12Hours get next12Hours;
  @BuiltValueField(wireName: 'next_1_hours')
  Forecast_Data_Next1Hours get next1Hours;
  @BuiltValueField(wireName: 'next_6_hours')
  Forecast_Data_Next6Hours get next6Hours;
}

abstract class Forecast_Data implements $Forecast_DataInterface, Built<Forecast_Data, Forecast_DataBuilder> {
  factory Forecast_Data([void Function(Forecast_DataBuilder)? b]) = _$Forecast_Data;

  // coverage:ignore-start
  const Forecast_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast_Data> get serializer => _$forecastDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ForecastInterface {
  String get time;
  Forecast_Data get data;
}

abstract class Forecast implements $ForecastInterface, Built<Forecast, ForecastBuilder> {
  factory Forecast([void Function(ForecastBuilder)? b]) = _$Forecast;

  // coverage:ignore-start
  const Forecast._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Forecast> get serializer => _$forecastSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetForecastResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Forecast> get data;
}

abstract class WeatherStatusGetForecastResponseApplicationJson_Ocs
    implements
        $WeatherStatusGetForecastResponseApplicationJson_OcsInterface,
        Built<WeatherStatusGetForecastResponseApplicationJson_Ocs,
            WeatherStatusGetForecastResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusGetForecastResponseApplicationJson_Ocs([
    void Function(WeatherStatusGetForecastResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusGetForecastResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusGetForecastResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetForecastResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetForecastResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusGetForecastResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetForecastResponseApplicationJsonInterface {
  WeatherStatusGetForecastResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusGetForecastResponseApplicationJson
    implements
        $WeatherStatusGetForecastResponseApplicationJsonInterface,
        Built<WeatherStatusGetForecastResponseApplicationJson, WeatherStatusGetForecastResponseApplicationJsonBuilder> {
  factory WeatherStatusGetForecastResponseApplicationJson([
    void Function(WeatherStatusGetForecastResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusGetForecastResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusGetForecastResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetForecastResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetForecastResponseApplicationJson> get serializer =>
      _$weatherStatusGetForecastResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetFavoritesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class WeatherStatusGetFavoritesResponseApplicationJson_Ocs
    implements
        $WeatherStatusGetFavoritesResponseApplicationJson_OcsInterface,
        Built<WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusGetFavoritesResponseApplicationJson_Ocs([
    void Function(WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusGetFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetFavoritesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusGetFavoritesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusGetFavoritesResponseApplicationJsonInterface {
  WeatherStatusGetFavoritesResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusGetFavoritesResponseApplicationJson
    implements
        $WeatherStatusGetFavoritesResponseApplicationJsonInterface,
        Built<WeatherStatusGetFavoritesResponseApplicationJson,
            WeatherStatusGetFavoritesResponseApplicationJsonBuilder> {
  factory WeatherStatusGetFavoritesResponseApplicationJson([
    void Function(WeatherStatusGetFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusGetFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusGetFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetFavoritesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusGetFavoritesResponseApplicationJson> get serializer =>
      _$weatherStatusGetFavoritesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface {
  bool get success;
}

abstract class WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data
    implements
        $WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data,
            WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data([
    void Function(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusSetFavoritesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetFavoritesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusSetFavoritesResponseApplicationJson_Ocs
    implements
        $WeatherStatusSetFavoritesResponseApplicationJson_OcsInterface,
        Built<WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs([
    void Function(WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusSetFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusSetFavoritesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusSetFavoritesResponseApplicationJsonInterface {
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusSetFavoritesResponseApplicationJson
    implements
        $WeatherStatusSetFavoritesResponseApplicationJsonInterface,
        Built<WeatherStatusSetFavoritesResponseApplicationJson,
            WeatherStatusSetFavoritesResponseApplicationJsonBuilder> {
  factory WeatherStatusSetFavoritesResponseApplicationJson([
    void Function(WeatherStatusSetFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusSetFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusSetFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetFavoritesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson> get serializer =>
      _$weatherStatusSetFavoritesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_WeatherStatusInterface {
  bool get enabled;
}

abstract class Capabilities_WeatherStatus
    implements
        $Capabilities_WeatherStatusInterface,
        Built<Capabilities_WeatherStatus, Capabilities_WeatherStatusBuilder> {
  factory Capabilities_WeatherStatus([void Function(Capabilities_WeatherStatusBuilder)? b]) =
      _$Capabilities_WeatherStatus;

  // coverage:ignore-start
  const Capabilities_WeatherStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_WeatherStatus.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_WeatherStatus> get serializer => _$capabilitiesWeatherStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  @BuiltValueField(wireName: 'weather_status')
  Capabilities_WeatherStatus get weatherStatus;
}

abstract class Capabilities implements $CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(WeatherStatusSetModeResponseApplicationJson),
        WeatherStatusSetModeResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusSetModeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs),
        WeatherStatusSetModeResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusSetModeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs_Data),
        WeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(WeatherStatusSetModeResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson),
        WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusUsePersonalAddressResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs),
        WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data),
        WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetLocationResponseApplicationJson),
        WeatherStatusGetLocationResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusGetLocationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs),
        WeatherStatusGetLocationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusGetLocationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs_Data),
        WeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(WeatherStatusGetLocationResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetLocationResponseApplicationJson),
        WeatherStatusSetLocationResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusSetLocationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs),
        WeatherStatusSetLocationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusSetLocationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs_Data),
        WeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(WeatherStatusSetLocationResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetForecastResponseApplicationJson),
        WeatherStatusGetForecastResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusGetForecastResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs),
        WeatherStatusGetForecastResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusGetForecastResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Forecast), ForecastBuilder.new)
      ..add(Forecast.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data), Forecast_DataBuilder.new)
      ..add(Forecast_Data.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Instant), Forecast_Data_InstantBuilder.new)
      ..add(Forecast_Data_Instant.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Instant_Details), Forecast_Data_Instant_DetailsBuilder.new)
      ..add(Forecast_Data_Instant_Details.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next12Hours), Forecast_Data_Next12HoursBuilder.new)
      ..add(Forecast_Data_Next12Hours.serializer)
      ..addBuilderFactory(
        const FullType(Forecast_Data_Next12Hours_Summary),
        Forecast_Data_Next12Hours_SummaryBuilder.new,
      )
      ..add(Forecast_Data_Next12Hours_Summary.serializer)
      ..addBuilderFactory(
        const FullType(Forecast_Data_Next12Hours_Details),
        Forecast_Data_Next12Hours_DetailsBuilder.new,
      )
      ..add(Forecast_Data_Next12Hours_Details.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next1Hours), Forecast_Data_Next1HoursBuilder.new)
      ..add(Forecast_Data_Next1Hours.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next1Hours_Summary), Forecast_Data_Next1Hours_SummaryBuilder.new)
      ..add(Forecast_Data_Next1Hours_Summary.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next1Hours_Details), Forecast_Data_Next1Hours_DetailsBuilder.new)
      ..add(Forecast_Data_Next1Hours_Details.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next6Hours), Forecast_Data_Next6HoursBuilder.new)
      ..add(Forecast_Data_Next6Hours.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next6Hours_Summary), Forecast_Data_Next6Hours_SummaryBuilder.new)
      ..add(Forecast_Data_Next6Hours_Summary.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next6Hours_Details), Forecast_Data_Next6Hours_DetailsBuilder.new)
      ..add(Forecast_Data_Next6Hours_Details.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Forecast)]), ListBuilder<Forecast>.new)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetFavoritesResponseApplicationJson),
        WeatherStatusGetFavoritesResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusGetFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetFavoritesResponseApplicationJson_Ocs),
        WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusGetFavoritesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetFavoritesResponseApplicationJson),
        WeatherStatusSetFavoritesResponseApplicationJsonBuilder.new,
      )
      ..add(WeatherStatusSetFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs),
        WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WeatherStatusSetFavoritesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data),
        WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_WeatherStatus), Capabilities_WeatherStatusBuilder.new)
      ..add(Capabilities_WeatherStatus.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
