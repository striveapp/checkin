import 'package:checkin/src/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'master.freezed.dart';
part 'master.g.dart';

@freezed
abstract class Master with _$Master {

  factory Master({
    name,
    email,
    imageUrl,
  }) = _Master;

  factory Master.fromUser(User user) {
    return Master(name: user.name, imageUrl: user.imageUrl, email: user.email);
  }

  factory Master.fromJson(Map<String, dynamic> json) => _$MasterFromJson(json);
}
