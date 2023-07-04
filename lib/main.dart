import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gotraining/core/test/stores/teste_store.dart';
import 'package:gotraining/modules/cadastro_reembolso/stores/cadastro_reembolso_store.dart';
import 'package:gotraining/modules/perfil/stores/perfil_store.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/calendar/stores/calendar_stores.dart';
import 'package:gotraining/modules/home/stores/home_store.dart';
import 'package:gotraining/modules/local/stores/local_store.dart';
import 'package:gotraining/modules/login/stores/login_store.dart';
import 'package:gotraining/modules/motivometro/stores/motivometro_store.dart';
import 'package:gotraining/modules/reembolso/stores/reembolso_store.dart';
import 'package:gotraining/modules/splash/splash_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeDateFormatting(Platform.localeName, null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorsApp.colorItem,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeStore>(
          create: (_) => HomeStore(),
        ),
        ChangeNotifierProvider<ReembolsoStore>(
          create: (_) => ReembolsoStore(),
        ),
        ChangeNotifierProvider<AgendamentoStore>(
            create: (_) => AgendamentoStore()),
        ChangeNotifierProvider<LoginStore>(
          create: (_) => LoginStore(),
        ),
        ChangeNotifierProvider<MotivometroStore>(
          create: (_) => MotivometroStore(),
        ),
        ChangeNotifierProvider<AgendamentoStore>(
          create: (_) => AgendamentoStore(),
        ),
        ChangeNotifierProvider<CalendarStore>(
          create: (_) => CalendarStore(),
        ),
        ChangeNotifierProvider<LocalStore>(
          create: (_) => LocalStore(),
        ),
        ChangeNotifierProvider<SolicitadosStore>(
          create: (_) => SolicitadosStore(),
        ),
        ChangeNotifierProvider<TestStore>(
          create: (_) => TestStore(),
        ),
        ChangeNotifierProvider<PerfilStore>(
          create: (_) => PerfilStore(),
        ),
        ChangeNotifierProvider<CadastroReembolsoStore>(
          create: (_) => CadastroReembolsoStore(),
        )

        //TestStore
      ], //
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: ColorsApp.colorItem)),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
