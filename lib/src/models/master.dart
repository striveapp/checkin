import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'master.g.dart';

@JsonSerializable()
class Master extends Equatable {
  final String name;
  final String imageUrl;
  // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
  final String email;

  Master({
    @required this.name,
    @required this.imageUrl,
    @required this.email,
  });

  @override
  List<Object> get props => [name, imageUrl, email];

  factory Master.fromUser(User user) {
    return Master(name: user.name, imageUrl: user.imageUrl, email: user.email);
  }

  @override
  String toString() => 'Master{name: $name, imageUrl: $imageUrl, email: $email}';

  factory Master.fromJson(Map<String, dynamic> json) => _$MasterFromJson(json);
  Map<String, dynamic> toJson() => _$MasterToJson(this);
}
