import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../notifications/notifications_widget.dart';
import 'dart:ui';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({
    Key? key,
    this.fromLogin,
  }) : super(key: key);

  final bool? fromLogin;

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? gridButtonOff;
  ApiCallResponse? gridButtonOn;
  bool biosingleauth = false;
  ApiCallResponse? mydevicespost;
  ApiCallResponse? lineoffstatus;
  ApiCallResponse? mydevicesoffupdate;
  ApiCallResponse? lineresponseOn;
  ApiCallResponse? mydevicesonupdate;
  PageController? pageViewController1;
  PageController? pageViewController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'badgeOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0.3,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 100,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.9,
        opacity: 1,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconButtonOnActionTriggerAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
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
      await pageViewController1?.animateToPage(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      await pageViewController2?.animateToPage(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
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
      backgroundColor: Color(0xFFF1F4F8),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  alignment: AlignmentDirectional(0, -1),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -0.4),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0,
                                      color: Color(0xFFE0E3E7),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Text(
                                                FFAppState().Username,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animated([
                                animationsMap['containerOnPageLoadAnimation5']!
                              ]),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                              child: InkWell(
                                onTap: () async {
                                  if (scaffoldKey.currentState!.isDrawerOpen ||
                                      scaffoldKey
                                          .currentState!.isEndDrawerOpen) {
                                    Navigator.pop(context);
                                  }

                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: NotificationsWidget(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Badge(
                                          badgeContent: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  color: Colors.white,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                          showBadge: true,
                                          shape: BadgeShape.circle,
                                          badgeColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          elevation: 4,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          position: BadgePosition.topEnd(),
                                          animationType:
                                              BadgeAnimationType.scale,
                                          toAnimate: true,
                                          child: Icon(
                                            Icons.notifications,
                                            color: Colors.black,
                                            size: 32,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: Text(
                                                  'Notifiche',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1Family),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF1F4F8),
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color: Color(0xFF57636C),
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animated([
                                animationsMap['containerOnPageLoadAnimation6']!
                              ]),
                            ),
                            ClipRect(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY: 2,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 1),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0,
                                          color: Color(0xFFE0E3E7),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.codepen,
                                                  color: Colors.black,
                                                  size: 32,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    'Bor I/O',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF1F4F8),
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 4, 4, 4),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: Color(0xFF57636C),
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animated([
                                    animationsMap[
                                        'containerOnPageLoadAnimation7']!
                                  ]),
                                ),
                              ),
                            ),
                            ClipRect(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY: 2,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 1),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0,
                                          color: Color(0xFFE0E3E7),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Icon(
                                              Icons.settings_outlined,
                                              color: Colors.black,
                                              size: 32,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Impostazioni',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF1F4F8),
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 4, 4, 4),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: Color(0xFF57636C),
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animated([
                                    animationsMap[
                                        'containerOnPageLoadAnimation8']!
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.8),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.asset(
                                  'assets/images/newlogoblack.png',
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: 'imageTag2',
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'imageTag2',
                          transitionOnUserGestures: true,
                          child: Image.asset(
                            'assets/images/newlogoblack.png',
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.75),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => FFAppState().AutoLogin = false);
                          await signOut();
                          await Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                              reverseDuration: Duration(milliseconds: 0),
                              child: LoginPageWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Logout',
                        icon: Icon(
                          Icons.logout,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: FaIcon(
                                          FontAwesomeIcons.phoneSquareAlt,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          await launchURL('tel:+39800126494');
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: FaIcon(
                                          FontAwesomeIcons.chrome,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              'https://www.borsecurity.it/');
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.outgoing_mail,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              'mailto:info@borsecurity.it');
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: 500,
                child: Stack(
                  alignment: AlignmentDirectional(0, -1),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0x8D090F13),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.41,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final myCam = FFAppState().Cams.toList();
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.41,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 25, 0, 0),
                                          child: PageView.builder(
                                            controller: pageViewController1 ??=
                                                PageController(
                                                    initialPage: min(
                                                        0, myCam.length - 1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: myCam.length,
                                            itemBuilder: (context, myCamIndex) {
                                              final myCamItem =
                                                  myCam[myCamIndex];
                                              return Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.5,
                                                  child:
                                                      custom_widgets.Showmjpeg(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                    url: valueOrDefault<String>(
                                                      getJsonField(
                                                        myCamItem,
                                                        r'''$.path''',
                                                      ).toString(),
                                                      'http://borio.ddns.net:300/video',
                                                    ),
                                                  ),
                                                ).animated([
                                                  animationsMap[
                                                      'containerOnPageLoadAnimation1']!
                                                ]),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.6),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 0),
                                            child: SmoothPageIndicator(
                                              controller:
                                                  pageViewController1 ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              myCam.length -
                                                                  1)),
                                              count: myCam.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) {
                                                pageViewController1!
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              effect: ExpandingDotsEffect(
                                                expansionFactor: 2,
                                                spacing: 8,
                                                radius: 16,
                                                dotWidth: 16,
                                                dotHeight: 16,
                                                dotColor: Color(0xFF9E9E9E),
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final myCamHorizontal =
                                        FFAppState().Cams.toList();
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      child: Stack(
                                        children: [
                                          PageView.builder(
                                            controller: pageViewController2 ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        myCamHorizontal.length -
                                                            1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: myCamHorizontal.length,
                                            itemBuilder: (context,
                                                myCamHorizontalIndex) {
                                              final myCamHorizontalItem =
                                                  myCamHorizontal[
                                                      myCamHorizontalIndex];
                                              return Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  child:
                                                      custom_widgets.Showmjpeg(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    url: valueOrDefault<String>(
                                                      getJsonField(
                                                        myCamHorizontalItem,
                                                        r'''$.path''',
                                                      ).toString(),
                                                      'http://borio.ddns.net:300/video',
                                                    ),
                                                  ),
                                                ).animated([
                                                  animationsMap[
                                                      'containerOnPageLoadAnimation2']!
                                                ]),
                                              );
                                            },
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0.85),
                                            child: SmoothPageIndicator(
                                              controller:
                                                  pageViewController2 ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              myCamHorizontal
                                                                      .length -
                                                                  1)),
                                              count: myCamHorizontal.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) {
                                                pageViewController2!
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              effect: ExpandingDotsEffect(
                                                expansionFactor: 2,
                                                spacing: 8,
                                                radius: 16,
                                                dotWidth: 16,
                                                dotHeight: 16,
                                                dotColor: Color(0xFF9E9E9E),
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                    ))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.15, 0),
                                                  child: Text(
                                                    'Welcome in MYBOR',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 15, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Badge(
                                                  badgeContent: Text(
                                                    FFAppState()
                                                        .Notifications
                                                        .length
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                  ),
                                                  showBadge:
                                                      random_data.randomInteger(
                                                              0, 0) !=
                                                          FFAppState()
                                                              .Notifications
                                                              .length,
                                                  shape: BadgeShape.circle,
                                                  badgeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  elevation: 4,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  position:
                                                      BadgePosition.topStart(),
                                                  animationType:
                                                      BadgeAnimationType.scale,
                                                  toAnimate: true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3, 7, 0, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        scaffoldKey
                                                            .currentState!
                                                            .openEndDrawer();
                                                      },
                                                      child: Icon(
                                                        Icons.menu_rounded,
                                                        color: Colors.black,
                                                        size: 32,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        ],
                      ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tabletLandscape: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                          ))
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.66,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Divider(
                                        height: 8,
                                        thickness: 4,
                                        indent: 140,
                                        endIndent: 140,
                                        color: Color(0xFFE0E3E7),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Badge(
                                                  badgeContent: Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .Buttons
                                                          .length
                                                          .toString(),
                                                      '1',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                  ),
                                                  showBadge: true,
                                                  shape: BadgeShape.circle,
                                                  badgeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  elevation: 4,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  position:
                                                      BadgePosition.topEnd(),
                                                  animationType:
                                                      BadgeAnimationType.scale,
                                                  toAnimate: true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 9, 2, 2),
                                                    child: Text(
                                                      'Devices',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF1D2429),
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .title2Family),
                                                              ),
                                                    ).animated([
                                                      animationsMap[
                                                          'textOnPageLoadAnimation']!
                                                    ]),
                                                  ),
                                                ).animated([
                                                  animationsMap[
                                                      'badgeOnPageLoadAnimation']!
                                                ]),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState().ListView)
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.25, 0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: Icon(
                                                  Icons.view_list,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                                onPressed: () async {
                                                  setState(() => FFAppState()
                                                      .ListView = false);
                                                  setState(() => FFAppState()
                                                      .GridView = true);
                                                },
                                              ),
                                            ),
                                          if (FFAppState().GridView)
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.25, 0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: Icon(
                                                  Icons.grid_view,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                                onPressed: () async {
                                                  setState(() => FFAppState()
                                                      .GridView = true);
                                                  setState(() => FFAppState()
                                                      .ListView = false);
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (FFAppState().GridView)
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final gridLine =
                                                        FFAppState()
                                                            .Buttons
                                                            .toList();
                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 1,
                                                        mainAxisSpacing: 1,
                                                        childAspectRatio: 1,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          gridLine.length,
                                                      itemBuilder: (context,
                                                          gridLineIndex) {
                                                        final gridLineItem =
                                                            gridLine[
                                                                gridLineIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10,
                                                                      10,
                                                                      10,
                                                                      10),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              HapticFeedback
                                                                  .vibrate();
                                                              if (animationsMap[
                                                                      'containerOnActionTriggerAnimation'] ==
                                                                  null) {
                                                                return;
                                                              }
                                                              await (animationsMap[
                                                                              'containerOnActionTriggerAnimation']!
                                                                          .curvedAnimation
                                                                          .parent
                                                                      as AnimationController)
                                                                  .forward(
                                                                      from:
                                                                          0.0);

                                                              if (getJsonField(
                                                                gridLineItem,
                                                                r'''$.online''',
                                                              )) {
                                                                if (getJsonField(
                                                                  gridLineItem,
                                                                  r'''$.auth''',
                                                                )) {
                                                                  final local_auth =
                                                                      LocalAuthentication();
                                                                  bool
                                                                      _isBiometricSupported =
                                                                      await local_auth
                                                                          .isDeviceSupported();

                                                                  if (_isBiometricSupported) {
                                                                    biosingleauth =
                                                                        await local_auth.authenticate(
                                                                            localizedReason:
                                                                                'Per favore devi essere autenticato');
                                                                    setState(
                                                                        () {});
                                                                  }

                                                                  _shouldSetState =
                                                                      true;
                                                                  if (biosingleauth!) {
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            1));
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1));
                                                                } else {
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1));
                                                                }

                                                                if (getJsonField(
                                                                  gridLineItem,
                                                                  r'''$.state''',
                                                                )) {
                                                                  gridButtonOn =
                                                                      await TriggerCall
                                                                          .call(
                                                                    type:
                                                                        'TRIGGER',
                                                                    userid: FFAppState()
                                                                        .userid,
                                                                    token: FFAppState()
                                                                        .token,
                                                                    buttonid:
                                                                        getJsonField(
                                                                      gridLineItem,
                                                                      r'''$.id''',
                                                                    ).toString(),
                                                                    newstate:
                                                                        'off',
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                } else {
                                                                  gridButtonOff =
                                                                      await TriggerCall
                                                                          .call(
                                                                    type:
                                                                        'TRIGGER',
                                                                    userid: FFAppState()
                                                                        .userid,
                                                                    token: FFAppState()
                                                                        .token,
                                                                    buttonid:
                                                                        getJsonField(
                                                                      gridLineItem,
                                                                      r'''$.id''',
                                                                    ).toString(),
                                                                    newstate:
                                                                        'on',
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                }

                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation'] ==
                                                                    null) {
                                                                  return;
                                                                }
                                                                await (animationsMap['containerOnActionTriggerAnimation']!
                                                                            .curvedAnimation
                                                                            .parent
                                                                        as AnimationController)
                                                                    .forward(
                                                                        from:
                                                                            0.0);

                                                                HapticFeedback
                                                                    .heavyImpact();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Comando inviato con successo',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                  ),
                                                                );
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'System',
                                                                  notificationText:
                                                                      'Comando inviato con successo',
                                                                  notificationSound:
                                                                      'default',
                                                                  userRefs: [
                                                                    currentUserReference!
                                                                  ],
                                                                  initialPageName:
                                                                      'LandingPage',
                                                                  parameterData: {
                                                                    'fromLogin':
                                                                        false,
                                                                  },
                                                                );
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            2500));
                                                                mydevicespost =
                                                                    await ContextMyBORCall
                                                                        .call(
                                                                  type:
                                                                      'MYDEVICES',
                                                                  userid:
                                                                      FFAppState()
                                                                          .userid,
                                                                  token:
                                                                      FFAppState()
                                                                          .token,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                setState(() =>
                                                                    FFAppState()
                                                                            .Buttons =
                                                                        getJsonField(
                                                                      (mydevicespost
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data.buttons''',
                                                                    ).toList());
                                                              } else {
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 4,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                              ),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              2),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                ),
                                                                child: Builder(
                                                                    builder:
                                                                        (_) {
                                                                  final child =
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  if (!getJsonField(
                                                                                    gridLineItem,
                                                                                    r'''$.online''',
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 5, 5),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.powerOff,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 22,
                                                                                      ),
                                                                                    ),
                                                                                  if (getJsonField(
                                                                                    gridLineItem,
                                                                                    r'''$.istrue''',
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 5, 5),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.powerOff,
                                                                                        color: Color(0xFF3A9944),
                                                                                        size: 22,
                                                                                      ),
                                                                                    ),
                                                                                  if (!getJsonField(
                                                                                    gridLineItem,
                                                                                    r'''$.isfalse''',
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 5, 5),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.powerOff,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        size: 22,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 10),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              getJsonField(
                                                                                                gridLineItem,
                                                                                                r'''$.siteName''',
                                                                                              ).toString().maybeHandleOverflow(maxChars: 10),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                    fontSize: 7,
                                                                                                    fontWeight: FontWeight.w200,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            gridLineItem,
                                                                                            r'''$.label''',
                                                                                          ).toString(),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        getJsonField(
                                                                                          gridLineItem,
                                                                                          r'''$.description''',
                                                                                        ).toString(),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                              fontSize: 10,
                                                                                              fontWeight: FontWeight.w300,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                  if (!getJsonField(
                                                                    gridLineItem,
                                                                    r'''$.online''',
                                                                  )) {
                                                                    return ClipRect(
                                                                      child:
                                                                          ImageFiltered(
                                                                        imageFilter:
                                                                            ImageFilter.blur(
                                                                          sigmaX:
                                                                              1,
                                                                          sigmaY:
                                                                              0.7,
                                                                        ),
                                                                        child:
                                                                            child,
                                                                      ),
                                                                    );
                                                                  }
                                                                  return child;
                                                                }),
                                                              ),
                                                            ),
                                                          ).animated([
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation3']!,
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                          ]),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (FFAppState().ListView)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 16),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.55,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final lineButton =
                                                          FFAppState()
                                                              .Buttons
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            lineButton.length,
                                                        itemBuilder: (context,
                                                            lineButtonIndex) {
                                                          final lineButtonItem =
                                                              lineButton[
                                                                  lineButtonIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.95,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(0, 2),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child: Builder(
                                                                          builder:
                                                                              (_) {
                                                                        final child =
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (!getJsonField(
                                                                                  lineButtonItem,
                                                                                  r'''$.online''',
                                                                                ))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 16,
                                                                                      borderWidth: 1,
                                                                                      buttonSize: 60,
                                                                                      fillColor: FlutterFlowTheme.of(context).lineColor,
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.powerOff,
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        size: 40,
                                                                                      ),
                                                                                      onPressed: () {
                                                                                        print('IconButton pressed ...');
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                if (!getJsonField(
                                                                                  lineButtonItem,
                                                                                  r'''$.isfalse''',
                                                                                ))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child:
                                                                                        FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 16,
                                                                                      borderWidth: 1,
                                                                                      buttonSize: 60,
                                                                                      fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.powerOff,
                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                        size: 40,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        if (getJsonField(
                                                                                          lineButtonItem,
                                                                                          r'''$.auth''',
                                                                                        )) {
                                                                                          HapticFeedback.vibrate();
                                                                                        } else {
                                                                                          HapticFeedback.vibrate();
                                                                                        }

                                                                                        lineresponseOn = await TriggerCall.call(
                                                                                          type: 'TRIGGER',
                                                                                          userid: FFAppState().userid,
                                                                                          token: FFAppState().token,
                                                                                          buttonid: getJsonField(
                                                                                            lineButtonItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          newstate: 'on',
                                                                                        );
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              getJsonField(
                                                                                                (lineresponseOn?.jsonBody ?? ''),
                                                                                                r'''$.response''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                fontSize: 16,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0xFF3A9944),
                                                                                          ),
                                                                                        );
                                                                                        await Future.delayed(const Duration(milliseconds: 2500));
                                                                                        mydevicesonupdate = await ContextMyBORCall.call(
                                                                                          type: 'MYDEVICES',
                                                                                          userid: FFAppState().userid,
                                                                                          token: FFAppState().token,
                                                                                        );
                                                                                        setState(() => FFAppState().Buttons = getJsonField(
                                                                                              (mydevicesonupdate?.jsonBody ?? ''),
                                                                                              r'''$.data.buttons''',
                                                                                            ).toList());

                                                                                        setState(() {});
                                                                                      },
                                                                                    ).animated([
                                                                                      animationsMap['iconButtonOnActionTriggerAnimation1']!
                                                                                    ]),
                                                                                  ),
                                                                                if (getJsonField(
                                                                                  lineButtonItem,
                                                                                  r'''$.istrue''',
                                                                                ))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child:
                                                                                        FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 16,
                                                                                      borderWidth: 1,
                                                                                      buttonSize: 60,
                                                                                      fillColor: Color(0xFF3A9944),
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.powerOff,
                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                        size: 40,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        lineoffstatus = await TriggerCall.call(
                                                                                          type: 'TRIGGER',
                                                                                          userid: FFAppState().userid,
                                                                                          token: FFAppState().token,
                                                                                          buttonid: getJsonField(
                                                                                            lineButtonItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          newstate: 'off',
                                                                                        );
                                                                                        HapticFeedback.selectionClick();
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              getJsonField(
                                                                                                (lineoffstatus?.jsonBody ?? ''),
                                                                                                r'''$.response''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                fontSize: 16,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0xFF3A9944),
                                                                                          ),
                                                                                        );
                                                                                        await Future.delayed(const Duration(milliseconds: 2500));
                                                                                        mydevicesoffupdate = await ContextMyBORCall.call(
                                                                                          type: 'MYDEVICES',
                                                                                          userid: FFAppState().userid,
                                                                                          token: FFAppState().token,
                                                                                        );
                                                                                        setState(() => FFAppState().Buttons = getJsonField(
                                                                                              (mydevicesoffupdate?.jsonBody ?? ''),
                                                                                              r'''$.data.buttons''',
                                                                                            ).toList());

                                                                                        setState(() {});
                                                                                      },
                                                                                    ).animated([
                                                                                      animationsMap['iconButtonOnActionTriggerAnimation2']!
                                                                                    ]),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              lineButtonItem,
                                                                                              r'''$.label''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  fontSize: 22,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            lineButtonItem,
                                                                                            r'''$.description''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 20),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              lineButtonItem,
                                                                                              r'''$.stateDescription''',
                                                                                            ).toString(),
                                                                                            'Spento',
                                                                                          ),
                                                                                          textAlign: TextAlign.end,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                fontSize: 10,
                                                                                                fontWeight: FontWeight.w100,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 20, 0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            lineButtonItem,
                                                                                            r'''$.siteName''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                        if (!getJsonField(
                                                                          lineButtonItem,
                                                                          r'''$.online''',
                                                                        )) {
                                                                          return ClipRect(
                                                                            child:
                                                                                ImageFiltered(
                                                                              imageFilter: ImageFilter.blur(
                                                                                sigmaX: 1,
                                                                                sigmaY: 0.7,
                                                                              ),
                                                                              child: child,
                                                                            ),
                                                                          );
                                                                        }
                                                                        return child;
                                                                      }),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ).animated([
                                                  animationsMap[
                                                      'containerOnPageLoadAnimation4']!
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
