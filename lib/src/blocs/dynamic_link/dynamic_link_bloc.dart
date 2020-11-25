import 'package:bloc/bloc.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'dynamic_link_event.dart';
import 'dynamic_link_state.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  final FirebaseDynamicLinks dynamicLinks;
  final LocalStorageRepository localStorageRepository;
  final DynamicLinkRepository dynamicLinkRepository;
  final AuthRepository authRepository;

  DynamicLinkBloc({
    @required FirebaseDynamicLinks this.dynamicLinks,
    @required LocalStorageRepository this.localStorageRepository,
    @required AuthRepository this.authRepository,
    @required DynamicLinkRepository this.dynamicLinkRepository,
  }) : super(DynamicLinkInitial());

  @override
  Stream<DynamicLinkState> mapEventToState(DynamicLinkEvent event) async* {
    if (event is DeepLinkSetup) {
      final PendingDynamicLinkData data = await dynamicLinks.getInitialLink();

      onSuccessLink(data);

      dynamicLinks.onLink(
        onSuccess: onSuccessLink,
        onError: onErrorLink,
      );
    }

    if (event is DeepLinkReceived) {
      String path = event.deepLink.path;

      if (path.startsWith("/register/")) {
        final referredGymId = path.replaceAll("/register/", "");
        await localStorageRepository.setReferredGymId(referredGymId);
      } else if (path.startsWith("/__/auth/")) {
        var userEmail = await localStorageRepository.getUserEmail();
        await authRepository.completeSignInPasswordless(userEmail, event.deepLink);
      } else {
        if (event.deepLink.hasQuery) {
          path = "$path?${event.deepLink.query}";
        }

        yield DynamicLinkToNavigate(path: path);
      }
    }

    if (event is DeepLinkErrorEvent) {
      yield DynamicLinkError();
    }

    if(event is ShareRegistryLink) {
      var registryLink = await dynamicLinkRepository.getRegistryLink(event.date, event.lessonId);
      yield DynamicLinkToShare(link: registryLink);
    }
  }

  Future<dynamic> onSuccessLink(PendingDynamicLinkData dynamicLink) async {
    final Uri deepLink = dynamicLink?.link;

    if (deepLink != null) {
      add(DeepLinkReceived(deepLink: deepLink));
    }
  }

  Future<dynamic> onErrorLink(OnLinkErrorException e) async {
    add(DeepLinkErrorEvent(error: e));
  }
}
