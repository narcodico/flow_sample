import 'package:flow_builder/flow_builder.dart';
import 'package:flow_sample/items/model/model.dart';
import 'package:flow_sample/items/view/items_flow.dart';
import 'package:flutter/material.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage._({Key? key, required this.item}) : super(key: key);

  static Page page({required Item item}) =>
      MaterialPage<void>(child: ItemDetailsPage._(item: item));

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item details page for ${item.id}'),
        leading: BackButton(
          onPressed: () => context
              .flow<ItemsFlowState>()
              .update((_) => const ItemsFlowState.list()),
        ),
      ),
    );
  }
}
