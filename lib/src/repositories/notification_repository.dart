import 'package:checkin/src/resources/notification_provider.dart';

class NotificationRepository {
  NotificationProvider _notificationProvider = NotificationProvider();

  void config({onMessage, onResume, onLaunch}) => _notificationProvider.config(onMessage, onResume, onLaunch);

  void setup({onSuccess}) => _notificationProvider.setup(onSuccess);

}
