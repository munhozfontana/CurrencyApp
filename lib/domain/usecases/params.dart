import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final bool syncLocalBase;

  Params({this.syncLocalBase});

  @override
  List<Object> get props => [syncLocalBase];
}
