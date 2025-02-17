# nextcloud

A Nextcloud API client written in Dart.

## Installation

In the future this code will be available at https://pub.dev/packages/nextcloud, but for now you have to include it via git in your pubspec.yaml:
```yaml
dependencies:
  nextcloud:
    git:
      url: https://github.com/nextcloud/neon
      path: packages/nextcloud
      ref: $COMMIT

dependency_overrides:
  dynamite_runtime:
    git:
      url: https://github.com/nextcloud/neon
      path: packages/dynamite/dynamite_runtime
      ref: $COMMIT
```
You can either remove the `ref` or use a commit hash. It's not recommended to remove it, because then the version will be updated very often.

## Usage

### Authentication

There are multiple ways to authenticate.  
First there is HTTP Basic auth which works with the normal user credentials (e-mail and other identifiers also work):
```dart
final client = NextcloudClient(
    Uri.parse('http://localhost'),
    loginName: 'admin',
    password: 'admin',
);
```

Secondly there is Http Bearer auth which works with app passwords:
```dart
final client = NextcloudClient(
    Uri.parse('http://localhost'),
    loginName: 'admin',
    appPassword: 'xxxxx-xxxxx-xxxxx-xxxx-xxxxx',
);
```

Not all endpoints work with just HTTP Basic auth, so it is advised to use app passwords obtained either directly in the Web UI by the user or using the [login flow](https://docs.nextcloud.com/server/latest/developer_manual/client_apis/LoginFlow/index.html#login-flow-v2).  
Some endpoints do not need any authentication at all or provide extended information when the request is optionally authenticated.

### Endpoints

It is not guaranteed that an API request will work unless the app is installed and enabled on the server (and has a supported version).  

To get an easier overview of the available endpoints you can browse the [server OpenAPI documentation](https://docs.nextcloud.com/server/latest/developer_manual/_static/openapi.html), but be aware that the package might not be in sync with it.  
Alternatively you can also go to https://pub.dev/documentation/nextcloud/latest (once the package has been republished at https://pub.dev/packages/nextcloud).

The endpoints are grouped by app and most apps also group their endpoints again.
They can be accessed using getters on the `NextcloudClient`.

For an example checkout the [example](https://github.com/nextcloud/neon/blob/main/packages/nextcloud/example/example.dart).  

## Development

Except for WebDAV all client code is generated using OpenAPI specifications which can be found in the `lib/src/api/` folder.  
These OpenAPI specifications are [generated](https://github.com/nextcloud/openapi-extractor) from the PHP source code.

## Compatibility/Support policy

We aim to support all currently maintained server versions and all app versions that support those server versions.
The currently maintained server versions can be found here: https://github.com/nextcloud/server/wiki/Maintenance-and-Release-Schedule
Once a server version becomes EOL the support for it will be removed.

To ensure this package is compatible with the supported server versions we run API unit tests.
Since we do not cover all endpoints we can not claim compatibility for endpoints we do not test against.
Even if there are unit tests for an endpoint we can not guarantee that it will work fine in every scenario.

Please report any compatibility problems (if you are using a compatible server version) and feel free to add unit tests for endpoints you depend on.
This will increase our test coverage and enables everyone to work more confidently with the endpoints.
