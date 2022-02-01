package com.github.droibit.flutter.plugins.customtabs;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Browser;
import androidx.annotation.NonNull;
import androidx.browser.customtabs.CustomTabsIntent;
import com.github.droibit.flutter.plugins.customtabs.internal.Launcher;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import java.util.List;
import java.util.Map;

public class CustomTabsPlugin implements MethodChannel.MethodCallHandler {

  /**
   * Plugin registration.
   */
  public static void registerWith(PluginRegistry.Registrar registrar) {
    final MethodChannel channel =
        new MethodChannel(registrar.messenger(), "com.github.droibit.flutter.plugins.custom_tabs");
    channel.setMethodCallHandler(new CustomTabsPlugin(registrar));
  }

  private static final String KEY_OPTION = "option";

  private static final String KEY_URL = "url";

  private static final String KEY_EXTRA_CUSTOM_TABS = "extraCustomTabs";

  private static final String CODE_LAUNCH_ERROR = "LAUNCH_ERROR";

  private final PluginRegistry.Registrar registrar;

  private final Launcher launcher;

  private CustomTabsPlugin(@NonNull PluginRegistry.Registrar registrar) {
    this.registrar = registrar;
    this.launcher = new Launcher(registrar.activeContext());
  }

  @SuppressWarnings("unchecked") @Override
  public void onMethodCall(MethodCall call, final MethodChannel.Result result) {
    switch (call.method) {
      case "launch":
        launch(((Map<String, Object>) call.arguments), result);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  @SuppressWarnings("unchecked")
  private void launch(@NonNull Map<String, Object> args, @NonNull MethodChannel.Result result) {
    final Uri uri = Uri.parse(args.get(KEY_URL).toString());
    final Map<String, Object> options = (Map<String, Object>) args.get(KEY_OPTION);
    final CustomTabsIntent customTabsIntent = launcher.buildIntent(options);

    final Context context;
    if (registrar.activity() != null) {
      context = registrar.activity();
    } else {
      context = registrar.context();
      customTabsIntent.intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    try {
      final List<String> extraCustomTabs;
      if (options.containsKey(KEY_EXTRA_CUSTOM_TABS)) {
        extraCustomTabs = ((List<String>) options.get(KEY_EXTRA_CUSTOM_TABS));
      } else {
        extraCustomTabs = null;
      }
      launcher.launch(context, uri, customTabsIntent, extraCustomTabs);
      result.success(null);
    } catch (ActivityNotFoundException e) {
      result.error(CODE_LAUNCH_ERROR, e.getMessage(), null);
    }
  }
}
