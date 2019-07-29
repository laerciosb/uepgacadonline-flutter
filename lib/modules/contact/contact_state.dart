import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ContactState extends Equatable {
  ContactState([List props = const []]) : super(props);
}

class InitialContactState extends ContactState {}
