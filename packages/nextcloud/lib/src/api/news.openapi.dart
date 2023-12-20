// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'news.openapi.g.dart';

class $Client extends DynamiteClient {
  $Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  $Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSupportedApiVersionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SupportedAPIVersions, void>> getSupportedApiVersions() async {
    final rawResponse = getSupportedApiVersionsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSupportedApiVersions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SupportedAPIVersions, void> getSupportedApiVersionsRaw() {
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/apps/news/api';
    return DynamiteRawResponse<SupportedAPIVersions, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SupportedAPIVersions),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFoldersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFolders, void>> listFolders() async {
    final rawResponse = listFoldersRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFolders] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFolders, void> listFoldersRaw() {
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/apps/news/api/v1-3/folders';
    return DynamiteRawResponse<ListFolders, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ListFolders),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFolders, void>> createFolder({required String name}) async {
    final rawResponse = createFolderRaw(
      name: name,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFolders, void> createFolderRaw({required String name}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $name = jsonSerializers.serialize(name, specifiedType: const FullType(String));
    _parameters['name'] = $name;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/folders{?name*}').expand(_parameters);
    return DynamiteRawResponse<ListFolders, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ListFolders),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> renameFolder({
    required int folderId,
    required String name,
  }) async {
    final rawResponse = renameFolderRaw(
      folderId: folderId,
      name: name,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> renameFolderRaw({
    required int folderId,
    required String name,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $folderId = jsonSerializers.serialize(folderId, specifiedType: const FullType(int));
    _parameters['folderId'] = $folderId;

    final $name = jsonSerializers.serialize(name, specifiedType: const FullType(String));
    _parameters['name'] = $name;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/folders/{folderId}{?name*}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deleteFolder({required int folderId}) async {
    final rawResponse = deleteFolderRaw(
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deleteFolderRaw({required int folderId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $folderId = jsonSerializers.serialize(folderId, specifiedType: const FullType(int));
    _parameters['folderId'] = $folderId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/folders/{folderId}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId] The newest read item.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFolderAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markFolderAsRead({
    required int folderId,
    required int newestItemId,
  }) async {
    final rawResponse = markFolderAsReadRaw(
      folderId: folderId,
      newestItemId: newestItemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId] The newest read item.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFolderAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markFolderAsReadRaw({
    required int folderId,
    required int newestItemId,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $folderId = jsonSerializers.serialize(folderId, specifiedType: const FullType(int));
    _parameters['folderId'] = $folderId;

    final $newestItemId = jsonSerializers.serialize(newestItemId, specifiedType: const FullType(int));
    _parameters['newestItemId'] = $newestItemId;

    final _path =
        UriTemplate('/index.php/apps/news/api/v1-3/folders/{folderId}/read{?newestItemId*}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFeedsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFeeds, void>> listFeeds() async {
    final rawResponse = listFeedsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFeeds] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFeeds, void> listFeedsRaw() {
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/apps/news/api/v1-3/feeds';
    return DynamiteRawResponse<ListFeeds, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ListFeeds),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url]
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [addFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFeeds, void>> addFeed({
    required String url,
    int? folderId,
  }) async {
    final rawResponse = addFeedRaw(
      url: url,
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url]
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [addFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFeeds, void> addFeedRaw({
    required String url,
    int? folderId,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $url = jsonSerializers.serialize(url, specifiedType: const FullType(String));
    _parameters['url'] = $url;

    final $folderId = jsonSerializers.serialize(folderId, specifiedType: const FullType(int));
    _parameters['folderId'] = $folderId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/feeds{?url*,folderId*}').expand(_parameters);
    return DynamiteRawResponse<ListFeeds, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ListFeeds),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deleteFeed({required int feedId}) async {
    final rawResponse = deleteFeedRaw(
      feedId: feedId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deleteFeedRaw({required int feedId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $feedId = jsonSerializers.serialize(feedId, specifiedType: const FullType(int));
    _parameters['feedId'] = $feedId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [moveFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> moveFeed({
    required int feedId,
    int? folderId,
  }) async {
    final rawResponse = moveFeedRaw(
      feedId: feedId,
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [moveFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> moveFeedRaw({
    required int feedId,
    int? folderId,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $feedId = jsonSerializers.serialize(feedId, specifiedType: const FullType(int));
    _parameters['feedId'] = $feedId;

    final $folderId = jsonSerializers.serialize(folderId, specifiedType: const FullType(int));
    _parameters['folderId'] = $folderId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}/move{?folderId*}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [feedTitle]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> renameFeed({
    required int feedId,
    required String feedTitle,
  }) async {
    final rawResponse = renameFeedRaw(
      feedId: feedId,
      feedTitle: feedTitle,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [feedTitle]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> renameFeedRaw({
    required int feedId,
    required String feedTitle,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $feedId = jsonSerializers.serialize(feedId, specifiedType: const FullType(int));
    _parameters['feedId'] = $feedId;

    final $feedTitle = jsonSerializers.serialize(feedTitle, specifiedType: const FullType(String));
    _parameters['feedTitle'] = $feedTitle;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}/rename{?feedTitle*}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFeedAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markFeedAsRead({
    required int feedId,
    required int newestItemId,
  }) async {
    final rawResponse = markFeedAsReadRaw(
      feedId: feedId,
      newestItemId: newestItemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFeedAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markFeedAsReadRaw({
    required int feedId,
    required int newestItemId,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $feedId = jsonSerializers.serialize(feedId, specifiedType: const FullType(int));
    _parameters['feedId'] = $feedId;

    final $newestItemId = jsonSerializers.serialize(newestItemId, specifiedType: const FullType(int));
    _parameters['newestItemId'] = $newestItemId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}/read{?newestItemId*}').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [getRead] Defaults to `1`.
  ///   * [batchSize] Defaults to `-1`.
  ///   * [offset] Defaults to `0`.
  ///   * [oldestFirst] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListArticles, void>> listArticles({
    int? type,
    int? id,
    int? getRead,
    int? batchSize,
    int? offset,
    int? oldestFirst,
  }) async {
    final rawResponse = listArticlesRaw(
      type: type,
      id: id,
      getRead: getRead,
      batchSize: batchSize,
      offset: offset,
      oldestFirst: oldestFirst,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [getRead] Defaults to `1`.
  ///   * [batchSize] Defaults to `-1`.
  ///   * [offset] Defaults to `0`.
  ///   * [oldestFirst] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListArticles, void> listArticlesRaw({
    int? type,
    int? id,
    int? getRead,
    int? batchSize,
    int? offset,
    int? oldestFirst,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    var $type = jsonSerializers.serialize(type, specifiedType: const FullType(int));
    $type ??= 3;
    _parameters['type'] = $type;

    var $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    $id ??= 0;
    _parameters['id'] = $id;

    var $getRead = jsonSerializers.serialize(getRead, specifiedType: const FullType(int));
    $getRead ??= 1;
    _parameters['getRead'] = $getRead;

    var $batchSize = jsonSerializers.serialize(batchSize, specifiedType: const FullType(int));
    $batchSize ??= -1;
    _parameters['batchSize'] = $batchSize;

    var $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    $offset ??= 0;
    _parameters['offset'] = $offset;

    var $oldestFirst = jsonSerializers.serialize(oldestFirst, specifiedType: const FullType(int));
    $oldestFirst ??= 0;
    _parameters['oldestFirst'] = $oldestFirst;

    final _path =
        UriTemplate('/index.php/apps/news/api/v1-3/items{?type*,id*,getRead*,batchSize*,offset*,oldestFirst*}')
            .expand(_parameters);
    return DynamiteRawResponse<ListArticles, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ListArticles),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [lastModified] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListArticles, void>> listUpdatedArticles({
    int? type,
    int? id,
    int? lastModified,
  }) async {
    final rawResponse = listUpdatedArticlesRaw(
      type: type,
      id: id,
      lastModified: lastModified,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [lastModified] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListArticles, void> listUpdatedArticlesRaw({
    int? type,
    int? id,
    int? lastModified,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    var $type = jsonSerializers.serialize(type, specifiedType: const FullType(int));
    $type ??= 3;
    _parameters['type'] = $type;

    var $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    $id ??= 0;
    _parameters['id'] = $id;

    var $lastModified = jsonSerializers.serialize(lastModified, specifiedType: const FullType(int));
    $lastModified ??= 0;
    _parameters['lastModified'] = $lastModified;

    final _path =
        UriTemplate('/index.php/apps/news/api/v1-3/items/updated{?type*,id*,lastModified*}').expand(_parameters);
    return DynamiteRawResponse<ListArticles, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ListArticles),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markArticleAsRead({required int itemId}) async {
    final rawResponse = markArticleAsReadRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markArticleAsReadRaw({required int itemId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $itemId = jsonSerializers.serialize(itemId, specifiedType: const FullType(int));
    _parameters['itemId'] = $itemId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/read').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsUnreadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markArticleAsUnread({required int itemId}) async {
    final rawResponse = markArticleAsUnreadRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsUnread] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markArticleAsUnreadRaw({required int itemId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $itemId = jsonSerializers.serialize(itemId, specifiedType: const FullType(int));
    _parameters['itemId'] = $itemId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/unread').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [starArticleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> starArticle({required int itemId}) async {
    final rawResponse = starArticleRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [starArticle] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> starArticleRaw({required int itemId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $itemId = jsonSerializers.serialize(itemId, specifiedType: const FullType(int));
    _parameters['itemId'] = $itemId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/star').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unstarArticleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> unstarArticle({required int itemId}) async {
    final rawResponse = unstarArticleRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unstarArticle] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> unstarArticleRaw({required int itemId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{};

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $itemId = jsonSerializers.serialize(itemId, specifiedType: const FullType(int));
    _parameters['itemId'] = $itemId;

    final _path = UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/unstar').expand(_parameters);
    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $SupportedAPIVersionsInterface {
  BuiltList<String>? get apiLevels;
}

abstract class SupportedAPIVersions
    implements $SupportedAPIVersionsInterface, Built<SupportedAPIVersions, SupportedAPIVersionsBuilder> {
  factory SupportedAPIVersions([void Function(SupportedAPIVersionsBuilder)? b]) = _$SupportedAPIVersions;

  // coverage:ignore-start
  const SupportedAPIVersions._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SupportedAPIVersions.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SupportedAPIVersions> get serializer => _$supportedAPIVersionsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ArticleInterface {
  int get id;
  String get guid;
  String get guidHash;
  String? get url;
  String get title;
  String? get author;
  int get pubDate;
  int? get updatedDate;
  String get body;
  String? get enclosureMime;
  String? get enclosureLink;
  String? get mediaThumbnail;
  String? get mediaDescription;
  int get feedId;
  bool get unread;
  bool get starred;
  int get lastModified;
  bool get rtl;
  String get fingerprint;
  String get contentHash;
}

abstract class Article implements $ArticleInterface, Built<Article, ArticleBuilder> {
  factory Article([void Function(ArticleBuilder)? b]) = _$Article;

  // coverage:ignore-start
  const Article._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Article.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Article> get serializer => _$articleSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FeedInterface {
  int get id;
  String get url;
  String get title;
  String? get faviconLink;
  int get added;
  int? get folderId;
  int? get unreadCount;
  int get ordering;
  String? get link;
  bool get pinned;
  int get updateErrorCount;
  String? get lastUpdateError;
  BuiltList<Article> get items;
}

abstract class Feed implements $FeedInterface, Built<Feed, FeedBuilder> {
  factory Feed([void Function(FeedBuilder)? b]) = _$Feed;

  // coverage:ignore-start
  const Feed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Feed.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Feed> get serializer => _$feedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FolderInterface {
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty.
  BuiltList<Feed> get feeds;
}

abstract class Folder implements $FolderInterface, Built<Folder, FolderBuilder> {
  factory Folder([void Function(FolderBuilder)? b]) = _$Folder;

  // coverage:ignore-start
  const Folder._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Folder.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Folder> get serializer => _$folderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ListFoldersInterface {
  BuiltList<Folder> get folders;
}

abstract class ListFolders implements $ListFoldersInterface, Built<ListFolders, ListFoldersBuilder> {
  factory ListFolders([void Function(ListFoldersBuilder)? b]) = _$ListFolders;

  // coverage:ignore-start
  const ListFolders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListFolders.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ListFolders> get serializer => _$listFoldersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ListFeedsInterface {
  int? get starredCount;
  int? get newestItemId;
  BuiltList<Feed> get feeds;
}

abstract class ListFeeds implements $ListFeedsInterface, Built<ListFeeds, ListFeedsBuilder> {
  factory ListFeeds([void Function(ListFeedsBuilder)? b]) = _$ListFeeds;

  // coverage:ignore-start
  const ListFeeds._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListFeeds.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ListFeeds> get serializer => _$listFeedsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ListArticlesInterface {
  BuiltList<Article> get items;
}

abstract class ListArticles implements $ListArticlesInterface, Built<ListArticles, ListArticlesBuilder> {
  factory ListArticles([void Function(ListArticlesBuilder)? b]) = _$ListArticles;

  // coverage:ignore-start
  const ListArticles._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListArticles.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ListArticles> get serializer => _$listArticlesSerializer;
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
abstract interface class $EmptyOCS_OcsInterface {
  OCSMeta get meta;
  BuiltList<JsonObject> get data;
}

abstract class EmptyOCS_Ocs implements $EmptyOCS_OcsInterface, Built<EmptyOCS_Ocs, EmptyOCS_OcsBuilder> {
  factory EmptyOCS_Ocs([void Function(EmptyOCS_OcsBuilder)? b]) = _$EmptyOCS_Ocs;

  // coverage:ignore-start
  const EmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS_Ocs.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EmptyOCS_Ocs> get serializer => _$emptyOCSOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EmptyOCSInterface {
  EmptyOCS_Ocs get ocs;
}

abstract class EmptyOCS implements $EmptyOCSInterface, Built<EmptyOCS, EmptyOCSBuilder> {
  factory EmptyOCS([void Function(EmptyOCSBuilder)? b]) = _$EmptyOCS;

  // coverage:ignore-start
  const EmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EmptyOCS> get serializer => _$emptyOCSSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(SupportedAPIVersions), SupportedAPIVersionsBuilder.new)
      ..add(SupportedAPIVersions.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(ListFolders), ListFoldersBuilder.new)
      ..add(ListFolders.serializer)
      ..addBuilderFactory(const FullType(Folder), FolderBuilder.new)
      ..add(Folder.serializer)
      ..addBuilderFactory(const FullType(Feed), FeedBuilder.new)
      ..add(Feed.serializer)
      ..addBuilderFactory(const FullType(Article), ArticleBuilder.new)
      ..add(Article.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Article)]), ListBuilder<Article>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Feed)]), ListBuilder<Feed>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Folder)]), ListBuilder<Folder>.new)
      ..addBuilderFactory(const FullType(ListFeeds), ListFeedsBuilder.new)
      ..add(ListFeeds.serializer)
      ..addBuilderFactory(const FullType(ListArticles), ListArticlesBuilder.new)
      ..add(ListArticles.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS), EmptyOCSBuilder.new)
      ..add(EmptyOCS.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS_Ocs), EmptyOCS_OcsBuilder.new)
      ..add(EmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
