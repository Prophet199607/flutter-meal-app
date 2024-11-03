import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/tabs.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilters
  });

  // final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegitarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegitarianFilterSet = activeFilters[Filter.vegitarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.pop(context);
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegitarian: _vegitarianFilterSet,
            Filter.vegan: _veganFilterSet
          });
          Navigator.of(context).pop();
          // Navigator.of(context).pop<Map<Filter, bool>>({
          //   Filter.glutenFree: _glutenFreeFilterSet,
          //   Filter.lactoseFree: _lactoseFreeFilterSet,
          //   Filter.vegitarian: _vegitarianFilterSet,
          //   Filter.vegan: _veganFilterSet
          // });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              title: Text(
                'Gluten Free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                'Only include gluten free meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34.0, right: 22.0),
              onChanged: (bool value) {
                setState(() {
                  _glutenFreeFilterSet = value;
                });
              },
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              title: Text(
                'Lactose Free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                'Only include lactose free meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34.0, right: 22.0),
              onChanged: (bool value) {
                setState(() {
                  _lactoseFreeFilterSet = value;
                });
              },
            ),
            SwitchListTile(
              value: _vegitarianFilterSet,
              title: Text(
                'Vegitarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                'Only include vegitarian meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34.0, right: 22.0),
              onChanged: (bool value) {
                setState(() {
                  _vegitarianFilterSet = value;
                });
              },
            ),
            SwitchListTile(
              value: _veganFilterSet,
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                'Only include Vvegan meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34.0, right: 22.0),
              onChanged: (bool value) {
                setState(() {
                  _veganFilterSet = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
