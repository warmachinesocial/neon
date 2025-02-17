// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'provisioning_api.openapi.g.dart';

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

  AppConfigClient get appConfig => AppConfigClient(this);

  AppsClient get apps => AppsClient(this);

  GroupsClient get groups => GroupsClient(this);

  PreferencesClient get preferences => PreferencesClient(this);

  UsersClient get users => UsersClient(this);
}

class AppConfigClient {
  AppConfigClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps returned
  ///
  /// See:
  ///  * [getAppsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigGetAppsResponseApplicationJson, void>> getApps({bool? oCSAPIRequest}) async {
    final rawResponse = getAppsRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of apps.
  ///
  /// This endpoint requires admin access.
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
  ///   * 200: Apps returned
  ///
  /// See:
  ///  * [getApps] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigGetAppsResponseApplicationJson, void> getAppsRaw({bool? oCSAPIRequest}) {
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

    final path = UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps').expand(parameters);
    return DynamiteRawResponse<AppConfigGetAppsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigGetAppsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the config keys of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Keys returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getKeysRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigGetKeysResponseApplicationJson, void>> getKeys({
    required String app,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getKeysRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the config keys of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Keys returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getKeys] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigGetKeysResponseApplicationJson, void> getKeysRaw({
    required String app,
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
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}').expand(parameters);
    return DynamiteRawResponse<AppConfigGetKeysResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigGetKeysResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a the config value of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [defaultValue] Default returned value if the value is empty. Defaults to `''`.
  ///   * [app] ID of the app.
  ///   * [key] Key.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getValueRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigGetValueResponseApplicationJson, void>> getValue({
    required String app,
    required String key,
    String? defaultValue,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getValueRaw(
      app: app,
      key: key,
      defaultValue: defaultValue,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a the config value of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [defaultValue] Default returned value if the value is empty. Defaults to `''`.
  ///   * [app] ID of the app.
  ///   * [key] Key.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getValue] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigGetValueResponseApplicationJson, void> getValueRaw({
    required String app,
    required String key,
    String? defaultValue,
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
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    parameters['key'] = $key;

    var $defaultValue = jsonSerializers.serialize(defaultValue, specifiedType: const FullType(String));
    $defaultValue ??= '';
    parameters['defaultValue'] = $defaultValue;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}{?defaultValue*}')
        .expand(parameters);
    return DynamiteRawResponse<AppConfigGetValueResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigGetValueResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update the config value of an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [value] New value for the key.
  ///   * [app] ID of the app.
  ///   * [key] Key to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value updated successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [setValueRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigSetValueResponseApplicationJson, void>> setValue({
    required String value,
    required String app,
    required String key,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setValueRaw(
      value: value,
      app: app,
      key: key,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the config value of an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [value] New value for the key.
  ///   * [app] ID of the app.
  ///   * [key] Key to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value updated successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [setValue] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigSetValueResponseApplicationJson, void> setValueRaw({
    required String value,
    required String app,
    required String key,
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
    final $value = jsonSerializers.serialize(value, specifiedType: const FullType(String));
    parameters['value'] = $value;

    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    parameters['key'] = $key;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path =
        UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}{?value*}').expand(parameters);
    return DynamiteRawResponse<AppConfigSetValueResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigSetValueResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a config key of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [key] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Key deleted successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [deleteKeyRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigDeleteKeyResponseApplicationJson, void>> deleteKey({
    required String app,
    required String key,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteKeyRaw(
      app: app,
      key: key,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a config key of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [key] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Key deleted successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [deleteKey] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigDeleteKeyResponseApplicationJson, void> deleteKeyRaw({
    required String app,
    required String key,
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
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    parameters['key'] = $key;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}').expand(parameters);
    return DynamiteRawResponse<AppConfigDeleteKeyResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigDeleteKeyResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class AppsClient {
  AppsClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of installed apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filter] Filter for enabled or disabled apps.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Installed apps returned
  ///
  /// See:
  ///  * [getAppsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsGetAppsResponseApplicationJson, void>> getApps({
    String? filter,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getAppsRaw(
      filter: filter,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of installed apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filter] Filter for enabled or disabled apps.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Installed apps returned
  ///
  /// See:
  ///  * [getApps] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsGetAppsResponseApplicationJson, void> getAppsRaw({
    String? filter,
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
    final $filter = jsonSerializers.serialize(filter, specifiedType: const FullType(String));
    parameters['filter'] = $filter;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/apps{?filter*}').expand(parameters);
    return DynamiteRawResponse<AppsGetAppsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsGetAppsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the app info for an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App info returned
  ///
  /// See:
  ///  * [getAppInfoRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsGetAppInfoResponseApplicationJson, void>> getAppInfo({
    required String app,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getAppInfoRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the app info for an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App info returned
  ///
  /// See:
  ///  * [getAppInfo] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsGetAppInfoResponseApplicationJson, void> getAppInfoRaw({
    required String app,
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
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/apps/{app}').expand(parameters);
    return DynamiteRawResponse<AppsGetAppInfoResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsGetAppInfoResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Enable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App enabled successfully
  ///
  /// See:
  ///  * [enableRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsEnableResponseApplicationJson, void>> enable({
    required String app,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = enableRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Enable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App enabled successfully
  ///
  /// See:
  ///  * [enable] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsEnableResponseApplicationJson, void> enableRaw({
    required String app,
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
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/apps/{app}').expand(parameters);
    return DynamiteRawResponse<AppsEnableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsEnableResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Disable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App disabled successfully
  ///
  /// See:
  ///  * [disableRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsDisableResponseApplicationJson, void>> disable({
    required String app,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = disableRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App disabled successfully
  ///
  /// See:
  ///  * [disable] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsDisableResponseApplicationJson, void> disableRaw({
    required String app,
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
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    parameters['app'] = $app;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/apps/{app}').expand(parameters);
    return DynamiteRawResponse<AppsDisableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsDisableResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class GroupsClient {
  GroupsClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of groups.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups returned
  ///
  /// See:
  ///  * [getGroupsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupsResponseApplicationJson, void>> getGroups({
    String? search,
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getGroupsRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of groups.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups returned
  ///
  /// See:
  ///  * [getGroups] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupsResponseApplicationJson, void> getGroupsRaw({
    String? search,
    int? limit,
    int? offset,
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
    var $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    $search ??= '';
    parameters['search'] = $search;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    parameters['limit'] = $limit;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups{?search*,limit*,offset*}').expand(parameters);
    return DynamiteRawResponse<GroupsGetGroupsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Create a new group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [displayname] Display name of the group. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group created successfully
  ///
  /// See:
  ///  * [addGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsAddGroupResponseApplicationJson, void>> addGroup({
    required String groupid,
    String? displayname,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = addGroupRaw(
      groupid: groupid,
      displayname: displayname,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a new group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [displayname] Display name of the group. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group created successfully
  ///
  /// See:
  ///  * [addGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsAddGroupResponseApplicationJson, void> addGroupRaw({
    required String groupid,
    String? displayname,
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
    final $groupid = jsonSerializers.serialize(groupid, specifiedType: const FullType(String));
    parameters['groupid'] = $groupid;

    var $displayname = jsonSerializers.serialize(displayname, specifiedType: const FullType(String));
    $displayname ??= '';
    parameters['displayname'] = $displayname;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups{?groupid*,displayname*}').expand(parameters);
    return DynamiteRawResponse<GroupsAddGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsAddGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of groups details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups details returned
  ///
  /// See:
  ///  * [getGroupsDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupsDetailsResponseApplicationJson, void>> getGroupsDetails({
    String? search,
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getGroupsDetailsRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of groups details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups details returned
  ///
  /// See:
  ///  * [getGroupsDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupsDetailsResponseApplicationJson, void> getGroupsDetailsRaw({
    String? search,
    int? limit,
    int? offset,
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
    var $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    $search ??= '';
    parameters['search'] = $search;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    parameters['limit'] = $limit;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups/details{?search*,limit*,offset*}').expand(parameters);
    return DynamiteRawResponse<GroupsGetGroupsDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupsDetailsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of users in the specified group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User IDs returned
  ///   * 404: Group not found
  ///   * 403: Missing permissions to get users in the group
  ///
  /// See:
  ///  * [getGroupUsersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupUsersResponseApplicationJson, void>> getGroupUsers({
    required String groupId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getGroupUsersRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users in the specified group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User IDs returned
  ///   * 404: Group not found
  ///   * 403: Missing permissions to get users in the group
  ///
  /// See:
  ///  * [getGroupUsers] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupUsersResponseApplicationJson, void> getGroupUsersRaw({
    required String groupId,
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
    final $groupId = jsonSerializers.serialize(groupId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($groupId as String?, RegExp(r'^.+$'), 'groupId');
    parameters['groupId'] = $groupId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups/{groupId}/users').expand(parameters);
    return DynamiteRawResponse<GroupsGetGroupUsersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupUsersResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of users details in the specified group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users details returned
  ///
  /// See:
  ///  * [getGroupUsersDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupUsersDetailsResponseApplicationJson, void>> getGroupUsersDetails({
    required String groupId,
    String? search,
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getGroupUsersDetailsRaw(
      groupId: groupId,
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users details in the specified group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users details returned
  ///
  /// See:
  ///  * [getGroupUsersDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupUsersDetailsResponseApplicationJson, void> getGroupUsersDetailsRaw({
    required String groupId,
    String? search,
    int? limit,
    int? offset,
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
    final $groupId = jsonSerializers.serialize(groupId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($groupId as String?, RegExp(r'^.+$'), 'groupId');
    parameters['groupId'] = $groupId;

    var $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    $search ??= '';
    parameters['search'] = $search;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    parameters['limit'] = $limit;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path =
        UriTemplate('/ocs/v2.php/cloud/groups/{groupId}/users/details{?search*,limit*,offset*}').expand(parameters);
    return DynamiteRawResponse<GroupsGetGroupUsersDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the list of user IDs that are a subadmin of the group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Sub admins returned
  ///
  /// See:
  ///  * [getSubAdminsOfGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetSubAdminsOfGroupResponseApplicationJson, void>> getSubAdminsOfGroup({
    required String groupId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getSubAdminsOfGroupRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the list of user IDs that are a subadmin of the group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Sub admins returned
  ///
  /// See:
  ///  * [getSubAdminsOfGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetSubAdminsOfGroupResponseApplicationJson, void> getSubAdminsOfGroupRaw({
    required String groupId,
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
    final $groupId = jsonSerializers.serialize(groupId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($groupId as String?, RegExp(r'^.+$'), 'groupId');
    parameters['groupId'] = $groupId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups/{groupId}/subadmins').expand(parameters);
    return DynamiteRawResponse<GroupsGetSubAdminsOfGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of users in the specified group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users returned
  ///
  /// See:
  ///  * [getGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  @Deprecated('')
  Future<DynamiteResponse<GroupsGetGroupResponseApplicationJson, void>> getGroup({
    required String groupId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getGroupRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users in the specified group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users returned
  ///
  /// See:
  ///  * [getGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  @Deprecated('')
  DynamiteRawResponse<GroupsGetGroupResponseApplicationJson, void> getGroupRaw({
    required String groupId,
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
    final $groupId = jsonSerializers.serialize(groupId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($groupId as String?, RegExp(r'^.+$'), 'groupId');
    parameters['groupId'] = $groupId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups/{groupId}').expand(parameters);
    return DynamiteRawResponse<GroupsGetGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key to update, only 'displayname'.
  ///   * [value] New value for the key.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group updated successfully
  ///
  /// See:
  ///  * [updateGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsUpdateGroupResponseApplicationJson, void>> updateGroup({
    required String key,
    required String value,
    required String groupId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = updateGroupRaw(
      key: key,
      value: value,
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key to update, only 'displayname'.
  ///   * [value] New value for the key.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group updated successfully
  ///
  /// See:
  ///  * [updateGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsUpdateGroupResponseApplicationJson, void> updateGroupRaw({
    required String key,
    required String value,
    required String groupId,
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
    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    parameters['key'] = $key;

    final $value = jsonSerializers.serialize(value, specifiedType: const FullType(String));
    parameters['value'] = $value;

    final $groupId = jsonSerializers.serialize(groupId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($groupId as String?, RegExp(r'^.+$'), 'groupId');
    parameters['groupId'] = $groupId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups/{groupId}{?key*,value*}').expand(parameters);
    return DynamiteRawResponse<GroupsUpdateGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsUpdateGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group deleted successfully
  ///
  /// See:
  ///  * [deleteGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsDeleteGroupResponseApplicationJson, void>> deleteGroup({
    required String groupId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteGroupRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group deleted successfully
  ///
  /// See:
  ///  * [deleteGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsDeleteGroupResponseApplicationJson, void> deleteGroupRaw({
    required String groupId,
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
    final $groupId = jsonSerializers.serialize(groupId, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($groupId as String?, RegExp(r'^.+$'), 'groupId');
    parameters['groupId'] = $groupId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/groups/{groupId}').expand(parameters);
    return DynamiteRawResponse<GroupsDeleteGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsDeleteGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class PreferencesClient {
  PreferencesClient(this._rootClient);

  final Client _rootClient;

  /// Update a preference value of an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configValue] New value.
  ///   * [appId] ID of the app.
  ///   * [configKey] Key of the preference.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setPreferenceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesSetPreferenceResponseApplicationJson, void>> setPreference({
    required String configValue,
    required String appId,
    required String configKey,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setPreferenceRaw(
      configValue: configValue,
      appId: appId,
      configKey: configKey,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a preference value of an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configValue] New value.
  ///   * [appId] ID of the app.
  ///   * [configKey] Key of the preference.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setPreference] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesSetPreferenceResponseApplicationJson, void> setPreferenceRaw({
    required String configValue,
    required String appId,
    required String configKey,
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
    final $configValue = jsonSerializers.serialize(configValue, specifiedType: const FullType(String));
    parameters['configValue'] = $configValue;

    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    parameters['appId'] = $appId;

    final $configKey = jsonSerializers.serialize(configKey, specifiedType: const FullType(String));
    parameters['configKey'] = $configKey;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}/{configKey}{?configValue*}')
        .expand(parameters);
    return DynamiteRawResponse<PreferencesSetPreferenceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesSetPreferenceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a preference for an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [appId] ID of the app.
  ///   * [configKey] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deletePreferenceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesDeletePreferenceResponseApplicationJson, void>> deletePreference({
    required String appId,
    required String configKey,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deletePreferenceRaw(
      appId: appId,
      configKey: configKey,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a preference for an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [appId] ID of the app.
  ///   * [configKey] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deletePreference] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesDeletePreferenceResponseApplicationJson, void> deletePreferenceRaw({
    required String appId,
    required String configKey,
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
    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    parameters['appId'] = $appId;

    final $configKey = jsonSerializers.serialize(configKey, specifiedType: const FullType(String));
    parameters['configKey'] = $configKey;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path =
        UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}/{configKey}').expand(parameters);
    return DynamiteRawResponse<PreferencesDeletePreferenceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesDeletePreferenceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update multiple preference values of an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configs] Key-value pairs of the preferences.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setMultiplePreferencesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesSetMultiplePreferencesResponseApplicationJson, void>> setMultiplePreferences({
    required ContentString<BuiltMap<String, String>> configs,
    required String appId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setMultiplePreferencesRaw(
      configs: configs,
      appId: appId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update multiple preference values of an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configs] Key-value pairs of the preferences.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setMultiplePreferences] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesSetMultiplePreferencesResponseApplicationJson, void> setMultiplePreferencesRaw({
    required ContentString<BuiltMap<String, String>> configs,
    required String appId,
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
    final $configs = jsonSerializers.serialize(
      configs,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(String)]),
      ]),
    );
    parameters['configs'] = $configs;

    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    parameters['appId'] = $appId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path =
        UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}{?configs*}').expand(parameters);
    return DynamiteRawResponse<PreferencesSetMultiplePreferencesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete multiple preferences for an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configKeys] Keys to delete.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deleteMultiplePreferenceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesDeleteMultiplePreferenceResponseApplicationJson, void>> deleteMultiplePreference({
    required BuiltList<String> configKeys,
    required String appId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteMultiplePreferenceRaw(
      configKeys: configKeys,
      appId: appId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete multiple preferences for an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configKeys] Keys to delete.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deleteMultiplePreference] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesDeleteMultiplePreferenceResponseApplicationJson, void> deleteMultiplePreferenceRaw({
    required BuiltList<String> configKeys,
    required String appId,
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
    final $configKeys =
        jsonSerializers.serialize(configKeys, specifiedType: const FullType(BuiltList, [FullType(String)]));
    parameters['configKeys%5B%5D'] = $configKeys;

    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    parameters['appId'] = $appId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}{?configKeys%5B%5D*}')
        .expand(parameters);
    return DynamiteRawResponse<PreferencesDeleteMultiplePreferenceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class UsersClient {
  UsersClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of users.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///
  /// See:
  ///  * [getUsersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUsersResponseApplicationJson, void>> getUsers({
    String? search,
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getUsersRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///
  /// See:
  ///  * [getUsers] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUsersResponseApplicationJson, void> getUsersRaw({
    String? search,
    int? limit,
    int? offset,
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
    var $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    $search ??= '';
    parameters['search'] = $search;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    parameters['limit'] = $limit;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users{?search*,limit*,offset*}').expand(parameters);
    return DynamiteRawResponse<UsersGetUsersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUsersResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Create a new user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userid] ID of the user.
  ///   * [password] Password of the user. Defaults to `''`.
  ///   * [displayName] Display name of the user. Defaults to `''`.
  ///   * [email] Email of the user. Defaults to `''`.
  ///   * [groups] Groups of the user. Defaults to `[]`.
  ///   * [subadmin] Groups where the user is subadmin. Defaults to `[]`.
  ///   * [quota] Quota of the user. Defaults to `''`.
  ///   * [language] Language of the user. Defaults to `''`.
  ///   * [manager] Manager of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added successfully
  ///   * 403: Missing permissions to make user subadmin
  ///
  /// See:
  ///  * [addUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersAddUserResponseApplicationJson, void>> addUser({
    required String userid,
    String? password,
    String? displayName,
    String? email,
    BuiltList<String>? groups,
    BuiltList<String>? subadmin,
    String? quota,
    String? language,
    String? manager,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = addUserRaw(
      userid: userid,
      password: password,
      displayName: displayName,
      email: email,
      groups: groups,
      subadmin: subadmin,
      quota: quota,
      language: language,
      manager: manager,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a new user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userid] ID of the user.
  ///   * [password] Password of the user. Defaults to `''`.
  ///   * [displayName] Display name of the user. Defaults to `''`.
  ///   * [email] Email of the user. Defaults to `''`.
  ///   * [groups] Groups of the user. Defaults to `[]`.
  ///   * [subadmin] Groups where the user is subadmin. Defaults to `[]`.
  ///   * [quota] Quota of the user. Defaults to `''`.
  ///   * [language] Language of the user. Defaults to `''`.
  ///   * [manager] Manager of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added successfully
  ///   * 403: Missing permissions to make user subadmin
  ///
  /// See:
  ///  * [addUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersAddUserResponseApplicationJson, void> addUserRaw({
    required String userid,
    String? password,
    String? displayName,
    String? email,
    BuiltList<String>? groups,
    BuiltList<String>? subadmin,
    String? quota,
    String? language,
    String? manager,
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
    final $userid = jsonSerializers.serialize(userid, specifiedType: const FullType(String));
    parameters['userid'] = $userid;

    var $password = jsonSerializers.serialize(password, specifiedType: const FullType(String));
    $password ??= '';
    parameters['password'] = $password;

    var $displayName = jsonSerializers.serialize(displayName, specifiedType: const FullType(String));
    $displayName ??= '';
    parameters['displayName'] = $displayName;

    var $email = jsonSerializers.serialize(email, specifiedType: const FullType(String));
    $email ??= '';
    parameters['email'] = $email;

    var $groups = jsonSerializers.serialize(groups, specifiedType: const FullType(BuiltList, [FullType(String)]));
    $groups ??= [];
    parameters['groups%5B%5D'] = $groups;

    var $subadmin = jsonSerializers.serialize(subadmin, specifiedType: const FullType(BuiltList, [FullType(String)]));
    $subadmin ??= [];
    parameters['subadmin%5B%5D'] = $subadmin;

    var $quota = jsonSerializers.serialize(quota, specifiedType: const FullType(String));
    $quota ??= '';
    parameters['quota'] = $quota;

    var $language = jsonSerializers.serialize(language, specifiedType: const FullType(String));
    $language ??= '';
    parameters['language'] = $language;

    final $manager = jsonSerializers.serialize(manager, specifiedType: const FullType(String));
    parameters['manager'] = $manager;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate(
      '/ocs/v2.php/cloud/users{?userid*,password*,displayName*,email*,groups%5B%5D*,subadmin%5B%5D*,quota*,language*,manager*}',
    ).expand(parameters);
    return DynamiteRawResponse<UsersAddUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersAddUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of users and their details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users details returned
  ///
  /// See:
  ///  * [getUsersDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUsersDetailsResponseApplicationJson, void>> getUsersDetails({
    String? search,
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getUsersDetailsRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users and their details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users details returned
  ///
  /// See:
  ///  * [getUsersDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUsersDetailsResponseApplicationJson, void> getUsersDetailsRaw({
    String? search,
    int? limit,
    int? offset,
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
    var $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    $search ??= '';
    parameters['search'] = $search;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    parameters['limit'] = $limit;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/details{?search*,limit*,offset*}').expand(parameters);
    return DynamiteRawResponse<UsersGetUsersDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUsersDetailsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the list of disabled users and their details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Limit the amount of users returned.
  ///   * [offset] Offset. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Disabled users details returned
  ///
  /// See:
  ///  * [getDisabledUsersDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetDisabledUsersDetailsResponseApplicationJson, void>> getDisabledUsersDetails({
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getDisabledUsersDetailsRaw(
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the list of disabled users and their details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Limit the amount of users returned.
  ///   * [offset] Offset. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Disabled users details returned
  ///
  /// See:
  ///  * [getDisabledUsersDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetDisabledUsersDetailsResponseApplicationJson, void> getDisabledUsersDetailsRaw({
    int? limit,
    int? offset,
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
    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    parameters['limit'] = $limit;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/disabled{?limit*,offset*}').expand(parameters);
    return DynamiteRawResponse<UsersGetDisabledUsersDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Search users by their phone numbers.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [location] Location of the phone number (for country code).
  ///   * [search] Phone numbers to search for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///   * 400: Invalid location
  ///
  /// See:
  ///  * [searchByPhoneNumbersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersSearchByPhoneNumbersResponseApplicationJson, void>> searchByPhoneNumbers({
    required String location,
    required ContentString<BuiltMap<String, BuiltList<String>>> search,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = searchByPhoneNumbersRaw(
      location: location,
      search: search,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search users by their phone numbers.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [location] Location of the phone number (for country code).
  ///   * [search] Phone numbers to search for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///   * 400: Invalid location
  ///
  /// See:
  ///  * [searchByPhoneNumbers] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersSearchByPhoneNumbersResponseApplicationJson, void> searchByPhoneNumbersRaw({
    required String location,
    required ContentString<BuiltMap<String, BuiltList<String>>> search,
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
    final $location = jsonSerializers.serialize(location, specifiedType: const FullType(String));
    parameters['location'] = $location;

    final $search = jsonSerializers.serialize(
      search,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
      ]),
    );
    parameters['search'] = $search;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/search/by-phone{?location*,search*}').expand(parameters);
    return DynamiteRawResponse<UsersSearchByPhoneNumbersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersSearchByPhoneNumbersResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the details of a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User returned
  ///
  /// See:
  ///  * [getUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUserResponseApplicationJson, void>> getUser({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the details of a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User returned
  ///
  /// See:
  ///  * [getUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUserResponseApplicationJson, void> getUserRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}').expand(parameters);
    return DynamiteRawResponse<UsersGetUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update a value of the user's details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User value edited successfully
  ///
  /// See:
  ///  * [editUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersEditUserResponseApplicationJson, void>> editUser({
    required String key,
    required String value,
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = editUserRaw(
      key: key,
      value: value,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a value of the user's details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User value edited successfully
  ///
  /// See:
  ///  * [editUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersEditUserResponseApplicationJson, void> editUserRaw({
    required String key,
    required String value,
    required String userId,
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
    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    parameters['key'] = $key;

    final $value = jsonSerializers.serialize(value, specifiedType: const FullType(String));
    parameters['value'] = $value;

    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}{?key*,value*}').expand(parameters);
    return DynamiteRawResponse<UsersEditUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersEditUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User deleted successfully
  ///
  /// See:
  ///  * [deleteUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersDeleteUserResponseApplicationJson, void>> deleteUser({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = deleteUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User deleted successfully
  ///
  /// See:
  ///  * [deleteUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersDeleteUserResponseApplicationJson, void> deleteUserRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}').expand(parameters);
    return DynamiteRawResponse<UsersDeleteUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersDeleteUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the details of the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Current user returned
  ///
  /// See:
  ///  * [getCurrentUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetCurrentUserResponseApplicationJson, void>> getCurrentUser({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getCurrentUserRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the details of the current user.
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
  ///   * 200: Current user returned
  ///
  /// See:
  ///  * [getCurrentUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetCurrentUserResponseApplicationJson, void> getCurrentUserRaw({bool? oCSAPIRequest}) {
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

    final path = UriTemplate('/ocs/v2.php/cloud/user').expand(parameters);
    return DynamiteRawResponse<UsersGetCurrentUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetCurrentUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of fields that are editable for the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields returned
  ///
  /// See:
  ///  * [getEditableFieldsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetEditableFieldsResponseApplicationJson, void>> getEditableFields({
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getEditableFieldsRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of fields that are editable for the current user.
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
  ///   * 200: Editable fields returned
  ///
  /// See:
  ///  * [getEditableFields] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetEditableFieldsResponseApplicationJson, void> getEditableFieldsRaw({bool? oCSAPIRequest}) {
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

    final path = UriTemplate('/ocs/v2.php/cloud/user/fields').expand(parameters);
    return DynamiteRawResponse<UsersGetEditableFieldsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetEditableFieldsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of fields that are editable for a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields for user returned
  ///
  /// See:
  ///  * [getEditableFieldsForUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetEditableFieldsForUserResponseApplicationJson, void>> getEditableFieldsForUser({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getEditableFieldsForUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of fields that are editable for a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields for user returned
  ///
  /// See:
  ///  * [getEditableFieldsForUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetEditableFieldsForUserResponseApplicationJson, void> getEditableFieldsForUserRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/user/fields/{userId}').expand(parameters);
    return DynamiteRawResponse<UsersGetEditableFieldsForUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetEditableFieldsForUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Update multiple values of the user's details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [collectionName] Collection to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User values edited successfully
  ///
  /// See:
  ///  * [editUserMultiValueRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersEditUserMultiValueResponseApplicationJson, void>> editUserMultiValue({
    required String key,
    required String value,
    required String userId,
    required String collectionName,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = editUserMultiValueRaw(
      key: key,
      value: value,
      userId: userId,
      collectionName: collectionName,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update multiple values of the user's details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [collectionName] Collection to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User values edited successfully
  ///
  /// See:
  ///  * [editUserMultiValue] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersEditUserMultiValueResponseApplicationJson, void> editUserMultiValueRaw({
    required String key,
    required String value,
    required String userId,
    required String collectionName,
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
    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    parameters['key'] = $key;

    final $value = jsonSerializers.serialize(value, specifiedType: const FullType(String));
    parameters['value'] = $value;

    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    final $collectionName = jsonSerializers.serialize(collectionName, specifiedType: const FullType(String));
    dynamite_utils.checkPattern(
      $collectionName as String?,
      RegExp(r'^(?!enable$|disable$)[a-zA-Z0-9_]*$'),
      'collectionName',
    );
    parameters['collectionName'] = $collectionName;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/{collectionName}{?key*,value*}').expand(parameters);
    return DynamiteRawResponse<UsersEditUserMultiValueResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersEditUserMultiValueResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Wipe all devices of a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Wiped all user devices successfully
  ///
  /// See:
  ///  * [wipeUserDevicesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersWipeUserDevicesResponseApplicationJson, void>> wipeUserDevices({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = wipeUserDevicesRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Wipe all devices of a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Wiped all user devices successfully
  ///
  /// See:
  ///  * [wipeUserDevices] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersWipeUserDevicesResponseApplicationJson, void> wipeUserDevicesRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/wipe').expand(parameters);
    return DynamiteRawResponse<UsersWipeUserDevicesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersWipeUserDevicesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Enable a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User enabled successfully
  ///
  /// See:
  ///  * [enableUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersEnableUserResponseApplicationJson, void>> enableUser({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = enableUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Enable a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User enabled successfully
  ///
  /// See:
  ///  * [enableUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersEnableUserResponseApplicationJson, void> enableUserRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/enable').expand(parameters);
    return DynamiteRawResponse<UsersEnableUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersEnableUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Disable a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User disabled successfully
  ///
  /// See:
  ///  * [disableUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersDisableUserResponseApplicationJson, void>> disableUser({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = disableUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disable a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User disabled successfully
  ///
  /// See:
  ///  * [disableUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersDisableUserResponseApplicationJson, void> disableUserRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/disable').expand(parameters);
    return DynamiteRawResponse<UsersDisableUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersDisableUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a list of groups the user belongs to.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users groups returned
  ///
  /// See:
  ///  * [getUsersGroupsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUsersGroupsResponseApplicationJson, void>> getUsersGroups({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getUsersGroupsRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of groups the user belongs to.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users groups returned
  ///
  /// See:
  ///  * [getUsersGroups] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUsersGroupsResponseApplicationJson, void> getUsersGroupsRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/groups').expand(parameters);
    return DynamiteRawResponse<UsersGetUsersGroupsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUsersGroupsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Add a user to a group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group. Defaults to `''`.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added to group successfully
  ///
  /// See:
  ///  * [addToGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersAddToGroupResponseApplicationJson, void>> addToGroup({
    required String userId,
    String? groupid,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = addToGroupRaw(
      userId: userId,
      groupid: groupid,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Add a user to a group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group. Defaults to `''`.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added to group successfully
  ///
  /// See:
  ///  * [addToGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersAddToGroupResponseApplicationJson, void> addToGroupRaw({
    required String userId,
    String? groupid,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $groupid = jsonSerializers.serialize(groupid, specifiedType: const FullType(String));
    $groupid ??= '';
    parameters['groupid'] = $groupid;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/groups{?groupid*}').expand(parameters);
    return DynamiteRawResponse<UsersAddToGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersAddToGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Remove a user from a group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed from group successfully
  ///
  /// See:
  ///  * [removeFromGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersRemoveFromGroupResponseApplicationJson, void>> removeFromGroup({
    required String groupid,
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeFromGroupRaw(
      groupid: groupid,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a user from a group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed from group successfully
  ///
  /// See:
  ///  * [removeFromGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersRemoveFromGroupResponseApplicationJson, void> removeFromGroupRaw({
    required String groupid,
    required String userId,
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
    final $groupid = jsonSerializers.serialize(groupid, specifiedType: const FullType(String));
    parameters['groupid'] = $groupid;

    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/groups{?groupid*}').expand(parameters);
    return DynamiteRawResponse<UsersRemoveFromGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersRemoveFromGroupResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the groups a user is a subadmin of.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User subadmin groups returned
  ///
  /// See:
  ///  * [getUserSubAdminGroupsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUserSubAdminGroupsResponseApplicationJson, void>> getUserSubAdminGroups({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = getUserSubAdminGroupsRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the groups a user is a subadmin of.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User subadmin groups returned
  ///
  /// See:
  ///  * [getUserSubAdminGroups] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUserSubAdminGroupsResponseApplicationJson, void> getUserSubAdminGroupsRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/subadmins').expand(parameters);
    return DynamiteRawResponse<UsersGetUserSubAdminGroupsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Make a user a subadmin of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added as group subadmin successfully
  ///
  /// See:
  ///  * [addSubAdminRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersAddSubAdminResponseApplicationJson, void>> addSubAdmin({
    required String groupid,
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = addSubAdminRaw(
      groupid: groupid,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Make a user a subadmin of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added as group subadmin successfully
  ///
  /// See:
  ///  * [addSubAdmin] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersAddSubAdminResponseApplicationJson, void> addSubAdminRaw({
    required String groupid,
    required String userId,
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
    final $groupid = jsonSerializers.serialize(groupid, specifiedType: const FullType(String));
    parameters['groupid'] = $groupid;

    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/subadmins{?groupid*}').expand(parameters);
    return DynamiteRawResponse<UsersAddSubAdminResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersAddSubAdminResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Remove a user from the subadmins of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed as group subadmin successfully
  ///
  /// See:
  ///  * [removeSubAdminRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersRemoveSubAdminResponseApplicationJson, void>> removeSubAdmin({
    required String groupid,
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeSubAdminRaw(
      groupid: groupid,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a user from the subadmins of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed as group subadmin successfully
  ///
  /// See:
  ///  * [removeSubAdmin] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersRemoveSubAdminResponseApplicationJson, void> removeSubAdminRaw({
    required String groupid,
    required String userId,
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
    final $groupid = jsonSerializers.serialize(groupid, specifiedType: const FullType(String));
    parameters['groupid'] = $groupid;

    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/subadmins{?groupid*}').expand(parameters);
    return DynamiteRawResponse<UsersRemoveSubAdminResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersRemoveSubAdminResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Resend the welcome message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Resent welcome message successfully
  ///
  /// See:
  ///  * [resendWelcomeMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersResendWelcomeMessageResponseApplicationJson, void>> resendWelcomeMessage({
    required String userId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = resendWelcomeMessageRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Resend the welcome message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Resent welcome message successfully
  ///
  /// See:
  ///  * [resendWelcomeMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersResendWelcomeMessageResponseApplicationJson, void> resendWelcomeMessageRaw({
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/cloud/users/{userId}/welcome').expand(parameters);
    return DynamiteRawResponse<UsersResendWelcomeMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersResendWelcomeMessageResponseApplicationJson),
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
abstract interface class $AppConfigGetAppsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
}

abstract class AppConfigGetAppsResponseApplicationJson_Ocs_Data
    implements
        $AppConfigGetAppsResponseApplicationJson_Ocs_DataInterface,
        Built<AppConfigGetAppsResponseApplicationJson_Ocs_Data,
            AppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder> {
  factory AppConfigGetAppsResponseApplicationJson_Ocs_Data([
    void Function(AppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppConfigGetAppsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppConfigGetAppsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetAppsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetAppsResponseApplicationJson_Ocs_Data> get serializer =>
      _$appConfigGetAppsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetAppsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppConfigGetAppsResponseApplicationJson_Ocs_Data get data;
}

abstract class AppConfigGetAppsResponseApplicationJson_Ocs
    implements
        $AppConfigGetAppsResponseApplicationJson_OcsInterface,
        Built<AppConfigGetAppsResponseApplicationJson_Ocs, AppConfigGetAppsResponseApplicationJson_OcsBuilder> {
  factory AppConfigGetAppsResponseApplicationJson_Ocs([
    void Function(AppConfigGetAppsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigGetAppsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigGetAppsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetAppsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetAppsResponseApplicationJson_Ocs> get serializer =>
      _$appConfigGetAppsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetAppsResponseApplicationJsonInterface {
  AppConfigGetAppsResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigGetAppsResponseApplicationJson
    implements
        $AppConfigGetAppsResponseApplicationJsonInterface,
        Built<AppConfigGetAppsResponseApplicationJson, AppConfigGetAppsResponseApplicationJsonBuilder> {
  factory AppConfigGetAppsResponseApplicationJson([void Function(AppConfigGetAppsResponseApplicationJsonBuilder)? b]) =
      _$AppConfigGetAppsResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigGetAppsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetAppsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetAppsResponseApplicationJson> get serializer =>
      _$appConfigGetAppsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetKeysResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
}

abstract class AppConfigGetKeysResponseApplicationJson_Ocs_Data
    implements
        $AppConfigGetKeysResponseApplicationJson_Ocs_DataInterface,
        Built<AppConfigGetKeysResponseApplicationJson_Ocs_Data,
            AppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder> {
  factory AppConfigGetKeysResponseApplicationJson_Ocs_Data([
    void Function(AppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppConfigGetKeysResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppConfigGetKeysResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetKeysResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetKeysResponseApplicationJson_Ocs_Data> get serializer =>
      _$appConfigGetKeysResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetKeysResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppConfigGetKeysResponseApplicationJson_Ocs_Data get data;
}

abstract class AppConfigGetKeysResponseApplicationJson_Ocs
    implements
        $AppConfigGetKeysResponseApplicationJson_OcsInterface,
        Built<AppConfigGetKeysResponseApplicationJson_Ocs, AppConfigGetKeysResponseApplicationJson_OcsBuilder> {
  factory AppConfigGetKeysResponseApplicationJson_Ocs([
    void Function(AppConfigGetKeysResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigGetKeysResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigGetKeysResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetKeysResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetKeysResponseApplicationJson_Ocs> get serializer =>
      _$appConfigGetKeysResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetKeysResponseApplicationJsonInterface {
  AppConfigGetKeysResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigGetKeysResponseApplicationJson
    implements
        $AppConfigGetKeysResponseApplicationJsonInterface,
        Built<AppConfigGetKeysResponseApplicationJson, AppConfigGetKeysResponseApplicationJsonBuilder> {
  factory AppConfigGetKeysResponseApplicationJson([void Function(AppConfigGetKeysResponseApplicationJsonBuilder)? b]) =
      _$AppConfigGetKeysResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigGetKeysResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetKeysResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetKeysResponseApplicationJson> get serializer =>
      _$appConfigGetKeysResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetValueResponseApplicationJson_Ocs_DataInterface {
  String get data;
}

abstract class AppConfigGetValueResponseApplicationJson_Ocs_Data
    implements
        $AppConfigGetValueResponseApplicationJson_Ocs_DataInterface,
        Built<AppConfigGetValueResponseApplicationJson_Ocs_Data,
            AppConfigGetValueResponseApplicationJson_Ocs_DataBuilder> {
  factory AppConfigGetValueResponseApplicationJson_Ocs_Data([
    void Function(AppConfigGetValueResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppConfigGetValueResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppConfigGetValueResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetValueResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetValueResponseApplicationJson_Ocs_Data> get serializer =>
      _$appConfigGetValueResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetValueResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppConfigGetValueResponseApplicationJson_Ocs_Data get data;
}

abstract class AppConfigGetValueResponseApplicationJson_Ocs
    implements
        $AppConfigGetValueResponseApplicationJson_OcsInterface,
        Built<AppConfigGetValueResponseApplicationJson_Ocs, AppConfigGetValueResponseApplicationJson_OcsBuilder> {
  factory AppConfigGetValueResponseApplicationJson_Ocs([
    void Function(AppConfigGetValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigGetValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigGetValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetValueResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetValueResponseApplicationJson_Ocs> get serializer =>
      _$appConfigGetValueResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigGetValueResponseApplicationJsonInterface {
  AppConfigGetValueResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigGetValueResponseApplicationJson
    implements
        $AppConfigGetValueResponseApplicationJsonInterface,
        Built<AppConfigGetValueResponseApplicationJson, AppConfigGetValueResponseApplicationJsonBuilder> {
  factory AppConfigGetValueResponseApplicationJson([
    void Function(AppConfigGetValueResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigGetValueResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigGetValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetValueResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigGetValueResponseApplicationJson> get serializer =>
      _$appConfigGetValueResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigSetValueResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppConfigSetValueResponseApplicationJson_Ocs
    implements
        $AppConfigSetValueResponseApplicationJson_OcsInterface,
        Built<AppConfigSetValueResponseApplicationJson_Ocs, AppConfigSetValueResponseApplicationJson_OcsBuilder> {
  factory AppConfigSetValueResponseApplicationJson_Ocs([
    void Function(AppConfigSetValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigSetValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigSetValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigSetValueResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigSetValueResponseApplicationJson_Ocs> get serializer =>
      _$appConfigSetValueResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigSetValueResponseApplicationJsonInterface {
  AppConfigSetValueResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigSetValueResponseApplicationJson
    implements
        $AppConfigSetValueResponseApplicationJsonInterface,
        Built<AppConfigSetValueResponseApplicationJson, AppConfigSetValueResponseApplicationJsonBuilder> {
  factory AppConfigSetValueResponseApplicationJson([
    void Function(AppConfigSetValueResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigSetValueResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigSetValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigSetValueResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigSetValueResponseApplicationJson> get serializer =>
      _$appConfigSetValueResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigDeleteKeyResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppConfigDeleteKeyResponseApplicationJson_Ocs
    implements
        $AppConfigDeleteKeyResponseApplicationJson_OcsInterface,
        Built<AppConfigDeleteKeyResponseApplicationJson_Ocs, AppConfigDeleteKeyResponseApplicationJson_OcsBuilder> {
  factory AppConfigDeleteKeyResponseApplicationJson_Ocs([
    void Function(AppConfigDeleteKeyResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigDeleteKeyResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigDeleteKeyResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigDeleteKeyResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigDeleteKeyResponseApplicationJson_Ocs> get serializer =>
      _$appConfigDeleteKeyResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppConfigDeleteKeyResponseApplicationJsonInterface {
  AppConfigDeleteKeyResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigDeleteKeyResponseApplicationJson
    implements
        $AppConfigDeleteKeyResponseApplicationJsonInterface,
        Built<AppConfigDeleteKeyResponseApplicationJson, AppConfigDeleteKeyResponseApplicationJsonBuilder> {
  factory AppConfigDeleteKeyResponseApplicationJson([
    void Function(AppConfigDeleteKeyResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigDeleteKeyResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigDeleteKeyResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigDeleteKeyResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppConfigDeleteKeyResponseApplicationJson> get serializer =>
      _$appConfigDeleteKeyResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsGetAppsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get apps;
}

abstract class AppsGetAppsResponseApplicationJson_Ocs_Data
    implements
        $AppsGetAppsResponseApplicationJson_Ocs_DataInterface,
        Built<AppsGetAppsResponseApplicationJson_Ocs_Data, AppsGetAppsResponseApplicationJson_Ocs_DataBuilder> {
  factory AppsGetAppsResponseApplicationJson_Ocs_Data([
    void Function(AppsGetAppsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppsGetAppsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppsGetAppsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsGetAppsResponseApplicationJson_Ocs_Data> get serializer =>
      _$appsGetAppsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsGetAppsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppsGetAppsResponseApplicationJson_Ocs_Data get data;
}

abstract class AppsGetAppsResponseApplicationJson_Ocs
    implements
        $AppsGetAppsResponseApplicationJson_OcsInterface,
        Built<AppsGetAppsResponseApplicationJson_Ocs, AppsGetAppsResponseApplicationJson_OcsBuilder> {
  factory AppsGetAppsResponseApplicationJson_Ocs([void Function(AppsGetAppsResponseApplicationJson_OcsBuilder)? b]) =
      _$AppsGetAppsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsGetAppsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsGetAppsResponseApplicationJson_Ocs> get serializer =>
      _$appsGetAppsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsGetAppsResponseApplicationJsonInterface {
  AppsGetAppsResponseApplicationJson_Ocs get ocs;
}

abstract class AppsGetAppsResponseApplicationJson
    implements
        $AppsGetAppsResponseApplicationJsonInterface,
        Built<AppsGetAppsResponseApplicationJson, AppsGetAppsResponseApplicationJsonBuilder> {
  factory AppsGetAppsResponseApplicationJson([void Function(AppsGetAppsResponseApplicationJsonBuilder)? b]) =
      _$AppsGetAppsResponseApplicationJson;

  // coverage:ignore-start
  const AppsGetAppsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsGetAppsResponseApplicationJson> get serializer =>
      _$appsGetAppsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppInfoInterface {
  bool? get active;
  JsonObject? get activity;
  JsonObject? get author;
  @BuiltValueField(wireName: 'background-jobs')
  JsonObject? get backgroundJobs;
  JsonObject? get bugs;
  JsonObject? get category;
  JsonObject? get collaboration;
  JsonObject? get commands;
  @BuiltValueField(wireName: 'default_enable')
  JsonObject? get defaultEnable;
  JsonObject? get dependencies;
  String get description;
  JsonObject? get discussion;
  JsonObject? get documentation;
  JsonObject? get groups;
  String get id;
  JsonObject? get info;
  bool? get internal;
  int? get level;
  JsonObject? get licence;
  String get name;
  JsonObject? get namespace;
  JsonObject? get navigations;
  JsonObject? get preview;
  bool? get previewAsIcon;
  JsonObject? get public;
  JsonObject? get remote;
  bool? get removable;
  @BuiltValueField(wireName: 'repair-steps')
  JsonObject? get repairSteps;
  JsonObject? get repository;
  JsonObject? get sabre;
  JsonObject? get screenshot;
  JsonObject? get settings;
  String get summary;
  JsonObject? get trash;
  @BuiltValueField(wireName: 'two-factor-providers')
  JsonObject? get twoFactorProviders;
  JsonObject? get types;
  String get version;
  JsonObject? get versions;
  JsonObject? get website;
}

abstract class AppInfo implements $AppInfoInterface, Built<AppInfo, AppInfoBuilder> {
  factory AppInfo([void Function(AppInfoBuilder)? b]) = _$AppInfo;

  // coverage:ignore-start
  const AppInfo._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppInfo.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppInfo> get serializer => _$appInfoSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsGetAppInfoResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppInfo get data;
}

abstract class AppsGetAppInfoResponseApplicationJson_Ocs
    implements
        $AppsGetAppInfoResponseApplicationJson_OcsInterface,
        Built<AppsGetAppInfoResponseApplicationJson_Ocs, AppsGetAppInfoResponseApplicationJson_OcsBuilder> {
  factory AppsGetAppInfoResponseApplicationJson_Ocs([
    void Function(AppsGetAppInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppsGetAppInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsGetAppInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppInfoResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsGetAppInfoResponseApplicationJson_Ocs> get serializer =>
      _$appsGetAppInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsGetAppInfoResponseApplicationJsonInterface {
  AppsGetAppInfoResponseApplicationJson_Ocs get ocs;
}

abstract class AppsGetAppInfoResponseApplicationJson
    implements
        $AppsGetAppInfoResponseApplicationJsonInterface,
        Built<AppsGetAppInfoResponseApplicationJson, AppsGetAppInfoResponseApplicationJsonBuilder> {
  factory AppsGetAppInfoResponseApplicationJson([void Function(AppsGetAppInfoResponseApplicationJsonBuilder)? b]) =
      _$AppsGetAppInfoResponseApplicationJson;

  // coverage:ignore-start
  const AppsGetAppInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppInfoResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsGetAppInfoResponseApplicationJson> get serializer =>
      _$appsGetAppInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsEnableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppsEnableResponseApplicationJson_Ocs
    implements
        $AppsEnableResponseApplicationJson_OcsInterface,
        Built<AppsEnableResponseApplicationJson_Ocs, AppsEnableResponseApplicationJson_OcsBuilder> {
  factory AppsEnableResponseApplicationJson_Ocs([void Function(AppsEnableResponseApplicationJson_OcsBuilder)? b]) =
      _$AppsEnableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsEnableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsEnableResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsEnableResponseApplicationJson_Ocs> get serializer =>
      _$appsEnableResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsEnableResponseApplicationJsonInterface {
  AppsEnableResponseApplicationJson_Ocs get ocs;
}

abstract class AppsEnableResponseApplicationJson
    implements
        $AppsEnableResponseApplicationJsonInterface,
        Built<AppsEnableResponseApplicationJson, AppsEnableResponseApplicationJsonBuilder> {
  factory AppsEnableResponseApplicationJson([void Function(AppsEnableResponseApplicationJsonBuilder)? b]) =
      _$AppsEnableResponseApplicationJson;

  // coverage:ignore-start
  const AppsEnableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsEnableResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsEnableResponseApplicationJson> get serializer => _$appsEnableResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsDisableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppsDisableResponseApplicationJson_Ocs
    implements
        $AppsDisableResponseApplicationJson_OcsInterface,
        Built<AppsDisableResponseApplicationJson_Ocs, AppsDisableResponseApplicationJson_OcsBuilder> {
  factory AppsDisableResponseApplicationJson_Ocs([void Function(AppsDisableResponseApplicationJson_OcsBuilder)? b]) =
      _$AppsDisableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsDisableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsDisableResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsDisableResponseApplicationJson_Ocs> get serializer =>
      _$appsDisableResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppsDisableResponseApplicationJsonInterface {
  AppsDisableResponseApplicationJson_Ocs get ocs;
}

abstract class AppsDisableResponseApplicationJson
    implements
        $AppsDisableResponseApplicationJsonInterface,
        Built<AppsDisableResponseApplicationJson, AppsDisableResponseApplicationJsonBuilder> {
  factory AppsDisableResponseApplicationJson([void Function(AppsDisableResponseApplicationJsonBuilder)? b]) =
      _$AppsDisableResponseApplicationJson;

  // coverage:ignore-start
  const AppsDisableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsDisableResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppsDisableResponseApplicationJson> get serializer =>
      _$appsDisableResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
}

abstract class GroupsGetGroupsResponseApplicationJson_Ocs_Data
    implements
        $GroupsGetGroupsResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupsResponseApplicationJson_Ocs_Data, GroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupsResponseApplicationJson_Ocs_Data([
    void Function(GroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupsResponseApplicationJson_Ocs_Data> get serializer =>
      _$groupsGetGroupsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupsResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupsResponseApplicationJson_Ocs
    implements
        $GroupsGetGroupsResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupsResponseApplicationJson_Ocs, GroupsGetGroupsResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupsResponseApplicationJson_Ocs([
    void Function(GroupsGetGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupsResponseApplicationJson_Ocs> get serializer =>
      _$groupsGetGroupsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupsResponseApplicationJsonInterface {
  GroupsGetGroupsResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupsResponseApplicationJson
    implements
        $GroupsGetGroupsResponseApplicationJsonInterface,
        Built<GroupsGetGroupsResponseApplicationJson, GroupsGetGroupsResponseApplicationJsonBuilder> {
  factory GroupsGetGroupsResponseApplicationJson([void Function(GroupsGetGroupsResponseApplicationJsonBuilder)? b]) =
      _$GroupsGetGroupsResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupsResponseApplicationJson> get serializer =>
      _$groupsGetGroupsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsAddGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GroupsAddGroupResponseApplicationJson_Ocs
    implements
        $GroupsAddGroupResponseApplicationJson_OcsInterface,
        Built<GroupsAddGroupResponseApplicationJson_Ocs, GroupsAddGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsAddGroupResponseApplicationJson_Ocs([
    void Function(GroupsAddGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsAddGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsAddGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsAddGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsAddGroupResponseApplicationJson_Ocs> get serializer =>
      _$groupsAddGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsAddGroupResponseApplicationJsonInterface {
  GroupsAddGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsAddGroupResponseApplicationJson
    implements
        $GroupsAddGroupResponseApplicationJsonInterface,
        Built<GroupsAddGroupResponseApplicationJson, GroupsAddGroupResponseApplicationJsonBuilder> {
  factory GroupsAddGroupResponseApplicationJson([void Function(GroupsAddGroupResponseApplicationJsonBuilder)? b]) =
      _$GroupsAddGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsAddGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsAddGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsAddGroupResponseApplicationJson> get serializer =>
      _$groupsAddGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupDetailsInterface {
  String get id;
  String get displayname;
  GroupDetails_Usercount get usercount;
  GroupDetails_Disabled get disabled;
  bool get canAdd;
  bool get canRemove;
}

abstract class GroupDetails implements $GroupDetailsInterface, Built<GroupDetails, GroupDetailsBuilder> {
  factory GroupDetails([void Function(GroupDetailsBuilder)? b]) = _$GroupDetails;

  // coverage:ignore-start
  const GroupDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupDetails.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupDetails> get serializer => _$groupDetailsSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(GroupDetailsBuilder b) {
    b.usercount?.validateOneOf();
    b.disabled?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<GroupDetails> get groups;
}

abstract class GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data
    implements
        $GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data,
            GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data([
    void Function(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$groupsGetGroupsDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupsDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupsDetailsResponseApplicationJson_Ocs
    implements
        $GroupsGetGroupsDetailsResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupsDetailsResponseApplicationJson_Ocs,
            GroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs([
    void Function(GroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupsDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupsDetailsResponseApplicationJson_Ocs> get serializer =>
      _$groupsGetGroupsDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupsDetailsResponseApplicationJsonInterface {
  GroupsGetGroupsDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupsDetailsResponseApplicationJson
    implements
        $GroupsGetGroupsDetailsResponseApplicationJsonInterface,
        Built<GroupsGetGroupsDetailsResponseApplicationJson, GroupsGetGroupsDetailsResponseApplicationJsonBuilder> {
  factory GroupsGetGroupsDetailsResponseApplicationJson([
    void Function(GroupsGetGroupsDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupsDetailsResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupsDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsDetailsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupsDetailsResponseApplicationJson> get serializer =>
      _$groupsGetGroupsDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
}

abstract class GroupsGetGroupUsersResponseApplicationJson_Ocs_Data
    implements
        $GroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupUsersResponseApplicationJson_Ocs_Data,
            GroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs_Data([
    void Function(GroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupUsersResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupUsersResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersResponseApplicationJson_Ocs_Data> get serializer =>
      _$groupsGetGroupUsersResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupUsersResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupUsersResponseApplicationJson_Ocs
    implements
        $GroupsGetGroupUsersResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupUsersResponseApplicationJson_Ocs, GroupsGetGroupUsersResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs([
    void Function(GroupsGetGroupUsersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupUsersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupUsersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersResponseApplicationJson_Ocs> get serializer =>
      _$groupsGetGroupUsersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersResponseApplicationJsonInterface {
  GroupsGetGroupUsersResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupUsersResponseApplicationJson
    implements
        $GroupsGetGroupUsersResponseApplicationJsonInterface,
        Built<GroupsGetGroupUsersResponseApplicationJson, GroupsGetGroupUsersResponseApplicationJsonBuilder> {
  factory GroupsGetGroupUsersResponseApplicationJson([
    void Function(GroupsGetGroupUsersResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupUsersResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupUsersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersResponseApplicationJson> get serializer =>
      _$groupsGetGroupUsersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserDetails_BackendCapabilitiesInterface {
  bool get setDisplayName;
  bool get setPassword;
}

abstract class UserDetails_BackendCapabilities
    implements
        $UserDetails_BackendCapabilitiesInterface,
        Built<UserDetails_BackendCapabilities, UserDetails_BackendCapabilitiesBuilder> {
  factory UserDetails_BackendCapabilities([void Function(UserDetails_BackendCapabilitiesBuilder)? b]) =
      _$UserDetails_BackendCapabilities;

  // coverage:ignore-start
  const UserDetails_BackendCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetails_BackendCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserDetails_BackendCapabilities> get serializer => _$userDetailsBackendCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserDetailsQuotaInterface {
  num get free;
  UserDetailsQuota_Quota? get quota;
  num get relative;
  num get total;
  num get used;
}

abstract class UserDetailsQuota
    implements $UserDetailsQuotaInterface, Built<UserDetailsQuota, UserDetailsQuotaBuilder> {
  factory UserDetailsQuota([void Function(UserDetailsQuotaBuilder)? b]) = _$UserDetailsQuota;

  // coverage:ignore-start
  const UserDetailsQuota._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserDetailsQuota> get serializer => _$userDetailsQuotaSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(UserDetailsQuotaBuilder b) {
    b.quota?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $UserDetailsInterface {
  @BuiltValueField(wireName: 'additional_mail')
  BuiltList<String> get additionalMail;
  @BuiltValueField(wireName: 'additional_mailScope')
  BuiltList<String>? get additionalMailScope;
  String get address;
  String? get addressScope;
  String? get avatarScope;
  String get backend;
  UserDetails_BackendCapabilities get backendCapabilities;
  String get biography;
  String? get biographyScope;
  @BuiltValueField(wireName: 'display-name')
  String? get displayName;
  String? get displayname;
  String? get displaynameScope;
  String? get email;
  String? get emailScope;
  bool? get enabled;
  String get fediverse;
  String? get fediverseScope;
  BuiltList<String> get groups;
  String get headline;
  String? get headlineScope;
  String get id;
  String get language;
  int get lastLogin;
  String get locale;
  String? get manager;
  @BuiltValueField(wireName: 'notify_email')
  String? get notifyEmail;
  String get organisation;
  String? get organisationScope;
  String get phone;
  String? get phoneScope;
  @BuiltValueField(wireName: 'profile_enabled')
  String get profileEnabled;
  @BuiltValueField(wireName: 'profile_enabledScope')
  String? get profileEnabledScope;
  UserDetailsQuota get quota;
  String get role;
  String? get roleScope;
  String? get storageLocation;
  BuiltList<String> get subadmin;
  String get twitter;
  String? get twitterScope;
  String get website;
  String? get websiteScope;
}

abstract class UserDetails implements $UserDetailsInterface, Built<UserDetails, UserDetailsBuilder> {
  factory UserDetails([void Function(UserDetailsBuilder)? b]) = _$UserDetails;

  // coverage:ignore-start
  const UserDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetails.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserDetails> get serializer => _$userDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        $GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      _$groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        $GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data,
            GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data([
    void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs
    implements
        $GroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs,
            GroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs([
    void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      _$groupsGetGroupUsersDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupUsersDetailsResponseApplicationJsonInterface {
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson
    implements
        $GroupsGetGroupUsersDetailsResponseApplicationJsonInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson,
            GroupsGetGroupUsersDetailsResponseApplicationJsonBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson([
    void Function(GroupsGetGroupUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson> get serializer =>
      _$groupsGetGroupUsersDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs
    implements
        $GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface,
        Built<GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs,
            GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs([
    void Function(GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs> get serializer =>
      _$groupsGetSubAdminsOfGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetSubAdminsOfGroupResponseApplicationJsonInterface {
  GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetSubAdminsOfGroupResponseApplicationJson
    implements
        $GroupsGetSubAdminsOfGroupResponseApplicationJsonInterface,
        Built<GroupsGetSubAdminsOfGroupResponseApplicationJson,
            GroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder> {
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson([
    void Function(GroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetSubAdminsOfGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetSubAdminsOfGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetSubAdminsOfGroupResponseApplicationJson> get serializer =>
      _$groupsGetSubAdminsOfGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
}

abstract class GroupsGetGroupResponseApplicationJson_Ocs_Data
    implements
        $GroupsGetGroupResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupResponseApplicationJson_Ocs_Data, GroupsGetGroupResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupResponseApplicationJson_Ocs_Data([
    void Function(GroupsGetGroupResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupResponseApplicationJson_Ocs_Data> get serializer =>
      _$groupsGetGroupResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupResponseApplicationJson_Ocs
    implements
        $GroupsGetGroupResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupResponseApplicationJson_Ocs, GroupsGetGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupResponseApplicationJson_Ocs([
    void Function(GroupsGetGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupResponseApplicationJson_Ocs> get serializer =>
      _$groupsGetGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsGetGroupResponseApplicationJsonInterface {
  GroupsGetGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupResponseApplicationJson
    implements
        $GroupsGetGroupResponseApplicationJsonInterface,
        Built<GroupsGetGroupResponseApplicationJson, GroupsGetGroupResponseApplicationJsonBuilder> {
  factory GroupsGetGroupResponseApplicationJson([void Function(GroupsGetGroupResponseApplicationJsonBuilder)? b]) =
      _$GroupsGetGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsGetGroupResponseApplicationJson> get serializer =>
      _$groupsGetGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsUpdateGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GroupsUpdateGroupResponseApplicationJson_Ocs
    implements
        $GroupsUpdateGroupResponseApplicationJson_OcsInterface,
        Built<GroupsUpdateGroupResponseApplicationJson_Ocs, GroupsUpdateGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsUpdateGroupResponseApplicationJson_Ocs([
    void Function(GroupsUpdateGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsUpdateGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsUpdateGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsUpdateGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsUpdateGroupResponseApplicationJson_Ocs> get serializer =>
      _$groupsUpdateGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsUpdateGroupResponseApplicationJsonInterface {
  GroupsUpdateGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsUpdateGroupResponseApplicationJson
    implements
        $GroupsUpdateGroupResponseApplicationJsonInterface,
        Built<GroupsUpdateGroupResponseApplicationJson, GroupsUpdateGroupResponseApplicationJsonBuilder> {
  factory GroupsUpdateGroupResponseApplicationJson([
    void Function(GroupsUpdateGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsUpdateGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsUpdateGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsUpdateGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsUpdateGroupResponseApplicationJson> get serializer =>
      _$groupsUpdateGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsDeleteGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GroupsDeleteGroupResponseApplicationJson_Ocs
    implements
        $GroupsDeleteGroupResponseApplicationJson_OcsInterface,
        Built<GroupsDeleteGroupResponseApplicationJson_Ocs, GroupsDeleteGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsDeleteGroupResponseApplicationJson_Ocs([
    void Function(GroupsDeleteGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsDeleteGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsDeleteGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsDeleteGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsDeleteGroupResponseApplicationJson_Ocs> get serializer =>
      _$groupsDeleteGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GroupsDeleteGroupResponseApplicationJsonInterface {
  GroupsDeleteGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsDeleteGroupResponseApplicationJson
    implements
        $GroupsDeleteGroupResponseApplicationJsonInterface,
        Built<GroupsDeleteGroupResponseApplicationJson, GroupsDeleteGroupResponseApplicationJsonBuilder> {
  factory GroupsDeleteGroupResponseApplicationJson([
    void Function(GroupsDeleteGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsDeleteGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsDeleteGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsDeleteGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GroupsDeleteGroupResponseApplicationJson> get serializer =>
      _$groupsDeleteGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesSetPreferenceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesSetPreferenceResponseApplicationJson_Ocs
    implements
        $PreferencesSetPreferenceResponseApplicationJson_OcsInterface,
        Built<PreferencesSetPreferenceResponseApplicationJson_Ocs,
            PreferencesSetPreferenceResponseApplicationJson_OcsBuilder> {
  factory PreferencesSetPreferenceResponseApplicationJson_Ocs([
    void Function(PreferencesSetPreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesSetPreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesSetPreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetPreferenceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesSetPreferenceResponseApplicationJson_Ocs> get serializer =>
      _$preferencesSetPreferenceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesSetPreferenceResponseApplicationJsonInterface {
  PreferencesSetPreferenceResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesSetPreferenceResponseApplicationJson
    implements
        $PreferencesSetPreferenceResponseApplicationJsonInterface,
        Built<PreferencesSetPreferenceResponseApplicationJson, PreferencesSetPreferenceResponseApplicationJsonBuilder> {
  factory PreferencesSetPreferenceResponseApplicationJson([
    void Function(PreferencesSetPreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesSetPreferenceResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesSetPreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetPreferenceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesSetPreferenceResponseApplicationJson> get serializer =>
      _$preferencesSetPreferenceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesDeletePreferenceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesDeletePreferenceResponseApplicationJson_Ocs
    implements
        $PreferencesDeletePreferenceResponseApplicationJson_OcsInterface,
        Built<PreferencesDeletePreferenceResponseApplicationJson_Ocs,
            PreferencesDeletePreferenceResponseApplicationJson_OcsBuilder> {
  factory PreferencesDeletePreferenceResponseApplicationJson_Ocs([
    void Function(PreferencesDeletePreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesDeletePreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesDeletePreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeletePreferenceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesDeletePreferenceResponseApplicationJson_Ocs> get serializer =>
      _$preferencesDeletePreferenceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesDeletePreferenceResponseApplicationJsonInterface {
  PreferencesDeletePreferenceResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesDeletePreferenceResponseApplicationJson
    implements
        $PreferencesDeletePreferenceResponseApplicationJsonInterface,
        Built<PreferencesDeletePreferenceResponseApplicationJson,
            PreferencesDeletePreferenceResponseApplicationJsonBuilder> {
  factory PreferencesDeletePreferenceResponseApplicationJson([
    void Function(PreferencesDeletePreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesDeletePreferenceResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesDeletePreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeletePreferenceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesDeletePreferenceResponseApplicationJson> get serializer =>
      _$preferencesDeletePreferenceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs
    implements
        $PreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface,
        Built<PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs,
            PreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder> {
  factory PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs([
    void Function(PreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs> get serializer =>
      _$preferencesSetMultiplePreferencesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesSetMultiplePreferencesResponseApplicationJsonInterface {
  PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesSetMultiplePreferencesResponseApplicationJson
    implements
        $PreferencesSetMultiplePreferencesResponseApplicationJsonInterface,
        Built<PreferencesSetMultiplePreferencesResponseApplicationJson,
            PreferencesSetMultiplePreferencesResponseApplicationJsonBuilder> {
  factory PreferencesSetMultiplePreferencesResponseApplicationJson([
    void Function(PreferencesSetMultiplePreferencesResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesSetMultiplePreferencesResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesSetMultiplePreferencesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetMultiplePreferencesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesSetMultiplePreferencesResponseApplicationJson> get serializer =>
      _$preferencesSetMultiplePreferencesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs
    implements
        $PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface,
        Built<PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs,
            PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder> {
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs([
    void Function(PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs> get serializer =>
      _$preferencesDeleteMultiplePreferenceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface {
  PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesDeleteMultiplePreferenceResponseApplicationJson
    implements
        $PreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface,
        Built<PreferencesDeleteMultiplePreferenceResponseApplicationJson,
            PreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder> {
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson([
    void Function(PreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesDeleteMultiplePreferenceResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesDeleteMultiplePreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PreferencesDeleteMultiplePreferenceResponseApplicationJson> get serializer =>
      _$preferencesDeleteMultiplePreferenceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
}

abstract class UsersGetUsersResponseApplicationJson_Ocs_Data
    implements
        $UsersGetUsersResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetUsersResponseApplicationJson_Ocs_Data, UsersGetUsersResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetUsersResponseApplicationJson_Ocs_Data([
    void Function(UsersGetUsersResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetUsersResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetUsersResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersResponseApplicationJson_Ocs_Data> get serializer =>
      _$usersGetUsersResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetUsersResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetUsersResponseApplicationJson_Ocs
    implements
        $UsersGetUsersResponseApplicationJson_OcsInterface,
        Built<UsersGetUsersResponseApplicationJson_Ocs, UsersGetUsersResponseApplicationJson_OcsBuilder> {
  factory UsersGetUsersResponseApplicationJson_Ocs([
    void Function(UsersGetUsersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUsersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUsersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersResponseApplicationJson_Ocs> get serializer =>
      _$usersGetUsersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersResponseApplicationJsonInterface {
  UsersGetUsersResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUsersResponseApplicationJson
    implements
        $UsersGetUsersResponseApplicationJsonInterface,
        Built<UsersGetUsersResponseApplicationJson, UsersGetUsersResponseApplicationJsonBuilder> {
  factory UsersGetUsersResponseApplicationJson([void Function(UsersGetUsersResponseApplicationJsonBuilder)? b]) =
      _$UsersGetUsersResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUsersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersResponseApplicationJson> get serializer =>
      _$usersGetUsersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddUserResponseApplicationJson_Ocs_DataInterface {
  String get id;
}

abstract class UsersAddUserResponseApplicationJson_Ocs_Data
    implements
        $UsersAddUserResponseApplicationJson_Ocs_DataInterface,
        Built<UsersAddUserResponseApplicationJson_Ocs_Data, UsersAddUserResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersAddUserResponseApplicationJson_Ocs_Data([
    void Function(UsersAddUserResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersAddUserResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersAddUserResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddUserResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddUserResponseApplicationJson_Ocs_Data> get serializer =>
      _$usersAddUserResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersAddUserResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersAddUserResponseApplicationJson_Ocs
    implements
        $UsersAddUserResponseApplicationJson_OcsInterface,
        Built<UsersAddUserResponseApplicationJson_Ocs, UsersAddUserResponseApplicationJson_OcsBuilder> {
  factory UsersAddUserResponseApplicationJson_Ocs([void Function(UsersAddUserResponseApplicationJson_OcsBuilder)? b]) =
      _$UsersAddUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersAddUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddUserResponseApplicationJson_Ocs> get serializer =>
      _$usersAddUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddUserResponseApplicationJsonInterface {
  UsersAddUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersAddUserResponseApplicationJson
    implements
        $UsersAddUserResponseApplicationJsonInterface,
        Built<UsersAddUserResponseApplicationJson, UsersAddUserResponseApplicationJsonBuilder> {
  factory UsersAddUserResponseApplicationJson([void Function(UsersAddUserResponseApplicationJsonBuilder)? b]) =
      _$UsersAddUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersAddUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddUserResponseApplicationJson> get serializer =>
      _$usersAddUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        $UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    void Function(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      _$usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        $UsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data,
            UsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data([
    void Function(UsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$usersGetUsersDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs
    implements
        $UsersGetUsersDetailsResponseApplicationJson_OcsInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs, UsersGetUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs([
    void Function(UsersGetUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      _$usersGetUsersDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersDetailsResponseApplicationJsonInterface {
  UsersGetUsersDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUsersDetailsResponseApplicationJson
    implements
        $UsersGetUsersDetailsResponseApplicationJsonInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson, UsersGetUsersDetailsResponseApplicationJsonBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson([
    void Function(UsersGetUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersDetailsResponseApplicationJson> get serializer =>
      _$usersGetUsersDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        $UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      _$usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        $UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data,
            UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data([
    void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetDisabledUsersDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs
    implements
        $UsersGetDisabledUsersDetailsResponseApplicationJson_OcsInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs,
            UsersGetDisabledUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs([
    void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      _$usersGetDisabledUsersDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetDisabledUsersDetailsResponseApplicationJsonInterface {
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson
    implements
        $UsersGetDisabledUsersDetailsResponseApplicationJsonInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson,
            UsersGetDisabledUsersDetailsResponseApplicationJsonBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson([
    void Function(UsersGetDisabledUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson> get serializer =>
      _$usersGetDisabledUsersDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, String> get data;
}

abstract class UsersSearchByPhoneNumbersResponseApplicationJson_Ocs
    implements
        $UsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface,
        Built<UsersSearchByPhoneNumbersResponseApplicationJson_Ocs,
            UsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder> {
  factory UsersSearchByPhoneNumbersResponseApplicationJson_Ocs([
    void Function(UsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersSearchByPhoneNumbersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersSearchByPhoneNumbersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersSearchByPhoneNumbersResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersSearchByPhoneNumbersResponseApplicationJson_Ocs> get serializer =>
      _$usersSearchByPhoneNumbersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersSearchByPhoneNumbersResponseApplicationJsonInterface {
  UsersSearchByPhoneNumbersResponseApplicationJson_Ocs get ocs;
}

abstract class UsersSearchByPhoneNumbersResponseApplicationJson
    implements
        $UsersSearchByPhoneNumbersResponseApplicationJsonInterface,
        Built<UsersSearchByPhoneNumbersResponseApplicationJson,
            UsersSearchByPhoneNumbersResponseApplicationJsonBuilder> {
  factory UsersSearchByPhoneNumbersResponseApplicationJson([
    void Function(UsersSearchByPhoneNumbersResponseApplicationJsonBuilder)? b,
  ]) = _$UsersSearchByPhoneNumbersResponseApplicationJson;

  // coverage:ignore-start
  const UsersSearchByPhoneNumbersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersSearchByPhoneNumbersResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersSearchByPhoneNumbersResponseApplicationJson> get serializer =>
      _$usersSearchByPhoneNumbersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UserDetails get data;
}

abstract class UsersGetUserResponseApplicationJson_Ocs
    implements
        $UsersGetUserResponseApplicationJson_OcsInterface,
        Built<UsersGetUserResponseApplicationJson_Ocs, UsersGetUserResponseApplicationJson_OcsBuilder> {
  factory UsersGetUserResponseApplicationJson_Ocs([void Function(UsersGetUserResponseApplicationJson_OcsBuilder)? b]) =
      _$UsersGetUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUserResponseApplicationJson_Ocs> get serializer =>
      _$usersGetUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUserResponseApplicationJsonInterface {
  UsersGetUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUserResponseApplicationJson
    implements
        $UsersGetUserResponseApplicationJsonInterface,
        Built<UsersGetUserResponseApplicationJson, UsersGetUserResponseApplicationJsonBuilder> {
  factory UsersGetUserResponseApplicationJson([void Function(UsersGetUserResponseApplicationJsonBuilder)? b]) =
      _$UsersGetUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUserResponseApplicationJson> get serializer =>
      _$usersGetUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersEditUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersEditUserResponseApplicationJson_Ocs
    implements
        $UsersEditUserResponseApplicationJson_OcsInterface,
        Built<UsersEditUserResponseApplicationJson_Ocs, UsersEditUserResponseApplicationJson_OcsBuilder> {
  factory UsersEditUserResponseApplicationJson_Ocs([
    void Function(UsersEditUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersEditUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersEditUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersEditUserResponseApplicationJson_Ocs> get serializer =>
      _$usersEditUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersEditUserResponseApplicationJsonInterface {
  UsersEditUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersEditUserResponseApplicationJson
    implements
        $UsersEditUserResponseApplicationJsonInterface,
        Built<UsersEditUserResponseApplicationJson, UsersEditUserResponseApplicationJsonBuilder> {
  factory UsersEditUserResponseApplicationJson([void Function(UsersEditUserResponseApplicationJsonBuilder)? b]) =
      _$UsersEditUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersEditUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersEditUserResponseApplicationJson> get serializer =>
      _$usersEditUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersDeleteUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersDeleteUserResponseApplicationJson_Ocs
    implements
        $UsersDeleteUserResponseApplicationJson_OcsInterface,
        Built<UsersDeleteUserResponseApplicationJson_Ocs, UsersDeleteUserResponseApplicationJson_OcsBuilder> {
  factory UsersDeleteUserResponseApplicationJson_Ocs([
    void Function(UsersDeleteUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersDeleteUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersDeleteUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDeleteUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersDeleteUserResponseApplicationJson_Ocs> get serializer =>
      _$usersDeleteUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersDeleteUserResponseApplicationJsonInterface {
  UsersDeleteUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersDeleteUserResponseApplicationJson
    implements
        $UsersDeleteUserResponseApplicationJsonInterface,
        Built<UsersDeleteUserResponseApplicationJson, UsersDeleteUserResponseApplicationJsonBuilder> {
  factory UsersDeleteUserResponseApplicationJson([void Function(UsersDeleteUserResponseApplicationJsonBuilder)? b]) =
      _$UsersDeleteUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersDeleteUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDeleteUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersDeleteUserResponseApplicationJson> get serializer =>
      _$usersDeleteUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetCurrentUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UserDetails get data;
}

abstract class UsersGetCurrentUserResponseApplicationJson_Ocs
    implements
        $UsersGetCurrentUserResponseApplicationJson_OcsInterface,
        Built<UsersGetCurrentUserResponseApplicationJson_Ocs, UsersGetCurrentUserResponseApplicationJson_OcsBuilder> {
  factory UsersGetCurrentUserResponseApplicationJson_Ocs([
    void Function(UsersGetCurrentUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetCurrentUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetCurrentUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetCurrentUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetCurrentUserResponseApplicationJson_Ocs> get serializer =>
      _$usersGetCurrentUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetCurrentUserResponseApplicationJsonInterface {
  UsersGetCurrentUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetCurrentUserResponseApplicationJson
    implements
        $UsersGetCurrentUserResponseApplicationJsonInterface,
        Built<UsersGetCurrentUserResponseApplicationJson, UsersGetCurrentUserResponseApplicationJsonBuilder> {
  factory UsersGetCurrentUserResponseApplicationJson([
    void Function(UsersGetCurrentUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetCurrentUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetCurrentUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetCurrentUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetCurrentUserResponseApplicationJson> get serializer =>
      _$usersGetCurrentUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetEditableFieldsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class UsersGetEditableFieldsResponseApplicationJson_Ocs
    implements
        $UsersGetEditableFieldsResponseApplicationJson_OcsInterface,
        Built<UsersGetEditableFieldsResponseApplicationJson_Ocs,
            UsersGetEditableFieldsResponseApplicationJson_OcsBuilder> {
  factory UsersGetEditableFieldsResponseApplicationJson_Ocs([
    void Function(UsersGetEditableFieldsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetEditableFieldsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetEditableFieldsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetEditableFieldsResponseApplicationJson_Ocs> get serializer =>
      _$usersGetEditableFieldsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetEditableFieldsResponseApplicationJsonInterface {
  UsersGetEditableFieldsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetEditableFieldsResponseApplicationJson
    implements
        $UsersGetEditableFieldsResponseApplicationJsonInterface,
        Built<UsersGetEditableFieldsResponseApplicationJson, UsersGetEditableFieldsResponseApplicationJsonBuilder> {
  factory UsersGetEditableFieldsResponseApplicationJson([
    void Function(UsersGetEditableFieldsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetEditableFieldsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetEditableFieldsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetEditableFieldsResponseApplicationJson> get serializer =>
      _$usersGetEditableFieldsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class UsersGetEditableFieldsForUserResponseApplicationJson_Ocs
    implements
        $UsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface,
        Built<UsersGetEditableFieldsForUserResponseApplicationJson_Ocs,
            UsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder> {
  factory UsersGetEditableFieldsForUserResponseApplicationJson_Ocs([
    void Function(UsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetEditableFieldsForUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetEditableFieldsForUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsForUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetEditableFieldsForUserResponseApplicationJson_Ocs> get serializer =>
      _$usersGetEditableFieldsForUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetEditableFieldsForUserResponseApplicationJsonInterface {
  UsersGetEditableFieldsForUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetEditableFieldsForUserResponseApplicationJson
    implements
        $UsersGetEditableFieldsForUserResponseApplicationJsonInterface,
        Built<UsersGetEditableFieldsForUserResponseApplicationJson,
            UsersGetEditableFieldsForUserResponseApplicationJsonBuilder> {
  factory UsersGetEditableFieldsForUserResponseApplicationJson([
    void Function(UsersGetEditableFieldsForUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetEditableFieldsForUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetEditableFieldsForUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsForUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetEditableFieldsForUserResponseApplicationJson> get serializer =>
      _$usersGetEditableFieldsForUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersEditUserMultiValueResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersEditUserMultiValueResponseApplicationJson_Ocs
    implements
        $UsersEditUserMultiValueResponseApplicationJson_OcsInterface,
        Built<UsersEditUserMultiValueResponseApplicationJson_Ocs,
            UsersEditUserMultiValueResponseApplicationJson_OcsBuilder> {
  factory UsersEditUserMultiValueResponseApplicationJson_Ocs([
    void Function(UsersEditUserMultiValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersEditUserMultiValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersEditUserMultiValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserMultiValueResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersEditUserMultiValueResponseApplicationJson_Ocs> get serializer =>
      _$usersEditUserMultiValueResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersEditUserMultiValueResponseApplicationJsonInterface {
  UsersEditUserMultiValueResponseApplicationJson_Ocs get ocs;
}

abstract class UsersEditUserMultiValueResponseApplicationJson
    implements
        $UsersEditUserMultiValueResponseApplicationJsonInterface,
        Built<UsersEditUserMultiValueResponseApplicationJson, UsersEditUserMultiValueResponseApplicationJsonBuilder> {
  factory UsersEditUserMultiValueResponseApplicationJson([
    void Function(UsersEditUserMultiValueResponseApplicationJsonBuilder)? b,
  ]) = _$UsersEditUserMultiValueResponseApplicationJson;

  // coverage:ignore-start
  const UsersEditUserMultiValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserMultiValueResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersEditUserMultiValueResponseApplicationJson> get serializer =>
      _$usersEditUserMultiValueResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersWipeUserDevicesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersWipeUserDevicesResponseApplicationJson_Ocs
    implements
        $UsersWipeUserDevicesResponseApplicationJson_OcsInterface,
        Built<UsersWipeUserDevicesResponseApplicationJson_Ocs, UsersWipeUserDevicesResponseApplicationJson_OcsBuilder> {
  factory UsersWipeUserDevicesResponseApplicationJson_Ocs([
    void Function(UsersWipeUserDevicesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersWipeUserDevicesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersWipeUserDevicesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersWipeUserDevicesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersWipeUserDevicesResponseApplicationJson_Ocs> get serializer =>
      _$usersWipeUserDevicesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersWipeUserDevicesResponseApplicationJsonInterface {
  UsersWipeUserDevicesResponseApplicationJson_Ocs get ocs;
}

abstract class UsersWipeUserDevicesResponseApplicationJson
    implements
        $UsersWipeUserDevicesResponseApplicationJsonInterface,
        Built<UsersWipeUserDevicesResponseApplicationJson, UsersWipeUserDevicesResponseApplicationJsonBuilder> {
  factory UsersWipeUserDevicesResponseApplicationJson([
    void Function(UsersWipeUserDevicesResponseApplicationJsonBuilder)? b,
  ]) = _$UsersWipeUserDevicesResponseApplicationJson;

  // coverage:ignore-start
  const UsersWipeUserDevicesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersWipeUserDevicesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersWipeUserDevicesResponseApplicationJson> get serializer =>
      _$usersWipeUserDevicesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersEnableUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersEnableUserResponseApplicationJson_Ocs
    implements
        $UsersEnableUserResponseApplicationJson_OcsInterface,
        Built<UsersEnableUserResponseApplicationJson_Ocs, UsersEnableUserResponseApplicationJson_OcsBuilder> {
  factory UsersEnableUserResponseApplicationJson_Ocs([
    void Function(UsersEnableUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersEnableUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersEnableUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEnableUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersEnableUserResponseApplicationJson_Ocs> get serializer =>
      _$usersEnableUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersEnableUserResponseApplicationJsonInterface {
  UsersEnableUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersEnableUserResponseApplicationJson
    implements
        $UsersEnableUserResponseApplicationJsonInterface,
        Built<UsersEnableUserResponseApplicationJson, UsersEnableUserResponseApplicationJsonBuilder> {
  factory UsersEnableUserResponseApplicationJson([void Function(UsersEnableUserResponseApplicationJsonBuilder)? b]) =
      _$UsersEnableUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersEnableUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEnableUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersEnableUserResponseApplicationJson> get serializer =>
      _$usersEnableUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersDisableUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersDisableUserResponseApplicationJson_Ocs
    implements
        $UsersDisableUserResponseApplicationJson_OcsInterface,
        Built<UsersDisableUserResponseApplicationJson_Ocs, UsersDisableUserResponseApplicationJson_OcsBuilder> {
  factory UsersDisableUserResponseApplicationJson_Ocs([
    void Function(UsersDisableUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersDisableUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersDisableUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDisableUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersDisableUserResponseApplicationJson_Ocs> get serializer =>
      _$usersDisableUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersDisableUserResponseApplicationJsonInterface {
  UsersDisableUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersDisableUserResponseApplicationJson
    implements
        $UsersDisableUserResponseApplicationJsonInterface,
        Built<UsersDisableUserResponseApplicationJson, UsersDisableUserResponseApplicationJsonBuilder> {
  factory UsersDisableUserResponseApplicationJson([void Function(UsersDisableUserResponseApplicationJsonBuilder)? b]) =
      _$UsersDisableUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersDisableUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDisableUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersDisableUserResponseApplicationJson> get serializer =>
      _$usersDisableUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
}

abstract class UsersGetUsersGroupsResponseApplicationJson_Ocs_Data
    implements
        $UsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetUsersGroupsResponseApplicationJson_Ocs_Data,
            UsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs_Data([
    void Function(UsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetUsersGroupsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetUsersGroupsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersGroupsResponseApplicationJson_Ocs_Data> get serializer =>
      _$usersGetUsersGroupsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersGroupsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetUsersGroupsResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetUsersGroupsResponseApplicationJson_Ocs
    implements
        $UsersGetUsersGroupsResponseApplicationJson_OcsInterface,
        Built<UsersGetUsersGroupsResponseApplicationJson_Ocs, UsersGetUsersGroupsResponseApplicationJson_OcsBuilder> {
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs([
    void Function(UsersGetUsersGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUsersGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUsersGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersGroupsResponseApplicationJson_Ocs> get serializer =>
      _$usersGetUsersGroupsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUsersGroupsResponseApplicationJsonInterface {
  UsersGetUsersGroupsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUsersGroupsResponseApplicationJson
    implements
        $UsersGetUsersGroupsResponseApplicationJsonInterface,
        Built<UsersGetUsersGroupsResponseApplicationJson, UsersGetUsersGroupsResponseApplicationJsonBuilder> {
  factory UsersGetUsersGroupsResponseApplicationJson([
    void Function(UsersGetUsersGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetUsersGroupsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUsersGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersGroupsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUsersGroupsResponseApplicationJson> get serializer =>
      _$usersGetUsersGroupsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddToGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersAddToGroupResponseApplicationJson_Ocs
    implements
        $UsersAddToGroupResponseApplicationJson_OcsInterface,
        Built<UsersAddToGroupResponseApplicationJson_Ocs, UsersAddToGroupResponseApplicationJson_OcsBuilder> {
  factory UsersAddToGroupResponseApplicationJson_Ocs([
    void Function(UsersAddToGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersAddToGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersAddToGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddToGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddToGroupResponseApplicationJson_Ocs> get serializer =>
      _$usersAddToGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddToGroupResponseApplicationJsonInterface {
  UsersAddToGroupResponseApplicationJson_Ocs get ocs;
}

abstract class UsersAddToGroupResponseApplicationJson
    implements
        $UsersAddToGroupResponseApplicationJsonInterface,
        Built<UsersAddToGroupResponseApplicationJson, UsersAddToGroupResponseApplicationJsonBuilder> {
  factory UsersAddToGroupResponseApplicationJson([void Function(UsersAddToGroupResponseApplicationJsonBuilder)? b]) =
      _$UsersAddToGroupResponseApplicationJson;

  // coverage:ignore-start
  const UsersAddToGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddToGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddToGroupResponseApplicationJson> get serializer =>
      _$usersAddToGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersRemoveFromGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersRemoveFromGroupResponseApplicationJson_Ocs
    implements
        $UsersRemoveFromGroupResponseApplicationJson_OcsInterface,
        Built<UsersRemoveFromGroupResponseApplicationJson_Ocs, UsersRemoveFromGroupResponseApplicationJson_OcsBuilder> {
  factory UsersRemoveFromGroupResponseApplicationJson_Ocs([
    void Function(UsersRemoveFromGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersRemoveFromGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersRemoveFromGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveFromGroupResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersRemoveFromGroupResponseApplicationJson_Ocs> get serializer =>
      _$usersRemoveFromGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersRemoveFromGroupResponseApplicationJsonInterface {
  UsersRemoveFromGroupResponseApplicationJson_Ocs get ocs;
}

abstract class UsersRemoveFromGroupResponseApplicationJson
    implements
        $UsersRemoveFromGroupResponseApplicationJsonInterface,
        Built<UsersRemoveFromGroupResponseApplicationJson, UsersRemoveFromGroupResponseApplicationJsonBuilder> {
  factory UsersRemoveFromGroupResponseApplicationJson([
    void Function(UsersRemoveFromGroupResponseApplicationJsonBuilder)? b,
  ]) = _$UsersRemoveFromGroupResponseApplicationJson;

  // coverage:ignore-start
  const UsersRemoveFromGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveFromGroupResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersRemoveFromGroupResponseApplicationJson> get serializer =>
      _$usersRemoveFromGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs
    implements
        $UsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface,
        Built<UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs,
            UsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder> {
  factory UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs([
    void Function(UsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs> get serializer =>
      _$usersGetUserSubAdminGroupsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersGetUserSubAdminGroupsResponseApplicationJsonInterface {
  UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUserSubAdminGroupsResponseApplicationJson
    implements
        $UsersGetUserSubAdminGroupsResponseApplicationJsonInterface,
        Built<UsersGetUserSubAdminGroupsResponseApplicationJson,
            UsersGetUserSubAdminGroupsResponseApplicationJsonBuilder> {
  factory UsersGetUserSubAdminGroupsResponseApplicationJson([
    void Function(UsersGetUserSubAdminGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetUserSubAdminGroupsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUserSubAdminGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserSubAdminGroupsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersGetUserSubAdminGroupsResponseApplicationJson> get serializer =>
      _$usersGetUserSubAdminGroupsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddSubAdminResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersAddSubAdminResponseApplicationJson_Ocs
    implements
        $UsersAddSubAdminResponseApplicationJson_OcsInterface,
        Built<UsersAddSubAdminResponseApplicationJson_Ocs, UsersAddSubAdminResponseApplicationJson_OcsBuilder> {
  factory UsersAddSubAdminResponseApplicationJson_Ocs([
    void Function(UsersAddSubAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersAddSubAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersAddSubAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddSubAdminResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddSubAdminResponseApplicationJson_Ocs> get serializer =>
      _$usersAddSubAdminResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersAddSubAdminResponseApplicationJsonInterface {
  UsersAddSubAdminResponseApplicationJson_Ocs get ocs;
}

abstract class UsersAddSubAdminResponseApplicationJson
    implements
        $UsersAddSubAdminResponseApplicationJsonInterface,
        Built<UsersAddSubAdminResponseApplicationJson, UsersAddSubAdminResponseApplicationJsonBuilder> {
  factory UsersAddSubAdminResponseApplicationJson([void Function(UsersAddSubAdminResponseApplicationJsonBuilder)? b]) =
      _$UsersAddSubAdminResponseApplicationJson;

  // coverage:ignore-start
  const UsersAddSubAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddSubAdminResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersAddSubAdminResponseApplicationJson> get serializer =>
      _$usersAddSubAdminResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersRemoveSubAdminResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersRemoveSubAdminResponseApplicationJson_Ocs
    implements
        $UsersRemoveSubAdminResponseApplicationJson_OcsInterface,
        Built<UsersRemoveSubAdminResponseApplicationJson_Ocs, UsersRemoveSubAdminResponseApplicationJson_OcsBuilder> {
  factory UsersRemoveSubAdminResponseApplicationJson_Ocs([
    void Function(UsersRemoveSubAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersRemoveSubAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersRemoveSubAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveSubAdminResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersRemoveSubAdminResponseApplicationJson_Ocs> get serializer =>
      _$usersRemoveSubAdminResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersRemoveSubAdminResponseApplicationJsonInterface {
  UsersRemoveSubAdminResponseApplicationJson_Ocs get ocs;
}

abstract class UsersRemoveSubAdminResponseApplicationJson
    implements
        $UsersRemoveSubAdminResponseApplicationJsonInterface,
        Built<UsersRemoveSubAdminResponseApplicationJson, UsersRemoveSubAdminResponseApplicationJsonBuilder> {
  factory UsersRemoveSubAdminResponseApplicationJson([
    void Function(UsersRemoveSubAdminResponseApplicationJsonBuilder)? b,
  ]) = _$UsersRemoveSubAdminResponseApplicationJson;

  // coverage:ignore-start
  const UsersRemoveSubAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveSubAdminResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersRemoveSubAdminResponseApplicationJson> get serializer =>
      _$usersRemoveSubAdminResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersResendWelcomeMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersResendWelcomeMessageResponseApplicationJson_Ocs
    implements
        $UsersResendWelcomeMessageResponseApplicationJson_OcsInterface,
        Built<UsersResendWelcomeMessageResponseApplicationJson_Ocs,
            UsersResendWelcomeMessageResponseApplicationJson_OcsBuilder> {
  factory UsersResendWelcomeMessageResponseApplicationJson_Ocs([
    void Function(UsersResendWelcomeMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersResendWelcomeMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersResendWelcomeMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersResendWelcomeMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersResendWelcomeMessageResponseApplicationJson_Ocs> get serializer =>
      _$usersResendWelcomeMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UsersResendWelcomeMessageResponseApplicationJsonInterface {
  UsersResendWelcomeMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UsersResendWelcomeMessageResponseApplicationJson
    implements
        $UsersResendWelcomeMessageResponseApplicationJsonInterface,
        Built<UsersResendWelcomeMessageResponseApplicationJson,
            UsersResendWelcomeMessageResponseApplicationJsonBuilder> {
  factory UsersResendWelcomeMessageResponseApplicationJson([
    void Function(UsersResendWelcomeMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UsersResendWelcomeMessageResponseApplicationJson;

  // coverage:ignore-start
  const UsersResendWelcomeMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersResendWelcomeMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UsersResendWelcomeMessageResponseApplicationJson> get serializer =>
      _$usersResendWelcomeMessageResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_ProvisioningApiInterface {
  String get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool get accountPropertyScopesPublishedEnabled;
}

abstract class Capabilities_ProvisioningApi
    implements
        $Capabilities_ProvisioningApiInterface,
        Built<Capabilities_ProvisioningApi, Capabilities_ProvisioningApiBuilder> {
  factory Capabilities_ProvisioningApi([void Function(Capabilities_ProvisioningApiBuilder)? b]) =
      _$Capabilities_ProvisioningApi;

  // coverage:ignore-start
  const Capabilities_ProvisioningApi._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_ProvisioningApi.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_ProvisioningApi> get serializer => _$capabilitiesProvisioningApiSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  @BuiltValueField(wireName: 'provisioning_api')
  Capabilities_ProvisioningApi get provisioningApi;
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

typedef GroupDetails_Usercount = ({bool? $bool, int? $int});

typedef GroupDetails_Disabled = ({bool? $bool, int? $int});

typedef UserDetailsQuota_Quota = ({num? $num, String? string});

typedef GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users = ({
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1? groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1,
  UserDetails? userDetails
});

typedef UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users = ({
  UserDetails? userDetails,
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1? usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1
});

typedef UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users = ({
  UserDetails? userDetails,
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1? usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1
});

typedef $BoolInt = ({bool? $bool, int? $int});

extension $BoolIntExtension on $BoolInt {
  List<dynamic> get _values => [$bool, $int];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BoolInt> get serializer => const _$BoolIntSerializer();
  static $BoolInt fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BoolIntSerializer implements PrimitiveSerializer<$BoolInt> {
  const _$BoolIntSerializer();

  @override
  Iterable<Type> get types => const [$BoolInt];

  @override
  String get wireName => r'$BoolInt';

  @override
  Object serialize(
    Serializers serializers,
    $BoolInt object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$bool;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(bool))!;
    }
    value = object.$int;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(int))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BoolInt deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    bool? $bool;
    try {
      $bool = serializers.deserialize(data, specifiedType: const FullType(bool))! as bool;
    } catch (_) {}
    int? $int;
    try {
      $int = serializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    return ($bool: $bool, $int: $int);
  }
}

typedef $NumString = ({num? $num, String? string});

extension $NumStringExtension on $NumString {
  List<dynamic> get _values => [$num, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$NumString> get serializer => const _$NumStringSerializer();
  static $NumString fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$NumStringSerializer implements PrimitiveSerializer<$NumString> {
  const _$NumStringSerializer();

  @override
  Iterable<Type> get types => const [$NumString];

  @override
  String get wireName => r'$NumString';

  @override
  Object serialize(
    Serializers serializers,
    $NumString object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$num;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(num))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $NumString deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    num? $num;
    try {
      $num = serializers.deserialize(data, specifiedType: const FullType(num))! as num;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return ($num: $num, string: string);
  }
}

typedef $GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails = ({
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1? groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1,
  UserDetails? userDetails
});

extension $GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetailsExtension
    on $GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails {
  List<dynamic> get _values => [groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1, userDetails];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails> get serializer =>
      const _$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetailsSerializer();
  static $GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails fromJson(Object? json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetailsSerializer
    implements PrimitiveSerializer<$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails> {
  const _$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetailsSerializer();

  @override
  Iterable<Type> get types => const [$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails];

  @override
  String get wireName => r'$GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails';

  @override
  Object serialize(
    Serializers serializers,
    $GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1;
    if (value != null) {
      return serializers.serialize(
        value,
        specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )!;
    }
    value = object.userDetails;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(UserDetails))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetails deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
        groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1;
    try {
      groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1 = serializers.deserialize(
        data,
        specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1;
    } catch (_) {}
    UserDetails? userDetails;
    try {
      userDetails = serializers.deserialize(data, specifiedType: const FullType(UserDetails))! as UserDetails;
    } catch (_) {}
    return (
      groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1:
          groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1,
      userDetails: userDetails
    );
  }
}

typedef $UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 = ({
  UserDetails? userDetails,
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1? usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1
});

extension $UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Extension
    on $UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 {
  List<dynamic> get _values => [userDetails, usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1> get serializer =>
      const _$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer();
  static $UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 fromJson(Object? json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer
    implements PrimitiveSerializer<$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1> {
  const _$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer();

  @override
  Iterable<Type> get types => const [$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1];

  @override
  String get wireName => r'$UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1';

  @override
  Object serialize(
    Serializers serializers,
    $UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.userDetails;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(UserDetails))!;
    }
    value = object.usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1;
    if (value != null) {
      return serializers.serialize(
        value,
        specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    UserDetails? userDetails;
    try {
      userDetails = serializers.deserialize(data, specifiedType: const FullType(UserDetails))! as UserDetails;
    } catch (_) {}
    UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
        usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1;
    try {
      usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 = serializers.deserialize(
        data,
        specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1;
    } catch (_) {}
    return (
      userDetails: userDetails,
      usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1: usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1
    );
  }
}

typedef $UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1 = ({
  UserDetails? userDetails,
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1? usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1
});

extension $UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1Extension
    on $UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1 {
  List<dynamic> get _values => [userDetails, usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1> get serializer =>
      const _$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer();
  static $UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1 fromJson(Object? json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer
    implements PrimitiveSerializer<$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1> {
  const _$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer();

  @override
  Iterable<Type> get types => const [$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1];

  @override
  String get wireName => r'$UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1';

  @override
  Object serialize(
    Serializers serializers,
    $UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.userDetails;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(UserDetails))!;
    }
    value = object.usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1;
    if (value != null) {
      return serializers.serialize(
        value,
        specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    UserDetails? userDetails;
    try {
      userDetails = serializers.deserialize(data, specifiedType: const FullType(UserDetails))! as UserDetails;
    } catch (_) {}
    UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
        usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1;
    try {
      usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1 = serializers.deserialize(
        data,
        specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1;
    } catch (_) {}
    return (
      userDetails: userDetails,
      usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1:
          usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1
    );
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(AppConfigGetAppsResponseApplicationJson),
        AppConfigGetAppsResponseApplicationJsonBuilder.new,
      )
      ..add(AppConfigGetAppsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetAppsResponseApplicationJson_Ocs),
        AppConfigGetAppsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppConfigGetAppsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetAppsResponseApplicationJson_Ocs_Data),
        AppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(AppConfigGetAppsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(AppConfigGetKeysResponseApplicationJson),
        AppConfigGetKeysResponseApplicationJsonBuilder.new,
      )
      ..add(AppConfigGetKeysResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetKeysResponseApplicationJson_Ocs),
        AppConfigGetKeysResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppConfigGetKeysResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetKeysResponseApplicationJson_Ocs_Data),
        AppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(AppConfigGetKeysResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetValueResponseApplicationJson),
        AppConfigGetValueResponseApplicationJsonBuilder.new,
      )
      ..add(AppConfigGetValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetValueResponseApplicationJson_Ocs),
        AppConfigGetValueResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppConfigGetValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetValueResponseApplicationJson_Ocs_Data),
        AppConfigGetValueResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(AppConfigGetValueResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigSetValueResponseApplicationJson),
        AppConfigSetValueResponseApplicationJsonBuilder.new,
      )
      ..add(AppConfigSetValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigSetValueResponseApplicationJson_Ocs),
        AppConfigSetValueResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppConfigSetValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigDeleteKeyResponseApplicationJson),
        AppConfigDeleteKeyResponseApplicationJsonBuilder.new,
      )
      ..add(AppConfigDeleteKeyResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigDeleteKeyResponseApplicationJson_Ocs),
        AppConfigDeleteKeyResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppConfigDeleteKeyResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppsResponseApplicationJson),
        AppsGetAppsResponseApplicationJsonBuilder.new,
      )
      ..add(AppsGetAppsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppsResponseApplicationJson_Ocs),
        AppsGetAppsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppsGetAppsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppsResponseApplicationJson_Ocs_Data),
        AppsGetAppsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(AppsGetAppsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppInfoResponseApplicationJson),
        AppsGetAppInfoResponseApplicationJsonBuilder.new,
      )
      ..add(AppsGetAppInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppInfoResponseApplicationJson_Ocs),
        AppsGetAppInfoResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppsGetAppInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(AppInfo), AppInfoBuilder.new)
      ..add(AppInfo.serializer)
      ..addBuilderFactory(
        const FullType(AppsEnableResponseApplicationJson),
        AppsEnableResponseApplicationJsonBuilder.new,
      )
      ..add(AppsEnableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsEnableResponseApplicationJson_Ocs),
        AppsEnableResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppsEnableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppsDisableResponseApplicationJson),
        AppsDisableResponseApplicationJsonBuilder.new,
      )
      ..add(AppsDisableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsDisableResponseApplicationJson_Ocs),
        AppsDisableResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppsDisableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsResponseApplicationJson),
        GroupsGetGroupsResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsGetGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsResponseApplicationJson_Ocs),
        GroupsGetGroupsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsGetGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsResponseApplicationJson_Ocs_Data),
        GroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(GroupsGetGroupsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsAddGroupResponseApplicationJson),
        GroupsAddGroupResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsAddGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsAddGroupResponseApplicationJson_Ocs),
        GroupsAddGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsAddGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsDetailsResponseApplicationJson),
        GroupsGetGroupsDetailsResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsGetGroupsDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs),
        GroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsGetGroupsDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data),
        GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(GroupDetails), GroupDetailsBuilder.new)
      ..add(GroupDetails.serializer)
      ..add($BoolIntExtension.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(GroupDetails)]), ListBuilder<GroupDetails>.new)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersResponseApplicationJson),
        GroupsGetGroupUsersResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsGetGroupUsersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs),
        GroupsGetGroupUsersResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsGetGroupUsersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs_Data),
        GroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(GroupsGetGroupUsersResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson),
        GroupsGetGroupUsersDetailsResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs),
        GroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data),
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(UserDetails), UserDetailsBuilder.new)
      ..add(UserDetails.serializer)
      ..addBuilderFactory(const FullType(UserDetails_BackendCapabilities), UserDetails_BackendCapabilitiesBuilder.new)
      ..add(UserDetails_BackendCapabilities.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota), UserDetailsQuotaBuilder.new)
      ..add(UserDetailsQuota.serializer)
      ..add($NumStringExtension.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..add($GroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1UserDetailsExtension.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson),
        GroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsGetSubAdminsOfGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs),
        GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupResponseApplicationJson),
        GroupsGetGroupResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsGetGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupResponseApplicationJson_Ocs),
        GroupsGetGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsGetGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupResponseApplicationJson_Ocs_Data),
        GroupsGetGroupResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(GroupsGetGroupResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsUpdateGroupResponseApplicationJson),
        GroupsUpdateGroupResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsUpdateGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsUpdateGroupResponseApplicationJson_Ocs),
        GroupsUpdateGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsUpdateGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsDeleteGroupResponseApplicationJson),
        GroupsDeleteGroupResponseApplicationJsonBuilder.new,
      )
      ..add(GroupsDeleteGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsDeleteGroupResponseApplicationJson_Ocs),
        GroupsDeleteGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(GroupsDeleteGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetPreferenceResponseApplicationJson),
        PreferencesSetPreferenceResponseApplicationJsonBuilder.new,
      )
      ..add(PreferencesSetPreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetPreferenceResponseApplicationJson_Ocs),
        PreferencesSetPreferenceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PreferencesSetPreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeletePreferenceResponseApplicationJson),
        PreferencesDeletePreferenceResponseApplicationJsonBuilder.new,
      )
      ..add(PreferencesDeletePreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeletePreferenceResponseApplicationJson_Ocs),
        PreferencesDeletePreferenceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PreferencesDeletePreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(String)]),
        MapBuilder<String, String>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(String)]),
        ]),
        ContentStringBuilder<BuiltMap<String, String>>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson),
        PreferencesSetMultiplePreferencesResponseApplicationJsonBuilder.new,
      )
      ..add(PreferencesSetMultiplePreferencesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs),
        PreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson),
        PreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder.new,
      )
      ..add(PreferencesDeleteMultiplePreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs),
        PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersResponseApplicationJson),
        UsersGetUsersResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetUsersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersResponseApplicationJson_Ocs),
        UsersGetUsersResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetUsersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersResponseApplicationJson_Ocs_Data),
        UsersGetUsersResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(UsersGetUsersResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddUserResponseApplicationJson),
        UsersAddUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersAddUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddUserResponseApplicationJson_Ocs),
        UsersAddUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersAddUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddUserResponseApplicationJson_Ocs_Data),
        UsersAddUserResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(UsersAddUserResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson),
        UsersGetUsersDetailsResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs),
        UsersGetUsersDetailsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data),
        UsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..add($UserDetailsUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Extension.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson),
        UsersGetDisabledUsersDetailsResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs),
        UsersGetDisabledUsersDetailsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data),
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..add($UserDetailsUsersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1Extension.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
        MapBuilder<String, BuiltList<String>>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [
            FullType(String),
            FullType(BuiltList, [FullType(String)]),
          ]),
        ]),
        ContentStringBuilder<BuiltMap<String, BuiltList<String>>>.new,
      )
      ..addBuilderFactory(
        const FullType(UsersSearchByPhoneNumbersResponseApplicationJson),
        UsersSearchByPhoneNumbersResponseApplicationJsonBuilder.new,
      )
      ..add(UsersSearchByPhoneNumbersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersSearchByPhoneNumbersResponseApplicationJson_Ocs),
        UsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersSearchByPhoneNumbersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserResponseApplicationJson),
        UsersGetUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserResponseApplicationJson_Ocs),
        UsersGetUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserResponseApplicationJson),
        UsersEditUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersEditUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserResponseApplicationJson_Ocs),
        UsersEditUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersEditUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersDeleteUserResponseApplicationJson),
        UsersDeleteUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersDeleteUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersDeleteUserResponseApplicationJson_Ocs),
        UsersDeleteUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersDeleteUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetCurrentUserResponseApplicationJson),
        UsersGetCurrentUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetCurrentUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetCurrentUserResponseApplicationJson_Ocs),
        UsersGetCurrentUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetCurrentUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsResponseApplicationJson),
        UsersGetEditableFieldsResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetEditableFieldsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsResponseApplicationJson_Ocs),
        UsersGetEditableFieldsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetEditableFieldsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsForUserResponseApplicationJson),
        UsersGetEditableFieldsForUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetEditableFieldsForUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsForUserResponseApplicationJson_Ocs),
        UsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetEditableFieldsForUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserMultiValueResponseApplicationJson),
        UsersEditUserMultiValueResponseApplicationJsonBuilder.new,
      )
      ..add(UsersEditUserMultiValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserMultiValueResponseApplicationJson_Ocs),
        UsersEditUserMultiValueResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersEditUserMultiValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersWipeUserDevicesResponseApplicationJson),
        UsersWipeUserDevicesResponseApplicationJsonBuilder.new,
      )
      ..add(UsersWipeUserDevicesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersWipeUserDevicesResponseApplicationJson_Ocs),
        UsersWipeUserDevicesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersWipeUserDevicesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersEnableUserResponseApplicationJson),
        UsersEnableUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersEnableUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersEnableUserResponseApplicationJson_Ocs),
        UsersEnableUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersEnableUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersDisableUserResponseApplicationJson),
        UsersDisableUserResponseApplicationJsonBuilder.new,
      )
      ..add(UsersDisableUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersDisableUserResponseApplicationJson_Ocs),
        UsersDisableUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersDisableUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersGroupsResponseApplicationJson),
        UsersGetUsersGroupsResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetUsersGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs),
        UsersGetUsersGroupsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetUsersGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs_Data),
        UsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(UsersGetUsersGroupsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddToGroupResponseApplicationJson),
        UsersAddToGroupResponseApplicationJsonBuilder.new,
      )
      ..add(UsersAddToGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddToGroupResponseApplicationJson_Ocs),
        UsersAddToGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersAddToGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveFromGroupResponseApplicationJson),
        UsersRemoveFromGroupResponseApplicationJsonBuilder.new,
      )
      ..add(UsersRemoveFromGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveFromGroupResponseApplicationJson_Ocs),
        UsersRemoveFromGroupResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersRemoveFromGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson),
        UsersGetUserSubAdminGroupsResponseApplicationJsonBuilder.new,
      )
      ..add(UsersGetUserSubAdminGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs),
        UsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddSubAdminResponseApplicationJson),
        UsersAddSubAdminResponseApplicationJsonBuilder.new,
      )
      ..add(UsersAddSubAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddSubAdminResponseApplicationJson_Ocs),
        UsersAddSubAdminResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersAddSubAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveSubAdminResponseApplicationJson),
        UsersRemoveSubAdminResponseApplicationJsonBuilder.new,
      )
      ..add(UsersRemoveSubAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveSubAdminResponseApplicationJson_Ocs),
        UsersRemoveSubAdminResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersRemoveSubAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersResendWelcomeMessageResponseApplicationJson),
        UsersResendWelcomeMessageResponseApplicationJsonBuilder.new,
      )
      ..add(UsersResendWelcomeMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersResendWelcomeMessageResponseApplicationJson_Ocs),
        UsersResendWelcomeMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UsersResendWelcomeMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_ProvisioningApi), Capabilities_ProvisioningApiBuilder.new)
      ..add(Capabilities_ProvisioningApi.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
