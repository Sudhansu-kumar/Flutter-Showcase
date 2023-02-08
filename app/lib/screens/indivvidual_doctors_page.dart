import 'package:app/mdoels/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(((ref) {
  AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
}));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});
  Future<DoctorProviderModel?> getCurrentDoctorDetails() async {
    var doctorDetails = await firestore
        .collection('Physician')
        .doc(auth.currentUser?.uid)
        .get();

    DoctorProviderModel? doctor;
    if (doctorDetails.data() != null) {
      doctor = DoctorProviderModel.fromMap(doctorDetails.data()!);
    }
    return doctor;
  }
}

final docProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return detailsController(authRepository: authRepository, ref: ref);
});

final doctorDataProvider = FutureProvider((ref) {
  final detailsController = ref.watch(docProvider);
  return detailsController.getData();
});

class detailsController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  detailsController({required this.authRepository, required this.ref});

  Future<DoctorProviderModel?> getData() async {
    DoctorProviderModel? doctor =
        await authRepository.getCurrentDoctorDetails();
    return doctor;
  }
}

class IndividualPage extends ConsumerWidget {
  IndividualPage({super.key, required this.name});
  String name = '';
  void getData(WidgetRef ref) async {
    name = ref.read(docProvider).getData() as String;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor\'s"),
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(name,
        style:  TextStyle(
          color: Colors.black,
        )
        ,),
      ),
    );
  }
}
