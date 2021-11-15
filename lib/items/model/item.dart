import 'package:equatable/equatable.dart';

class Item extends Equatable {
  const Item({required this.id});

  final String id;

  static const Item none = Item(id: '');

  @override
  List<Object?> get props => [id];
}
