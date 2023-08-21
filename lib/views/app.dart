import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bolc_firebase_login_apk/bloc/app_bloc.dart';
import 'package:bolc_firebase_login_apk/bloc/app_event.dart';
import 'package:bolc_firebase_login_apk/bloc/app_state.dart';
import 'package:bolc_firebase_login_apk/dialogs/show_auth_error.dart';
import 'package:bolc_firebase_login_apk/loading/loading_screen.dart';
import 'package:bolc_firebase_login_apk/views/login_view.dart';
import 'package:bolc_firebase_login_apk/views/photo_gallery_view.dart';
import 'package:bolc_firebase_login_apk/views/register_view.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()
        ..add(
          const AppEventInitialize(),
        ),
      child: MaterialApp(
        title: 'Photo Library',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }

            final authError = appState.authError;
            if (authError != null) {
              showAuthError(
                authError: authError,
                context: context,
              );
            }
          },
          builder: (context, appState) {
            if (appState is AppStateLoggedOut) {
              return const LoginView();
            } else if (appState is AppStateLoggedIn) {
              return const PhotoGalleryView();
            } else if (appState is AppStateIsInRegistrationView) {
              return const RegisterView();
            } else {
              // this should never happen
              return Container();
            }
          },
        ),
      ),
    );
  }
}
