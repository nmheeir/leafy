import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/domain/models/ai_provider.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/ai_settings/ai_settings_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class AISettingsScreen extends StatefulWidget {
  const AISettingsScreen({super.key});

  @override
  State<AISettingsScreen> createState() => _AISettingsScreenState();
}

class _AISettingsScreenState extends State<AISettingsScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    final state = context.aiSettingsCubit.state;
    if (state.apiKey != null) {
      _controller.text = state.apiKey!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AISettingsCubit, AISettingsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
        }
        // Update text controller when apiKey changes (e.g. switching provider)
        if (state.apiKey != null && _controller.text != state.apiKey) {
          _controller.text = state.apiKey!;
        } else if (state.apiKey == null) {
          _controller.text = '';
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.ai_api_key_setting_config.tr()),
          ),
          body: state.isLoading && state.availableModels.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SettingsList(
                  lightTheme: const SettingsThemeData(
                    settingsListBackground: Colors.white,
                  ),
                  darkTheme: const SettingsThemeData(
                    settingsListBackground: Colors.black,
                  ),
                  sections: [
                    SettingsSection(
                      title: Text(LocaleKeys.ai_api_key_setting_provider.tr()),
                      tiles: [
                        CustomSettingsTile(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: DropdownButton<AIProvider>(
                              value: state.selectedProvider,
                              isExpanded: true,
                              items: AIProvider.values.map((provider) {
                                return DropdownMenuItem(
                                  value: provider,
                                  child: Text(provider.name.toUpperCase()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  context.aiSettingsCubit.setProvider(value);
                                  _controller.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: Text(LocaleKeys.ai_api_key_setting_api_key.tr()),
                      tiles: [
                        CustomSettingsTile(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nhập ${state.selectedProvider.name.toUpperCase()} API Key của bạn.',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _controller,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: LocaleKeys
                                        .ai_api_key_setting_api_key
                                        .tr(),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton.icon(
                                    onPressed: () {
                                      context.aiSettingsCubit.setApiKey(
                                        _controller.text.trim(),
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            LocaleKeys
                                                .ai_api_key_setting_saving_loading_models
                                                .tr(),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.save),
                                    label: Text(
                                      LocaleKeys
                                          .ai_api_key_setting_save_load_models
                                          .tr(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state.availableModels.isNotEmpty)
                      SettingsSection(
                        title: Text(
                          LocaleKeys.ai_api_key_setting_not_selected.tr(),
                        ),
                        tiles: [
                          SettingsTile.navigation(
                            leading: const Icon(Icons.psychology),
                            title: Text(
                              LocaleKeys.ai_api_key_setting_model.tr(),
                            ),
                            value: Text(
                              state.selectedModel ??
                                  LocaleKeys.ai_api_key_setting_not_selected
                                      .tr(),
                            ),
                            onPressed: (context) {
                              _showModelSelectionDialog(context, state);
                            },
                          ),
                        ],
                      ),
                    SettingsSection(
                      title: Text(LocaleKeys.ai_api_key_setting_guide.tr()),
                      tiles: [
                        if (state.selectedProvider == AIProvider.gemini)
                          SettingsTile.navigation(
                            leading: const Icon(Icons.help_outline),
                            title: Text(
                              LocaleKeys.ai_api_key_setting_how_to_get_api_key
                                  .tr(),
                            ),
                            description: Text(
                              LocaleKeys.ai_api_key_setting_visit_ai_studio_site
                                  .tr(),
                            ),
                            onPressed: (context) {
                              launchUrl(
                                Uri.parse(
                                  'https://aistudio.google.com/app/apikey',
                                ),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _showModelSelectionDialog(BuildContext context, AISettingsState state) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(LocaleKeys.ai_api_key_setting_select_model.tr()),
          children: state.availableModels.map((model) {
            return SimpleDialogOption(
              onPressed: () {
                context.aiSettingsCubit.selectModel(model);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model),
                  if (model == state.selectedModel)
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
