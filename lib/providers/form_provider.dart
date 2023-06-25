import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormNotifier extends StateNotifier<Map> {
  FormNotifier() : super({});

  void updateFormValue(String formField, dynamic formValue) {
    state = {...state, formField: formValue};
  }

  void deleteFormValue(String formField) {
    state = state.remove(formField); 
  }
}

final formProvider = StateNotifierProvider<FormNotifier, Map>(
  (ref) => FormNotifier(),
);
