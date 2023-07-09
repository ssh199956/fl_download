#include "include/fl_download/fl_download_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "fl_download_plugin.h"

void FlDownloadPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  fl_download::FlDownloadPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
