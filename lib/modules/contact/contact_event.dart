import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ContactEvent extends Equatable {
  ContactEvent([List props = const []]) : super(props);
}
