import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingGeminiApiScreen extends StatefulWidget {
  const SettingGeminiApiScreen({super.key});

  @override
  State<SettingGeminiApiScreen> createState() => _SettingGeminiApiScreenState();
}

class _SettingGeminiApiScreenState extends State<SettingGeminiApiScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = true;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _loadApiKey();
  }

  Future<void> _loadApiKey() async {
    final appConfig = GetIt.I<AppConfig>();
    final key = await appConfig.getGeminiApiKey();
    if (mounted) {
      if (key != null) {
        _controller.text = key;
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveApiKey() async {
    final appConfig = GetIt.I<AppConfig>();
    await appConfig.saveGeminiApiKey(_controller.text.trim());
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã lưu API Key thành công!')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cấu hình Gemini API')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SettingsList(
              sections: [
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
                            const Text(
                              'Nhập Gemini API Key của bạn để sử dụng tính năng dịch AI.',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _controller,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Gemini API Key',
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
                                onPressed: _saveApiKey,
                                icon: const Icon(Icons.save),
                                label: const Text('Lưu cấu hình'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text('Hướng dẫn'),
                  tiles: [
                    SettingsTile.navigation(
                      leading: const Icon(Icons.help_outline),
                      title: const Text('Cách lấy API Key'),
                      description: const Text(
                        'Truy cập aistudio.google.com để tạo key miễn phí.',
                      ),
                      onPressed: (context) {
                        // TODO: Open URL launcher
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
