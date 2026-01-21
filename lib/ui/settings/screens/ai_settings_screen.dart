import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/domain/models/ai_provider.dart';
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
          ).showSnackBar(SnackBar(content: Text('Lỗi: ${state.error}')));
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
          appBar: AppBar(title: const Text('Cấu hình AI')),
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
                      title: const Text('Provider'),
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
                      title: const Text('API Key'),
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
                                    labelText: 'API Key',
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
                                        const SnackBar(
                                          content: Text(
                                            'Đang lưu và tải danh sách model...',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.save),
                                    label: const Text('Lưu & Tải Models'),
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
                        title: const Text('Chọn Model'),
                        tiles: [
                          SettingsTile.navigation(
                            leading: const Icon(Icons.psychology),
                            title: const Text('Mô hình'),
                            value: Text(state.selectedModel ?? 'Chưa chọn'),
                            onPressed: (context) {
                              _showModelSelectionDialog(context, state);
                            },
                          ),
                        ],
                      ),
                    SettingsSection(
                      title: const Text('Hướng dẫn'),
                      tiles: [
                        if (state.selectedProvider == AIProvider.gemini)
                          SettingsTile.navigation(
                            leading: const Icon(Icons.help_outline),
                            title: const Text('Cách lấy API Key'),
                            description: const Text(
                              'Truy cập aistudio.google.com để tạo key miễn phí.',
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
          title: const Text('Chọn Model'),
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
