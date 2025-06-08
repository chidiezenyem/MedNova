import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class VideoCallPage extends StatelessWidget {
  final String channelId;

  const VideoCallPage({super.key, required this.channelId});

  void _joinMeeting() {
    print('🔄 Join Meeting button tapped');

    final jitsi = JitsiMeet();
    final options = JitsiMeetConferenceOptions(
      room: channelId,
      configOverrides: {
        "startWithAudioMuted": false,
        "startWithVideoMuted": false,
      },
      userInfo: JitsiMeetUserInfo(displayName: channelId),
      featureFlags: {
        FeatureFlags.welcomePageEnabled: false,
      },
    );

    try {
      jitsi.join(options);
      print('✅ jitsi.join() called successfully');
    } catch (e, trace) {
      print('❗ Error calling jitsi.join(): $e');
      print(trace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jitsi Video Call')),
      body: Center(
        child: ElevatedButton(
          onPressed: _joinMeeting,
          child: const Text('Join Meeting'),
        ),
      ),
    );
  }
}
