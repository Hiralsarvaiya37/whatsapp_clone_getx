import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_event.dart';
import 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState.initial()) {
    on<LoadProfilePic>(_loadProfilePic);
    on<UploadProfilePic>(_uploadProfilePic);
    on<ChangeLanguage>(_changeLanguage);
    on<ToggleSwitch>(_toggleSwitch);
   on<ToggleIsOn1>(_toggleIsOn1);
    on<ToggleItem>(_toggleItem);
    on<ToggleOption>(_toggleOption);
    on<ToggleAppUpdateOption>(_toggleAppUpdateOption);
    on<ToggleEnterSend>(_toggleEnterSend);
    on<ToggleMediaVisibility>(_toggleMediaVisibility);
    on<ToggleKeepChatsArchived>(_toggleKeepChatsArchived);
    on<ChangeTheme>(_changeTheme);
    on<ChangeFontSize>(_changeFontsize);
    on<ToggleOptionLight>(_toggleLight);
    on<ToggleOptionVibrate>(_toggleVibrate);
    on<ToggleOptionTone>(_toggleTone);
  }

  Future<void> _loadProfilePic(
    LoadProfilePic event,
    Emitter<SettingState> emit,
  ) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (doc.exists && doc.data()!.containsKey('profilePicUrl')) {
        emit(state.copyWith(profilePicUrl: doc['profilePicUrl']));
      }
    } catch (e) {
      CircularProgressIndicator();
    }
  }

  Future<void> _uploadProfilePic(
    UploadProfilePic event,
    Emitter<SettingState> emit,
  ) async {
    try {
      emit(state.copyWith(profilePicUrl: event.file.path, isLoading: true));

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      String userId = user.uid;

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pics')
          .child('${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(event.file);

      String downloadUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'profilePicUrl': downloadUrl,
      }, SetOptions(merge: true));

      emit(state.copyWith(profilePicUrl: downloadUrl, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _changeLanguage(ChangeLanguage event, Emitter<SettingState> emit) {
    emit(state.copyWith(language: event.lang));
  }

  void _toggleSwitch(ToggleSwitch event, Emitter<SettingState> emit) {
    emit(state.copyWith(isOn: event.value));
  }

 void _toggleIsOn1(ToggleIsOn1 event, Emitter<SettingState> emit) {
  emit(state.copyWith(isOn1: event.value));
}

  void _toggleItem(ToggleItem event, Emitter<SettingState> emit) {
    final newMap = Map<String, bool>.from(state.selectedItems);
    newMap[event.key] = !(newMap[event.key] ?? false);

    emit(state.copyWith(selectedItems: newMap));
  }

  void _toggleOption(ToggleOption event, Emitter<SettingState> emit) {
    emit(state.copyWith(selectedOption: event.value));
  }

  void _toggleAppUpdateOption(
    ToggleAppUpdateOption event,
    Emitter<SettingState> emit,
  ) {
    switch (event.index) {
      case 1:
        emit(state.copyWith(isShow1: event.value));
        break;
      case 2:
        emit(state.copyWith(isShow2: event.value));
        break;
      case 3:
        emit(state.copyWith(isShow3: event.value));
        break;
    }
  }

  void _toggleEnterSend(ToggleEnterSend event, Emitter<SettingState> emit) {
    emit(state.copyWith(isEnterSend: event.value));
  }

  void _toggleMediaVisibility(
    ToggleMediaVisibility event,
    Emitter<SettingState> emit,
  ) {
    emit(state.copyWith(isMediaVisibility: event.value));
  }

  void _toggleKeepChatsArchived(
    ToggleKeepChatsArchived event,
    Emitter<SettingState> emit,
  ) {
    emit(state.copyWith(keepChatsArchived: event.value));
  }

  void _changeTheme(ChangeTheme event, Emitter<SettingState> emit) {
    emit(state.copyWith(selectedTheme: event.theme));
  }

  void _changeFontsize(ChangeFontSize event, Emitter<SettingState> emit) {
    emit(state.copyWith(selectedFontSize: event.value));
  }

  void _toggleLight(ToggleOptionLight event, Emitter<SettingState> emit) {
    emit(state.copyWith(selectedLightOption: event.value));
  }

  void _toggleVibrate(ToggleOptionVibrate event, Emitter<SettingState> emit) {
    emit(state.copyWith(selectedVibrateOption: event.value));
  }

  void _toggleTone(ToggleOptionTone event, Emitter<SettingState> emit) {
    emit(state.copyWith(selectedToneOption: event.value));
  }
}
