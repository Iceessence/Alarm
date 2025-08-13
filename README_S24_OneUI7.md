SmartAlarm v8 — Samsung S24 Ultra (Android 15 / One UI 7)
=========================================================

What’s new for your device:
- **Max-volume boost (optional):** when enabled in the set editor, the native service temporarily sets the **Alarm volume** to max while ringing, then restores it when you press STOP/SNOOZE.
- **Aggressive audio fallbacks:** raw sound -> default alarm ringtone -> SoundPool beep.
- **Full-screen popup** over the lockscreen via `setAlarmClock()` + `USE_FULL_SCREEN_INTENT`.
- **Shortcuts** to open Exact Alarms and Battery Optimization settings (expose through plugin if you want buttons).

Samsung-specific setup (once):
1. **Settings → Notifications → Do not disturb → Exceptions** → ensure **Alarms** are allowed.
2. **Settings → Apps → SmartAlarm** (your app id) → *Allow notifications* ON.
3. **Settings → Apps → SmartAlarm → Battery** → allow background activity; remove from **Sleeping apps/Restricted**.
4. **Settings → Apps → Special access → Alarms & reminders** → allow your app (Android 12+ exact alarms).
5. In the app, for a set you want loud, choose **Boost to max: Yes**.

How to install:
- Merge `android_src/**` into your Capacitor project, then merge `AndroidManifest.snippet.xml` into the app manifest.
- `npx cap copy && npx cap open android` → Build & install from Android Studio.

Quick test:
- Create a set for 1 minute ahead (enable **Boost to max**) and lock the screen.
- You should see the full-screen sheet + hear a ramping tone + feel vibration.