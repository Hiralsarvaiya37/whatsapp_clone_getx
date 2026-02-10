import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  CallBloc() : super(CallState.initial()) {
    on<LoadContacts>(_loadContacts);
    on<SearchContacts>(_searchContacts);
    on<AddToFavorites>(_addToFavorites);
  }

  final List<Map<String, String>> contacts = List.generate(
    30,
    (i) => {
      "name": "User $i",
      "status": "Hey there! I am using WhatsApp.",
      "image":
          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
    },
  );

  void _loadContacts(LoadContacts event, Emitter<CallState> emit) {
    final frequently = contacts.take(5).toList();
    final all = contacts.skip(5).toList();

    emit(
      state.copyWith(
        frequentlyContacted: frequently,
        allContacts: all,
        filteredFrequently: frequently,
        filteredAll: all,
      ),
    );
  }

  void _searchContacts(SearchContacts event, Emitter<CallState> emit) {
    final q = event.query.toLowerCase();

    if (q.isEmpty) {
      emit(
        state.copyWith(
          filteredFrequently: state.frequentlyContacted,
          filteredAll: state.allContacts,
        ),
      );
    } else {
      final filteredFreq = state.frequentlyContacted
          .where(
            (c) =>
                c["name"]!.toLowerCase().contains(q) ||
                c["status"]!.toLowerCase().contains(q),
          )
          .toList();

      final filteredAll = state.allContacts
          .where(
            (c) =>
                c["name"]!.toLowerCase().contains(q) ||
                c["status"]!.toLowerCase().contains(q),
          )
          .toList();

      emit(
        state.copyWith(
          filteredFrequently: filteredFreq,
          filteredAll: filteredAll,
        ),
      );
    }
  } 

  void _addToFavorites(AddToFavorites event, Emitter<CallState> emit) {
    final updated = List<String>.from(state.favorites);
    if (!updated.contains(event.user)) {
      updated.add(event.user);
    }

    emit(state.copyWith(favorites: updated));
  }
}
