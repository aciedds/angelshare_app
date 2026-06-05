import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> fetchUserAppearance(String email) async {
    final doc = await _firestore.collection('appearance').doc(email).get();
    if (!doc.exists) return null;
    return doc.data();
  }

  Future<void> initializeUserAppearance(String email) async {
    final data = {
      'theme_preset': 'gold',
      'widgets': {
        'welcome_header': {
          'isEnabled': true,
          'sortOrder': 1,
          'colorSlot': 'accent',
          'metadata': {'title': "WELCOME TO ANGEL'S SHARE"}
        },
        'ambient_orbs': {
          'isEnabled': true,
          'sortOrder': 2,
          'colorSlot': 'primary',
          'metadata': {'showOrbs': true}
        },
        'categories_slider': {
          'isEnabled': true,
          'sortOrder': 3,
          'colorSlot': 'primary',
          'metadata': {}
        },
        'cocktail_catalog': {
          'isEnabled': true,
          'sortOrder': 4,
          'colorSlot': 'accent',
          'metadata': {'layoutType': 'carousel'}
        },
        'drink_selector': {
          'isEnabled': true,
          'sortOrder': 5,
          'colorSlot': 'primary',
          'metadata': {}
        },
        'synthesizer': {
          'isEnabled': true,
          'sortOrder': 6,
          'colorSlot': 'muted',
          'metadata': {'category': null}
        }
      }
    };
    await _firestore.collection('appearance').doc(email).set({
      'widgets': jsonEncode(data),
    });
  }
}
