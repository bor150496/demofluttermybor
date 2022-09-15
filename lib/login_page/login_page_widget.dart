import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../landing_page/landing_page_widget.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  TextEditingController? passWordController;

  late bool passWordVisibility;

  TextEditingController? userNameController;

  bool? saveCredentialsValue;
  bool? autoLoginValue;
  ApiCallResponse? mydevices;
  ApiCallResponse? responseLogin;
  bool bioAuth = false;
  ApiCallResponse? mydevicesAuto;
  ApiCallResponse? responseLoginAuto;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 100,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.9,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 300));
      if (FFAppState().AutoLogin) {
        HapticFeedback.selectionClick();
        responseLoginAuto = await LoginCall.call(
          username: FFAppState().Username,
          password: FFAppState().Password,
        );
      } else {
        return;
      }

      if (random_data.randomInteger(200, 200) ==
          valueOrDefault<dynamic>(
            getJsonField(
              (responseLoginAuto?.jsonBody ?? ''),
              r'''$.status''',
            ),
            404,
          )) {
        setState(() => FFAppState().token = getJsonField(
              (responseLoginAuto?.jsonBody ?? ''),
              r'''$.token.token''',
            ).toString());
        setState(() => FFAppState().userid = getJsonField(
              (responseLoginAuto?.jsonBody ?? ''),
              r'''$.user_id''',
            ));
        setState(() => FFAppState().Buttons = []);
        setState(() => FFAppState().Cams = []);
        if (animationsMap['buttonOnActionTriggerAnimation'] == null) {
          return;
        }
        await (animationsMap['buttonOnActionTriggerAnimation']!
                .curvedAnimation
                .parent as AnimationController)
            .forward(from: 0.0);

        HapticFeedback.heavyImpact();
        mydevicesAuto = await ContextMyBORCall.call(
          type: 'MYDEVICES',
          userid: FFAppState().userid,
          token: FFAppState().token,
        );
        setState(() => FFAppState().Buttons = getJsonField(
              (mydevicesAuto?.jsonBody ?? ''),
              r'''$.data.buttons''',
            ).toList());
        setState(() => FFAppState().Cams = getJsonField(
              (mydevicesAuto?.jsonBody ?? ''),
              r'''$.data.cameras''',
            ).toList());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login Eseguito con Successo',
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).subtitle1Family),
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          ),
        );
        if (loggedIn) {
          await Future.delayed(const Duration(milliseconds: 1));
        } else {
          final user = await signInAnonymously(context);
          if (user == null) {
            return;
          }
        }

        await Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 1000),
            reverseDuration: Duration(milliseconds: 1000),
            child: LandingPageWidget(
              fromLogin: true,
            ),
          ),
          (r) => false,
        );
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Errore'),
              content: Text('Login non riusito'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
    });

    passWordController = TextEditingController(text: FFAppState().Password);
    passWordVisibility = false;
    userNameController = TextEditingController(text: FFAppState().Username);
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Image.asset(
                        'assets/images/newlogoblack.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.contain,
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Image.asset(
                        'assets/images/newlogoblack.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.contain,
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: userNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family),
                                        ),
                                    hintText: 'Enter your email...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 0),
                                child: TextFormField(
                                  controller: passWordController,
                                  obscureText: !passWordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family),
                                        ),
                                    hintText: 'Enter your password...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passWordVisibility =
                                            !passWordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        passWordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF57636C),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 0, 25, 0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: CheckboxListTile(
                                      value: saveCredentialsValue ??=
                                          FFAppState().SaveCredentials,
                                      onChanged: (newValue) => setState(() =>
                                          saveCredentialsValue = newValue!),
                                      title: Text(
                                        'Salva Credenziali',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 25, 0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: autoLoginValue ??=
                                        FFAppState().AutoLogin,
                                    onChanged: (newValue) => setState(
                                        () => autoLoginValue = newValue!),
                                    title: Text(
                                      'LoginAutomatico',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2Family),
                                          ),
                                    ),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 2),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  HapticFeedback.heavyImpact();
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation'] ==
                                      null) {
                                    return;
                                  }
                                  await (animationsMap[
                                              'buttonOnActionTriggerAnimation']!
                                          .curvedAnimation
                                          .parent as AnimationController)
                                      .forward(from: 0.0);

                                  final local_auth = LocalAuthentication();
                                  bool _isBiometricSupported =
                                      await local_auth.isDeviceSupported();

                                  if (_isBiometricSupported) {
                                    bioAuth = await local_auth.authenticate(
                                        localizedReason:
                                            'Per favore utilizza l\'autorizzazione biometrica per essere autorizzato');
                                    setState(() {});
                                  }

                                  _shouldSetState = true;
                                  responseLogin = await LoginCall.call(
                                    username: userNameController!.text,
                                    password: passWordController!.text,
                                  );
                                  _shouldSetState = true;
                                  if (random_data.randomInteger(200, 200) ==
                                      valueOrDefault<dynamic>(
                                        getJsonField(
                                          (responseLogin?.jsonBody ?? ''),
                                          r'''$.status''',
                                        ),
                                        404,
                                      )) {
                                    setState(
                                        () => FFAppState().token = getJsonField(
                                              (responseLogin?.jsonBody ?? ''),
                                              r'''$.token.token''',
                                            ).toString());
                                    setState(() =>
                                        FFAppState().userid = getJsonField(
                                          (responseLogin?.jsonBody ?? ''),
                                          r'''$.user_id''',
                                        ));
                                    if (saveCredentialsValue!) {
                                      setState(() => FFAppState().Username =
                                          userNameController!.text);
                                      setState(() => FFAppState().Password =
                                          passWordController!.text);
                                      setState(() => FFAppState().AutoLogin =
                                          autoLoginValue!);
                                      setState(() =>
                                          FFAppState().SaveCredentials =
                                              saveCredentialsValue!);
                                    } else {
                                      setState(
                                          () => FFAppState().Username = '');
                                      setState(
                                          () => FFAppState().Password = '');
                                      setState(
                                          () => FFAppState().AutoLogin = false);
                                      setState(() =>
                                          FFAppState().SaveCredentials = false);
                                    }

                                    setState(() => FFAppState().Buttons = []);
                                    setState(() => FFAppState().Cams = []);
                                    HapticFeedback.heavyImpact();
                                    if (animationsMap[
                                            'buttonOnActionTriggerAnimation'] ==
                                        null) {
                                      return;
                                    }
                                    await (animationsMap[
                                                'buttonOnActionTriggerAnimation']!
                                            .curvedAnimation
                                            .parent as AnimationController)
                                        .forward(from: 0.0);

                                    mydevices = await ContextMyBORCall.call(
                                      type: 'MYDEVICES',
                                      userid: FFAppState().userid,
                                      token: FFAppState().token,
                                    );
                                    _shouldSetState = true;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Login Eseguito con Successo',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle1Family),
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                      ),
                                    );
                                    setState(() =>
                                        FFAppState().Buttons = getJsonField(
                                          (mydevices?.jsonBody ?? ''),
                                          r'''$.data.buttons''',
                                        ).toList());
                                    setState(
                                        () => FFAppState().Cams = getJsonField(
                                              (mydevices?.jsonBody ?? ''),
                                              r'''$.data.cameras''',
                                            ).toList());
                                    if (loggedIn) {
                                      await Future.delayed(
                                          const Duration(milliseconds: 1));
                                    } else {
                                      final user =
                                          await signInAnonymously(context);
                                      if (user == null) {
                                        return;
                                      }
                                    }

                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 1000),
                                        reverseDuration:
                                            Duration(milliseconds: 1000),
                                        child: LandingPageWidget(
                                          fromLogin: true,
                                        ),
                                      ),
                                      (r) => false,
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Errore'),
                                          content: Text('Login non riusito'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Sign In',
                                icon: Icon(
                                  Icons.fingerprint_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 40,
                                ),
                                options: FFButtonOptions(
                                  width: 230,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 15),
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ).animated([
                                animationsMap['buttonOnActionTriggerAnimation']!
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Developed By BorInnova',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
