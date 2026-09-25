import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';

import 'package:credify/export_barrel.dart';

class VerifyMethod extends StatefulWidget {
  const VerifyMethod({super.key});

  @override
  State<VerifyMethod> createState() => _VerifyMethodState();
}

class _VerifyMethodState extends State<VerifyMethod> {
  String imgPath = '';
  String photoPath = '';
  String selectedDocType = 'Passport';
  bool submitting = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhotoWithCamera(bool isDoc) async {
    final response = await Navigator.pushNamed(context, Routes.camera);
    if (response is XFile) {
      setState(() {
        if (isDoc) {
          imgPath = response.path;
        } else {
          photoPath = response.path;
        }
      });
    }
  }

  Future<void> _uploadFromGallery(bool isDoc) async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 92,
      );
      if (file != null) {
        setState(() {
          if (isDoc) {
            imgPath = file.path;
          } else {
            photoPath = file.path;
          }
        });
      }
    } catch (e) {
      debugPrint('Error picking from gallery: $e');
    }
  }

  Future<void> _uploadDocumentFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          imgPath = result.files.single.path!;
        });
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
  }

  void _showSourcePickerSheet({
    required BuildContext context,
    required String title,
    required bool isDoc,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: CredTextStyle.h3),
              const SizedBox(height: 6),
              Text(
                'Choose whether to capture a new photo with your camera or upload from your device.',
                style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
              ),
              const SizedBox(height: 20),

              // Option 1: Take Photo
              _pickerTile(
                icon: Icons.camera_alt_outlined,
                title: 'Take Photo',
                subtitle: 'Use your camera to snap a clear photo',
                onTap: () {
                  Navigator.pop(ctx);
                  _takePhotoWithCamera(isDoc);
                },
              ),

              const Divider(height: 1),

              // Option 2: Upload from Gallery
              _pickerTile(
                icon: Icons.photo_library_outlined,
                title: 'Upload from Gallery',
                subtitle: 'Choose an existing photo from library',
                onTap: () {
                  Navigator.pop(ctx);
                  _uploadFromGallery(isDoc);
                },
              ),

              if (isDoc) ...[
                const Divider(height: 1),
                // Option 3: Upload File / PDF
                _pickerTile(
                  icon: Icons.file_present_outlined,
                  title: 'Upload Document / PDF',
                  subtitle: 'Select PDF or scanned image document',
                  onTap: () {
                    Navigator.pop(ctx);
                    _uploadDocumentFile();
                  },
                ),
              ],

              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _pickerTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: CredTextStyle.h5.copyWith(fontSize: 15),
      ),
      subtitle: Text(
        subtitle,
        style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.grey),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Identity Verification',
          style: CredTextStyle.h3,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Text(
                'Verify your identity by taking a live photo or uploading your official ID document.',
                textAlign: TextAlign.center,
                style: CredTextStyle.bs3.copyWith(
                  color: AppColors.grey,
                  height: 1.4,
                ),
              ).animate().fadeIn(duration: 350.ms),

              const SizedBox(height: 24),

              // Government ID Card (Take photo or upload)
              _buildVerificationCard(
                context,
                icon: Icons.badge_outlined,
                title: 'Government-Issued ID',
                subtitle: 'Photo page of your $selectedDocType.',
                path: imgPath,
                isDoc: true,
                badgeText: selectedDocType,
                onChangeDocType: () => _showIDTypeSheet(context),
                onTakePhoto: () => _takePhotoWithCamera(true),
                onUpload: () => _uploadFromGallery(true),
              ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 18),

              // Live Selfie Card (Take photo or upload)
              _buildVerificationCard(
                context,
                icon: Icons.face_rounded,
                title: 'Live Selfie Photo',
                subtitle: 'Face forward with good lighting and no glare.',
                path: photoPath,
                isDoc: false,
                onTakePhoto: () => _takePhotoWithCamera(false),
                onUpload: () => _uploadFromGallery(false),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 32),

              // Submit Action Button
              imgPath.isEmpty && photoPath.isEmpty
                  ? const DisabledButton(label: 'Submit for Verification')
                  : submitting
                      ? const DisabledButton(label: 'Submitting...')
                      : AppButton(
                          onPressed: () {
                            setState(() => submitting = true);
                            AppDialog.showCongratDialog(
                              context,
                              subtitle:
                                  'Thanks! We will review your documents within 10 minutes.',
                              content: Text(
                                'Get ready to experience seamless modern finance with Credify.',
                                textAlign: TextAlign.center,
                                style: CredTextStyle.bs3.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.dashboard,
                                );
                              },
                            );
                          },
                          label: 'Submit for Verification',
                        ).animate().fadeIn().scaleXY(begin: 0.98, end: 1.0),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String path,
    required bool isDoc,
    String? badgeText,
    VoidCallback? onChangeDocType,
    required VoidCallback onTakePhoto,
    required VoidCallback onUpload,
  }) {
    final bool isAttached = path.isNotEmpty;
    final bool isPdf = path.toLowerCase().endsWith('.pdf');

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isAttached
              ? AppColors.complete.withOpacity(0.4)
              : AppColors.primary.withOpacity(0.12),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: isAttached
                      ? AppColors.complete.withOpacity(0.1)
                      : AppColors.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isAttached ? Icons.check_circle_rounded : icon,
                  color: isAttached ? AppColors.complete : AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: CredTextStyle.h4),
                        if (badgeText != null) ...[
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: onChangeDocType,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    badgeText,
                                    style: CredTextStyle.bs4.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    size: 14,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: CredTextStyle.bs4.copyWith(
                        color: AppColors.grey,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Attached State vs Action Buttons
          if (isAttached) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.complete.withOpacity(0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.complete.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: isPdf
                        ? Container(
                            width: 44,
                            height: 44,
                            color: AppColors.error.withOpacity(0.1),
                            child: const Icon(
                              Icons.picture_as_pdf_rounded,
                              color: AppColors.error,
                              size: 24,
                            ),
                          )
                        : Image.file(
                            File(path),
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 44,
                              height: 44,
                              color: AppColors.complete.withOpacity(0.1),
                              child: const Icon(
                                Icons.image_rounded,
                                color: AppColors.complete,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.verified_rounded,
                              size: 14,
                              color: AppColors.complete,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Document Attached',
                              style: CredTextStyle.h5.copyWith(
                                color: AppColors.complete,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          path.split('/').last,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CredTextStyle.bs4.copyWith(
                            color: AppColors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isPdf)
                    IconButton(
                      tooltip: 'Check Quality',
                      icon: const Icon(
                        Icons.visibility_outlined,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckQuality(path: XFile(path)),
                          ),
                        );
                      },
                    ),
                  IconButton(
                    tooltip: 'Change / Replace',
                    icon: const Icon(
                      Icons.refresh_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      _showSourcePickerSheet(
                        context: context,
                        title: 'Replace $title',
                        isDoc: isDoc,
                      );
                    },
                  ),
                ],
              ),
            ),
          ] else ...[
            // Dual Action Buttons: Take Photo OR Upload
            Row(
              children: [
                // Take Photo Button
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: onTakePhoto,
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      label: Text(
                        'Take Photo',
                        style: CredTextStyle.bs4.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Upload Photo Button
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: onUpload,
                      icon: const Icon(
                        Icons.upload_file_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Upload Photo',
                        style: CredTextStyle.bs4.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showIDTypeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Document Type', style: CredTextStyle.h3),
            const SizedBox(height: 6),
            Text(
              'Choose an official government ID for authentication.',
              style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 20),
            _idTypeTile(context, 'Passport', recommend: true),
            const Divider(height: 1),
            _idTypeTile(context, 'Driver\'s License'),
            const Divider(height: 1),
            _idTypeTile(context, 'National Identity Card'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _idTypeTile(BuildContext context, String type, {bool recommend = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.credit_card_rounded,
          color: AppColors.primary,
          size: 20,
        ),
      ),
      title: Row(
        children: [
          Text(type, style: CredTextStyle.bs2.copyWith(fontWeight: FontWeight.w500)),
          if (recommend) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.complete.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Recommended',
                style: CredTextStyle.bs4.copyWith(
                  color: AppColors.complete,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
      trailing: selectedDocType == type
          ? const Icon(Icons.check_circle_rounded, color: AppColors.complete)
          : const Icon(Icons.chevron_right_rounded, color: AppColors.grey),
      onTap: () {
        setState(() {
          selectedDocType = type;
        });
        Navigator.pop(context);
        _showSourcePickerSheet(
          context: context,
          title: 'Provide $type',
          isDoc: true,
        );
      },
    );
  }
}
