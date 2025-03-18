import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: March 15, 2025',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Qintar Team ("we", "our", or "us") is committed to protecting your privacy. This Privacy Policy explains how your personal information is collected, used, and disclosed by Qintar.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSection(
              '1. Information We Collect',
              'We collect information that you provide directly to us, such as when you create an account, update your profile, use interactive features, participate in contests, promotions, or surveys, request customer support or otherwise communicate with us. The types of information we may collect include:\n\n'
                  '• Account Information: When you create an account, we collect your name, email address, username, password, and profile information.\n'
                  '• User Content: Information you provide through our Service, including your chat messages, preferences, and feedback.\n'
                  '• Transaction Information: If you make a purchase, we collect information about the transaction, such as product details, purchase price, and date of purchase.\n'
                  '• Device Information: We collect information about the device you use to access our Service, including hardware model, operating system, unique device identifiers, and mobile network information.',
            ),
            _buildSection(
              '2. How We Use Your Information',
              'We use the information we collect to:\n\n'
                  '• Provide, maintain, and improve our Service\n'
                  '• Process transactions and send related information\n'
                  '• Send you technical notices, updates, security alerts, and support messages\n'
                  '• Respond to your comments, questions, and requests\n'
                  '• Develop new products and services\n'
                  '• Monitor and analyze trends, usage, and activities in connection with our Service\n'
                  '• Detect, investigate, and prevent fraudulent transactions and other illegal activities\n'
                  '• Personalize and improve the Service and provide content or features that match user profiles or interests',
            ),
            _buildSection(
              '3. Sharing of Information',
              'We may share information about you as follows:\n\n'
                  '• With vendors, consultants, and other service providers who need access to such information to carry out work on our behalf\n'
                  '• In response to a request for information if we believe disclosure is in accordance with any applicable law, regulation, or legal process\n'
                  '• If we believe your actions are inconsistent with our user agreements or policies, or to protect the rights, property, and safety of us or others\n'
                  '• In connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business by another company\n'
                  '• With your consent or at your direction',
            ),
            _buildSection(
              '4. Data Security',
              'We take reasonable measures to help protect information about you from loss, theft, misuse and unauthorized access, disclosure, alteration, and destruction.',
            ),
            _buildSection(
              '5. Your Choices',
              'Account Information: You may update, correct, or delete your account information at any time by logging into your account. If you wish to delete your account, please contact us at privacy@qintar.com.\n\n'
                  'Cookies: Most web browsers are set to accept cookies by default. If you prefer, you can usually choose to set your browser to remove or reject browser cookies.\n\n'
                  'Promotional Communications: You may opt out of receiving promotional emails from us by following the instructions in those emails. If you opt out, we may still send you non-promotional emails, such as those about your account or our ongoing business relations.',
            ),
            _buildSection(
              '6. Children\'s Privacy',
              'Our Service is not directed to children under 13, and we do not knowingly collect personal information from children under 13. If we learn we have collected personal information of a child under 13, we will delete such information.',
            ),
            _buildSection(
              '7. International Data Transfers',
              'We may transfer information that we collect about you to affiliated entities, or to other third parties across borders and from your country or jurisdiction to other countries or jurisdictions around the world.',
            ),
            _buildSection(
              '8. Changes to this Privacy Policy',
              'We may change this Privacy Policy from time to time. If we make changes, we will notify you by revising the date at the top of the policy and, in some cases, we may provide you with additional notice (such as adding a statement to our website or sending you a notification).',
            ),
            _buildSection(
              '9. Contact Us',
              'If you have any questions about this Privacy Policy, please contact us at privacy@qintar.com.',
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                '© 2025 Qintar. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
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
