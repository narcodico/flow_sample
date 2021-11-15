import 'package:equatable/equatable.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flow_sample/items/model/model.dart';
import 'package:flow_sample/items/view/item_details_page.dart';
import 'package:flow_sample/items/view/items_page.dart';
import 'package:flutter/material.dart';

enum ItemsFlowStatus {
  list,
  details,
}

extension ItemsFlowStatusExtensions on ItemsFlowStatus {
  bool get isList => this == ItemsFlowStatus.list;
  bool get isDetails => this == ItemsFlowStatus.details;
}

List<Page> onGenerateItemsPages(
  ItemsFlowState state,
  List<Page<dynamic>> pages,
) {
  final status = state.status, selectedItem = state.selectedItem;
  return [
    ItemsPage.page(),
    if (status.isDetails) ItemDetailsPage.page(item: selectedItem),
  ];
}

class ItemsFlowState extends Equatable {
  const ItemsFlowState._({
    this.status = ItemsFlowStatus.list,
    this.selectedItem = Item.none,
  });

  const ItemsFlowState.list() : this._();

  const ItemsFlowState.details(Item item)
      : this._(status: ItemsFlowStatus.details, selectedItem: item);

  final ItemsFlowStatus status;
  final Item selectedItem;

  @override
  List<Object?> get props => [status, selectedItem];
}

class ItemsFlow extends StatelessWidget {
  const ItemsFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FlowBuilder<ItemsFlowState>(
      onGeneratePages: onGenerateItemsPages,
      state: ItemsFlowState.list(),
    );
  }
}
