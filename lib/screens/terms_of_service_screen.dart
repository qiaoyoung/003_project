import 'package:flutter/material.dart';
import '../colors.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Last Updated: May 15, 2025',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the Zyphra mobile application (the "Service") operated by Zyphra Team ("us", "we", or "our").',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSection(
              '1. Acceptance of Terms',
              'By accessing or using the Service, you agree to be bound by these Terms. If you disagree with any part of the terms, then you may not access the Service.',
            ),
            _buildSection(
              '2. Changes to Terms',
              'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
            ),
            _buildSection(
              '3. User Accounts',
              'When you create an account with us, you must provide information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.',
            ),
            _buildSection(
              '4. Intellectual Property',
              'The Service and its original content, features, and functionality are and will remain the exclusive property of Zyphra Team and its licensors. The Service is protected by copyright, trademark, and other laws of both the United States and foreign countries. Our trademarks and trade dress may not be used in connection with any product or service without the prior written consent of Zyphra Team.',
            ),
            _buildSection(
              '5. User Content',
              'Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material. You are responsible for the content you post to the Service, including its legality, reliability, and appropriateness.',
            ),
            _buildSection(
              '6. Prohibited Uses',
              'You may use the Service only for lawful purposes and in accordance with the Terms. You agree not to use the Service:\n\n'
                  '• In any way that violates any applicable national or international law or regulation.\n'
                  '• For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way.\n'
                  '• To transmit, or procure the sending of, any advertising or promotional material, including any "junk mail", "chain letter," "spam," or any other similar solicitation.\n'
                  '• To impersonate or attempt to impersonate the Company, a Company employee, another user, or any other person or entity.',
            ),
            _buildSection(
              '7. Termination',
              'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the Service will immediately cease.',
            ),
            _buildSection(
              '8. Limitation of Liability',
              'In no event shall Zyphra Team, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from (i) your access to or use of or inability to access or use the Service; (ii) any conduct or content of any third party on the Service; (iii) any content obtained from the Service; and (iv) unauthorized access, use or alteration of your transmissions or content, whether based on warranty, contract, tort (including negligence) or any other legal theory, whether or not we have been informed of the possibility of such damage.',
            ),
            _buildSection(
              '9. Governing Law',
              'These Terms shall be governed and construed in accordance with the laws of the United States, without regard to its conflict of law provisions. Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights.',
            ),
            _buildSection(
              '10. Contact Us',
              'If you have any questions about these Terms, please contact us at support@zyphra.com.',
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                '© 2025 Zyphra. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
