# blueprint-for-horizon-with-vmc-on-aws

# Overview

Explanation can be found here: https://securefever.com/blog/terraform-blueprint-for-a-horizon7-ruleset-with-vmc-on-aws

# Try it out
Greenfield!
 1. install Terraform
 2. clone repository
 3. go to Gateway-Main folder
 4. create a terraform.tfvars file for your secrets
 5. initialize Terraform
 6. terraform import cgw and mgw
 7. plan and/or apply
 8. go to folder DFW-Main
 9. copy terraform.tfvars
10. terraform plan and apply
11. fill all groups

Brownfield!
 1. install Terraform
 2. clone repository
 3. go to folder DFW-Main
 4. create a terraform.tfvars file for your secrets
 5. initialize Terraform
 6. plan and/or apply
 7. fill all groups

# Prerequisites

1. Terraform
2. NSX-T
3. Horizon

# Build & Run

1. install Terraform
2. clone repository
3. create a terraform.tfvars file for your secrets
4. initialize Terraform
5. plan and/or apply
6. make changes

# Documentation

First of all, all my test ran at a lab platform… Use following code at your own risk, I won't be responsible for any issues you may run into. Thanks!

In this repository I created a automated Horizon Whitelist Firewall Ruleset, which can be used with
Terraform and VMC on AWS.

It only apply Horizon related Services, groups and Distributed Firewall Sections and Rules.

This code should support you to build a whitelist Firewall Horizon Plattform or get a idea how you can secure your Horizon Environment.

To get familiar with VMC and VMC NSX-T I highly recommend to take a look on the Blog posts from Nicolas Vibert:
https://nicovibert.com

I will keep on working on this script and add new services, rules and groups.

# Support

if you have any problems with the script, you always can reach out to me and I will try to support and help you as soon as possible!

# Contributing
The blueprint-for-horizon-with-vmc-on-aws project team welcomes contributions from the community. Before you start working with blueprint-for-horizon-with-vmc-on-aws, please read our Developer Certificate of Origin. All contributions to this repository must be signed as described on that page. Your signature certifies that you wrote the patch or have the right to pass it on as an open-source patch. For more detailed information, refer to CONTRIBUTING.md.

# License

Blueprint for Horizon with VMC on AWS
The BSD-2 license (the "License") set forth below applies to all parts of the Blueprint for Horizon with VMC on AWS project. You may not use this file except in compliance with the License.

BSD-2 License

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
