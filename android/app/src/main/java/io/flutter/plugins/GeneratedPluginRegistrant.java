package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.gyagapen.settingsmenu.accesssettingsmenu.AccessSettingsMenuPlugin;
import com.lyokone.location.LocationPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AccessSettingsMenuPlugin.registerWith(registry.registrarFor("com.gyagapen.settingsmenu.accesssettingsmenu.AccessSettingsMenuPlugin"));
    LocationPlugin.registerWith(registry.registrarFor("com.lyokone.location.LocationPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
