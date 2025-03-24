import 'package:flutter/material.dart';

class EndUserAgreementScreen extends StatelessWidget {
  const EndUserAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End User Agreement'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'APPLE INC.\nAPPLE STANDARD EULA',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'PLEASE READ THIS SOFTWARE LICENSE AGREEMENT ("LICENSE") CAREFULLY BEFORE USING THE LICENSED APPLICATION. BY USING THE LICENSED APPLICATION, YOU ARE AGREEING TO BE BOUND BY THE TERMS OF THIS LICENSE.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '1. ACKNOWLEDGEMENT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The terms of this standard Apple license agreement ("Standard EULA") apply to Application licensed through the App Store unless the Application is covered by a valid custom license agreement between you and the Application Provider.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '2. SCOPE OF LICENSE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The license granted to You for the Licensed Application by the Application Provider is limited to a non-transferable license to use the Licensed Application on any Apple-branded products that You own or control and as permitted by the Usage Rules set forth in the App Store Terms of Service.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '3. MAINTENANCE AND SUPPORT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The Application Provider is solely responsible for providing any maintenance and support services with respect to the Licensed Application, as specified in the EULA, as required under applicable law, or to the extent required by the App Store Terms of Service.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '4. WARRANTY',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The Application Provider is solely responsible for the Licensed Application and any content therein as set forth in the EULA. Your use of the Licensed Application is at your own risk.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '5. PRODUCT CLAIMS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The Application Provider is responsible for addressing any claims relating to the Licensed Application or your possession and/or use of the Licensed Application, including, but not limited to product liability claims or any claim that the Licensed Application fails to conform to any applicable legal or regulatory requirement.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 24),
              Text(
                '6. INTELLECTUAL PROPERTY RIGHTS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The Application Provider reserves all rights in and to the Licensed Application not expressly granted to You under this EULA.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 24),
              Text(
                '7. GRIVORA APP-SPECIFIC TERMS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The Grivora app is for entertainment purposes only. It does not provide financial, medical, or legal services. Any AI-generated content is not a substitute for professional advice.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'No financial transactions or payment services are offered through this application. The app does not request, store, or process any payment information.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Text(
                '© 2025 Grivora. All rights reserved.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
