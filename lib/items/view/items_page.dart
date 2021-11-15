// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flow_builder/flow_builder.dart';
import 'package:flow_sample/items/model/model.dart';
import 'package:flow_sample/items/view/items_flow.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage._({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ItemsPage._());

  static final items = List.generate(10, (index) => Item(id: '$index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Items page')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text('Item ${item.id}'),
            onTap: () => context
                .flow<ItemsFlowState>()
                .update((_) => ItemsFlowState.details(item)),
          );
        },
      ),
    );
  }
}
