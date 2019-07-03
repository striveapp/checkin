import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Attendee extends Equatable {
  final String name;
  final String rank;
  final String imageUrl;

  Attendee({
    @required this.name,
    @required this.rank,
    @required this.imageUrl,
  }) : super([name, rank, imageUrl]);

  factory Attendee.fromUser( User user ) {
    return Attendee(name: user.name, rank: user.rank, imageUrl: user.imageUrl);
  }

  @override
  String toString() {
    return 'Attendee{name: $name, rank: $rank, imageUrl: $imageUrl}';
  }
  
}
