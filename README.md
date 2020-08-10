# blueprint-for-horizon-with-vmc-on-aws

# Overview

Explanation can be found here: https://securefever.com/blog/terraform-blueprint-for-a-horizon7-ruleset-with-vmc-on-aws

# Try it out

1. install Terraform
2. clone repository
3. create a terraform.tfvars file for your secrets
4. initialize Terraform
5. plan and/or apply

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
