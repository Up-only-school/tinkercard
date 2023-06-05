import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:tinkercad/features/common/animation/state_animation_builder.dart';

class NavigationTab extends HookWidget {
  const NavigationTab({
    required this.label,
    required this.index,
    required this.selectedIndex,
    this.onSelected,
    Key? key,
  }) : super(key: key);

  final String label;
  final int index;
  final int selectedIndex;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;

    return Expanded(
      child: StateAnimationBuilder(
        state: isSelected,
        builder: (context, stateAc) {
          return GestureDetector(
            onTap: () => onSelected?.call(index),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(12),
                  Text(label),
                  const Gap(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
