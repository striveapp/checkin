import 'package:bloc/bloc.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'dynamic_link_event.dart';
import 'dynamic_link_state.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  final FirebaseDynamicLinks _dynamicLinks;

  DynamicLinkBloc({@required FirebaseDynamicLinks dynamicLinks})
      : assert(dynamicLinks != null),
        _dynamicLinks = dynamicLinks,
        super(DynamicLinkInitial());

  @override
  Stream<DynamicLinkState> mapEventToState(DynamicLinkEvent event) async* {
    if (event is DeepLinkSetup) {
      final PendingDynamicLinkData data = await _dynamicLinks.getInitialLink();

      onSuccessLink(data);

      _dynamicLinks.onLink(
        onSuccess: onSuccessLink,
        onError: onErrorLink,
      );
    }

    if (event is DeepLinkReceived) {
      String path = event.deepLink.path;

      if (path.startsWith("/register/")) {
        yield DynamicLinkSetDefaultGym(
            defaultGym: path.replaceAll("/register/", ""));
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
  }

  Future<dynamic> onSuccessLink(PendingDynamicLinkData dynamicLink) async {
    final Uri deepLink = dynamicLink?.link;

    if (deepLink != null) {
      add(DeepLinkReceived(deepLink: deepLink));
    }
  }

  Future<dynamic> onErrorLink(OnLinkErrorException e) async {
    add(DeepLinkErrorEvent());
  }
}
