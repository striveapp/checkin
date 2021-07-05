import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dynamic_link_event.freezed.dart';

@freezed
class DynamicLinkEvent with _$DynamicLinkEvent {
  const factory DynamicLinkEvent.deepLinkSetup() = DeepLinkSetup;
  const factory DynamicLinkEvent.deepLinkErrorEvent({required OnLinkErrorException error}) =
      DeepLinkErrorEvent;
  const factory DynamicLinkEvent.deepLinkReceived({required Uri deepLink}) = DeepLinkReceived;
  const factory DynamicLinkEvent.shareRegistryLink(
      {required String date, required String lessonId}) = ShareRegistryLink;
}
