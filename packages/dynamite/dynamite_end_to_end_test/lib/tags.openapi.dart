// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: public_member_api_docs, unreachable_switch_case
// ignore_for_file: unused_element

/// Tags test Version: 0.0.1.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i4;
import 'package:dynamite_runtime/built_value.dart' as _i3;
import 'package:dynamite_runtime/http_client.dart' as _i1;
import 'package:meta/meta.dart' as _i2;

class $Client extends _i1.DynamiteClient {
  /// Creates a new `DynamiteClient` for untagged requests.
  $Client(
    super.baseURL, {
    super.baseHeaders,
    super.httpClient,
    super.cookieJar,
  });

  /// Creates a new [$Client] from another [client].
  $Client.fromClient(_i1.DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  late final $FirstClient first = $FirstClient(this);

  late final $SecondClient second = $SecondClient(this);
}

class $FirstClient {
  /// Creates a new `DynamiteClient` for first requests.
  $FirstClient(this._rootClient);

  final $Client _rootClient;

  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a `DynamiteRawResponse` that can be serialized.
  Future<_i1.DynamiteResponse<void, void>> $get() async {
    final rawResponse = $getRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a `DynamiteRawResponse` with the raw `HttpClientResponse` and serialization helpers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$get] for an operation that returns a `DynamiteResponse` with a stable API.
  @_i2.experimental
  _i1.DynamiteRawResponse<void, void> $getRaw() {
    final _headers = <String, String>{};

    const _path = '/';
    return _i1.DynamiteRawResponse<void, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        null,
      ),
      bodyType: null,
      headersType: null,
      serializers: _$jsonSerializers,
    );
  }
}

class $SecondClient {
  /// Creates a new `DynamiteClient` for second requests.
  $SecondClient(this._rootClient);

  final $Client _rootClient;

  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a `DynamiteRawResponse` that can be serialized.
  Future<_i1.DynamiteResponse<void, void>> $get() async {
    final rawResponse = $getRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a `DynamiteRawResponse` with the raw `HttpClientResponse` and serialization helpers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$get] for an operation that returns a `DynamiteResponse` with a stable API.
  @_i2.experimental
  _i1.DynamiteRawResponse<void, void> $getRaw() {
    final _headers = <String, String>{};

    const _path = '/';
    return _i1.DynamiteRawResponse<void, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        null,
      ),
      bodyType: null,
      headersType: null,
      serializers: _$jsonSerializers,
    );
  }
}

// coverage:ignore-start
/// Serializer for all values in this library.
///
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.
@_i2.visibleForTesting
final Serializers $serializers = _$serializers;
final Serializers _$serializers = Serializers();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i2.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i3.DynamiteDoubleSerializer())
      ..addPlugin(_i4.StandardJsonPlugin())
      ..addPlugin(const _i3.HeaderPlugin())
      ..addPlugin(const _i3.ContentStringPlugin()))
    .build();
// coverage:ignore-end
