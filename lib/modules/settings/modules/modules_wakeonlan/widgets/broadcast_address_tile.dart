import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/settings.dart';

class SettingsModulesWakeOnLANBroadcastAddressTile extends StatelessWidget {
    @override
    Widget build(BuildContext context) => LSCardTile(
        title: LSTitle(text: 'Broadcast Address'),
        subtitle: LSSubtitle(
            text: Database.currentProfileObject.wakeOnLANBroadcastAddress == null || Database.currentProfileObject.wakeOnLANBroadcastAddress == ''
                ? 'Not Set'
                : Database.currentProfileObject.wakeOnLANBroadcastAddress,
        ),
        trailing: LSIconButton(icon: Icons.arrow_forward_ios),
        onTap: () async => _changeAddress(context),
    );

    Future<void> _changeAddress(BuildContext context) async {
        List<dynamic> _values = await SettingsDialogs.editBroadcastAddress(context, Database.currentProfileObject.wakeOnLANBroadcastAddress ?? '');
        if(_values[0]) {
            Database.currentProfileObject.wakeOnLANBroadcastAddress = _values[1];
            Database.currentProfileObject.save();
        }
    }
}