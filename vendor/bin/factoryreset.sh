#!/system/bin/sh

MARK=/data/local/sbx_instal_20122022
PWR_DIR=/data/data/ru.littlevictor.powermenu
PWR_CFG=/product/media/powermenu
if [ ! -e $MARK ]; then

# Hide bars
settings put system hide_bar_status 1
settings put system hide_nav_bar_status 1
killall com.android.systemui

# User setup complete
settings put global device_provisioned 1
settings put secure user_setup_complete 1
settings put secure tv_usersetup_complete 1

# Disable Play Protect
settings put global package_verifier_enable 0
settings put global package_verifier_user_consent -1
settings put global upload_apk_enable 0
settings put secure assist_structure_enabled 0
settings put secure accessibility_shortcut_enabled 0
settings put secure assist_screenshot_enabled 0

pm disable com.google.android.gms/.update.phone.PopupDialog
pm disable com.google.android.gms/com.google.android.gms.update.SystemUpdateActivity
pm disable com.google.android.gms/com.google.android.gms.update.SystemUpdateService$Receiver
pm disable com.google.android.gms/com.google.android.gms.update.SystemUpdateService$ActiveReceiver
pm disable com.google.android.gms/com.google.android.gms.update.SystemUpdateService$SecretCodeReceiver

# Allow apps from unknown sources
settings put secure install_non_market_apps 1

# Animation scale
settings put global transition_animation_scale 0.25
settings put global window_animation_scale 0.25
settings put global animator_duration_scale 0.25

# Adb
settings put global adb_enabled 1
setprop persist.sys.wifi.adb "true"
settings put global adb_wifi_enabled 1

# Allow location services by network
settings put secure location_mode 3
settings put secure location_providers_allowed passive,gps,wifi,fused,network

# Screensaver
settings put secure screensaver_components com.google.android.backdrop/.Backdrop
settings put secure screensaver_default_component screensaver_components com.google.android.backdrop/.Backdrop
settings put secure screensaver_enabled 0

# Keyboard
ime enable com.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
ime set com.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
settings put secure default_input_method com.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
settings put secure show_ime_with_hard_keyboard 1

# Information status bar
settings put system sys_misc_cpu_freq 1
settings put system sys_misc_cpu_load 1
settings put system sys_misc_cpu_temp 1
settings put system sys_misc_display_format 1
settings put system sys_misc_ram_info 1
settings put system sys_misc_show_display_mode 1

# Pre-setting device
settings put global bluetooth_on 1
settings put global captive_portal_mode 0
settings put global development_settings_enabled 1
settings put global dropbox_max_files 0
settings put global hdmi_control_enabled 0
settings put global hdmi_tv_volume_control_enabled 0
settings put global heads_up_notifications_enabled 0
settings put global show_notification_channel_warnings 0
settings put global stay_on_while_plugged_in 0
settings put global device_name "slimBOXtv"
settings put global wifi_p2p_device_name slimBOXtv
settings put secure enabled_notification_listeners 1
settings put secure icon_blacklist battery
settings put secure theme_mode 2
settings put secure ui_night_mode 2
settings put system pointer_speed 2
settings put system sound_effects_enabled 0
settings put system afr_enable 0
settings put system app_volume_control 0
settings put system video_screenshot_mode 1

# Default launcher
pm set-home-activity com.google.android.tvlauncher/.MainActivity

# Permission for Gallery2
pm grant com.android.gallery3d android.permission.READ_EXTERNAL_STORAGE
pm grant com.android.gallery3d android.permission.WRITE_EXTERNAL_STORAGE

# Permission for CpuFloat
pm grant com.waterdaaan.cpufloat android.permission.READ_EXTERNAL_STORAGE
pm grant com.waterdaaan.cpufloat android.permission.WRITE_EXTERNAL_STORAGE

# Init.d
unzip /product/media/init_d -o -q -d /data/media/0

# ViPER4Android Kernel
mkdir -p /data/media/0/Android/data/com.pittvandewitt.viperfx/files/
unzip /product/media/viper4_kernel -o -q -d /sdcard/Android/data/com.pittvandewitt.viperfx/files

# Wallpapers
mkdir -p /data/media/0/Pictures
unzip /product/media/wallpapers -o -q -d /sdcard/Pictures

# PowerMenu settings
if [ -e $PWR_DIR ];then
if [ ! -e $PWR_DIR/shared_prefs/ ];then
mkdir $PWR_DIR/shared_prefs/
chmod 777 $PWR_DIR/shared_prefs/
fi
cp -rf $PWR_CFG  $PWR_DIR/shared_prefs/
mv -f /data/data/ru.littlevictor.powermenu/shared_prefs/powermenu /data/data/ru.littlevictor.powermenu/shared_prefs/ru.littlevictor.powermenu_preferences.xml
chmod 777 /data/data/ru.littlevictor.powermenu/shared_prefs/ru.littlevictor.powermenu_preferences.xml
fi

touch $MARK
fi
exit 1
