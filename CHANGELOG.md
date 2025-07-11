## 1.4.0

General:

- Update to Flutter 3.29.5

Android:

- Update to Google UMP SDK 3.2.0
- Compile against Android SDK 35
- Update to Kotlin 2.2.0

iOS:

- Update to Google UMP SDK 3.0.0

## 1.3.0

General:

- Raise minimum Flutter version to 3.24.0

Android:

- Update to Google UMP SDK 3.1.0
- Update to Gradle 8.10.2 and AGP 8.8.1
- Compile against Android SDK 34
- Raise minimum Android SDK to 21
- Fix deprecation warnings

iOS:

- Update to Google UMP SDK 2.7.0

## 1.2.0

- Update to Google UMP SDK 2.2.0 for both platforms.
- [Fix deprecated imperative apply of Flutter's Gradle plugins](https://docs.flutter.dev/release/breaking-changes/flutter-gradle-plugin-apply)

## 1.1.0

- Various fixes and improvements.

## 1.0.0+1

- Fixed an error with consent status.

## 1.0.0

- Added support of namespace property to support Android Gradle Plugin (AGP) 8. Projects with AGP < 4.2 are not supported anymore. It is highly recommended to update at least to AGP 7.0 or newer.

## 0.3.0+2

- Fixed an issue with iOS.

## 0.3.0+1

- Added the ability to use the `setDebugGeography()` method. Thanks [Kobatsu](https://github.com/Kobatsu) !

## 0.3.0

- Updated User Messaging Platform SDK.
- Removed `UMPConsentType` API (This API was not in use and was removed from UMP).
- Updated `MinimumOSVersion` on iOS to 10.0 (from 8.0).

## 0.2.0

- Migrated to null safety. Thanks [TNorbury](https://github.com/TNorbury) !
- Fixed a little problem caused by some inconsistencies across platforms.

## 0.1.1+3

- Fixed [#5](https://github.com/Skyost/FlutterFundingChoices/issues/5). Thanks [amitash](https://github.com/amitash) !

## 0.1.1+2

- Updated the `GoogleUserMessagingPlatform` pod.

## 0.1.1+1

- Fixed a little problem added by the last update.

## 0.1.1

- Added a `testDevicesHashedIds` parameter. Thanks [TNorbury](https://github.com/TNorbury) !

## 0.1.0+1

- Various fixes for pub.dev.

## 0.1.0

- Initial release.
