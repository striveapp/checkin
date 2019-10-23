import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'attendee.g.dart';

@JsonSerializable()
class Attendee extends Equatable {
  final String name;
  final String rank;
  final String imageUrl;
  //TODO: this should not be used here, remove ASAP
  final String email;

  Attendee({
    @required this.name,
    @required this.rank,
    @required this.imageUrl,
    @required this.email,
  }) : super([name, rank, imageUrl, email]);

  factory Attendee.fromUser( User user ) {
    return Attendee(name: user.name, rank: user.rank, imageUrl: user.imageUrl, email: user.email);
  }

  @override
  String toString() {
    return 'Attendee{name: $name, rank: $rank, imageUrl: $imageUrl, email: $email}';
  }

  factory Attendee.fromMappedJson(Map<String, dynamic> json) => _$AttendeeFromJson(json);
  Map<String, dynamic> toJson() => _$AttendeeToJson(this);

}
