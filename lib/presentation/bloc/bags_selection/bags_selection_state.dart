part of 'bags_selection_cubit.dart';

@immutable
sealed class BagsSelectionState {}

final class BagsSelectionInitial extends BagsSelectionState {}

class BagsSelectionUpdate extends BagsSelectionState {
  @override
  List<Object?> get props => [];
}