import 'package:bloc/bloc.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'dynamic_link_event.dart';
import 'dynamic_link_state.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  final FirebaseDynamicLinks _dynamicLinks;

  DynamicLinkBloc({@required FirebaseDynamicLinks dynamicLinks})
      : assert(dynamicLinks != null),
        _dynamicLinks = dynamicLinks;

  @override
  DynamicLinkState get initialState => DynamicLinkInitial();

  @override
  Stream<DynamicLinkState> mapEventToState(DynamicLinkEvent event) async* {
    if(event is DeepLinkSetup) {
      final PendingDynamicLinkData data = await _dynamicLinks.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        add(DeepLinkReceived(deepLink: deepLink));
      }

      _dynamicLinks.onLink(
        onSuccess: onSuccessLink,
        onError: onErrorLink,
      );
    }
    debugPrint("dynamic link received");
    if (event is DeepLinkReceived) {
      debugPrint("deep link received");
      var lessonId = event.deepLink.queryParameters['lessonId'];
      if (lessonId != null) {
        yield DynamicLinkToRegistry(lessonId: lessonId);
      } else {
        yield DynamicLinkToNavigate(path: event.deepLink.path);
      }
    }

    if (event is DeepLinkErrorEvent) {
      yield DynamicLinkError();
    }
  }

  Future<void> onSuccessLink(PendingDynamicLinkData dynamicLink) async {
    final Uri deepLink = dynamicLink?.link;

    if (deepLink != null) {
      add(DeepLinkReceived(deepLink: deepLink));
    }
  }

  Future<void> onErrorLink(OnLinkErrorException e) async {
    print('onLinkError');
    print(e.message);
    add(DeepLinkErrorEvent());
  }
}
