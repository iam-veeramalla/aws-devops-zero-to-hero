# AWS EKS 

## Introduction

## Table of Contents:

1. [Understanding Kubernetes Fundamentals](#understanding-kubernetes-fundamentals)
   - 1.1 [EKS vs. Self-Managed Kubernetes: Pros and Cons](#eks-vs-self-managed-kubernetes-pros-and-cons)

2. [Setting up your AWS Environment for EKS](#setting-up-your-aws-environment-for-eks)
   - 2.1 [Creating an AWS Account and Setting up IAM Users](#creating-an-aws-account-and-setting-up-iam-users)
   - 2.2 [Configuring the AWS CLI and kubectl](#configuring-the-aws-cli-and-kubectl)
   - 2.3 [Preparing Networking and Security Groups for EKS](#preparing-networking-and-security-groups-for-eks)

3. [Launching your First EKS Cluster](#launching-your-first-eks-cluster)
   - 3.1 [Using the EKS Console for Cluster Creation](#using-the-eks-console-for-cluster-creation)
   - 3.2 [Launching an EKS Cluster via AWS CLI](#launching-an-eks-cluster-via-aws-cli)
   - 3.3 [Authenticating with the EKS Cluster](#authenticating-with-the-eks-cluster)

4. [Deploying Applications on EKS](#deploying-applications-on-eks)
   - 4.1 [Containerizing Applications with Docker](#containerizing-applications-with-docker)
   - 4.2 [Writing Kubernetes Deployment YAMLs](#writing-kubernetes-deployment-yamls)
   - 4.3 [Deploying Applications to EKS: Step-by-step Guide](#deploying-applications-to-eks-step-by-step-guide)

## Understanding Kubernetes Fundamentals

### 1.1 EKS vs. Self-Managed Kubernetes: Pros and Cons

1.1.1 EKS (Amazon Elastic Kubernetes Service)
Pros:

    Managed Control Plane: EKS takes care of managing the Kubernetes control plane components, such as the API server, controller manager, and etcd. AWS handles upgrades, patches, and ensures high availability of the control plane.

    Automated Updates: EKS automatically updates the Kubernetes version, eliminating the need for manual intervention and ensuring that the cluster stays up-to-date with the latest features and security patches.

    Scalability: EKS can automatically scale the Kubernetes control plane based on demand, ensuring the cluster remains responsive as the workload increases.

    AWS Integration: EKS seamlessly integrates with various AWS services, such as AWS IAM for authentication and authorization, Amazon VPC for networking, and AWS Load Balancers for service exposure.

    Security and Compliance: EKS is designed to meet various security standards and compliance requirements, providing a secure and compliant environment for running containerized workloads.

    Monitoring and Logging: EKS integrates with AWS CloudWatch for monitoring cluster health and performance metrics, making it easier to track and troubleshoot issues.

    Ecosystem and Community: Being a managed service, EKS benefits from continuous improvement, support, and contributions from the broader Kubernetes community.

Cons:

    Cost: EKS is a managed service, and this convenience comes at a cost. Running an EKS cluster may be more expensive compared to self-managed Kubernetes, especially for large-scale deployments.

    Less Control: While EKS provides a great deal of automation, it also means that you have less control over the underlying infrastructure and some Kubernetes configurations.

1.1.2 Self-Managed Kubernetes on EC2 Instances
Pros:

    Cost-Effective: Self-managed Kubernetes allows you to take advantage of EC2 spot instances and reserved instances, potentially reducing the overall cost of running Kubernetes clusters.

    Flexibility: With self-managed Kubernetes, you have full control over the cluster's configuration and infrastructure, enabling customization and optimization for specific use cases.

    EKS-Compatible: Self-managed Kubernetes on AWS can still leverage various AWS services and features, enabling integration with existing AWS resources.

    Experimental Features: Self-managed Kubernetes allows you to experiment with the latest Kubernetes features and versions before they are officially supported by EKS.

Cons:

    Complexity: Setting up and managing a self-managed Kubernetes cluster can be complex and time-consuming, especially for those new to Kubernetes or AWS.

    Maintenance Overhead: Self-managed clusters require manual management of Kubernetes control plane updates, patches, and high availability.

    Scaling Challenges: Scaling the control plane of a self-managed cluster can be challenging, and it requires careful planning to ensure high availability during scaling events.

    Security and Compliance: Self-managed clusters may require additional effort to implement best practices for security and compliance compared to EKS, which comes with some built-in security features.

    Lack of Automation: Self-managed Kubernetes requires more manual intervention and scripting for certain operations, which can increase the risk of human error.

## Setting up your AWS Environment for EKS

Sure! Let's go into detail for each subsection:

## 2.1 Creating an AWS Account and Setting up IAM Users

Creating an AWS account is the first step to access and utilize AWS services, including Amazon Elastic Kubernetes Service (EKS). Here's a step-by-step guide to creating an AWS account and setting up IAM users:

1. **Create an AWS Account**:
   - Go to the AWS website (https://aws.amazon.com/) and click on the "Create an AWS Account" button.
   - Follow the on-screen instructions to provide your email address, password, and required account details.
   - Enter your payment information to verify your identity and set up billing.

2. **Access AWS Management Console**:
   - After creating the account, you will receive a verification email. Follow the link in the email to verify your account.
   - Log in to the AWS Management Console using your email address and password.

3. **Set up Multi-Factor Authentication (MFA)** (Optional but recommended):
   - Once you are logged in, set up MFA to add an extra layer of security to your AWS account. You can use MFA with a virtual MFA device or a hardware MFA device.

4. **Create IAM Users**:
   - Go to the IAM (Identity and Access Management) service in the AWS Management Console.
   - Click on "Users" in the left-hand navigation pane and then click on "Add user."
   - Enter a username for the new IAM user and select the access type (Programmatic access, AWS Management Console access, or both).
   - Choose the permissions for the IAM user by adding them to one or more IAM groups or attaching policies directly.
   - Optionally, set permissions boundary, tags, and enable MFA for the IAM user.

5. **Access Keys (for Programmatic Access)**:
   - If you selected "Programmatic access" during user creation, you will receive access keys (Access Key ID and Secret Access Key).
   - Store these access keys securely, as they will be used to authenticate API requests made to AWS services.

## 2.2 Configuring the AWS CLI and kubectl

With IAM users set up, you can now configure the AWS CLI and kubectl on your local machine to interact with AWS services and EKS clusters:

1. **Installing the AWS CLI**:
   - Download and install the AWS CLI on your local machine. You can find installation instructions for various operating systems [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

2. **Configuring AWS CLI Credentials**:
   - Open a terminal or command prompt and run the following command:
     ```
     aws configure
     ```
   - Enter the access key ID and secret access key of the IAM user you created earlier.
   - Choose a default region and output format for AWS CLI commands.

3. **Installing kubectl**:
   - Install kubectl on your local machine. Instructions can be found [here](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

4. **Configuring kubectl for EKS**:
   - Once kubectl is installed, you need to configure it to work with your EKS cluster.
   - In the AWS Management Console, go to the EKS service and select your cluster.
   - Click on the "Config" button and follow the instructions to update your kubeconfig file. Alternatively, you can use the AWS CLI to update the kubeconfig file:
     ```
     aws eks update-kubeconfig --name your-cluster-name
     ```
   - Verify the configuration by running a kubectl command against your EKS cluster:
     ```
     kubectl get nodes
     ```

## 2.3 Preparing Networking and Security Groups for EKS

Before launching an EKS cluster, you need to prepare the networking and security groups to ensure proper communication and security within the cluster:

1. **Creating an Amazon VPC (Virtual Private Cloud)**:
   - Go to the AWS Management Console and navigate to the VPC service.
   - Click on "Create VPC" and enter the necessary details like VPC name, IPv4 CIDR block, and subnets.
   - Create public and private subnets to distribute resources in different availability zones.

Sure! Let's go into detail for each of the points:

2. **Configuring Security Groups**

**Security Groups** are a fundamental aspect of Amazon Web Services (AWS) that act as virtual firewalls for your AWS resources, including Amazon Elastic Kubernetes Service (EKS) clusters. Security Groups control inbound and outbound traffic to and from these resources based on rules you define. Here's a step-by-step guide on configuring Security Groups for your EKS cluster:

1. **Create a Security Group**:
   - Go to the AWS Management Console and navigate to the Amazon VPC service.
   - Click on "Security Groups" in the left-hand navigation pane.
   - Click on "Create Security Group."
   - Provide a name and description for the Security Group.
   - Select the appropriate VPC for the Security Group.

2. **Inbound Rules**:
   - Define inbound rules to control incoming traffic to your EKS worker nodes.
   - By default, all inbound traffic is denied unless you explicitly allow it.
   - Common inbound rules include allowing SSH (port 22) access for administrative purposes and allowing ingress traffic from specific CIDR blocks or Security Groups.

3. **Outbound Rules**:
   - Define outbound rules to control the traffic leaving your EKS worker nodes.
   - By default, all outbound traffic is allowed unless you explicitly deny it.
   - For security purposes, you can restrict outbound traffic to specific destinations or ports.

4. **Security Group IDs**:
   - After creating the Security Group, you'll receive a Security Group ID. This ID will be used when launching your EKS worker nodes.

5. **Attach Security Group to EKS Worker Nodes**:
   - When launching the EKS worker nodes, specify the Security Group ID in the launch configuration. This associates the Security Group with the worker nodes, allowing them to communicate based on the defined rules.

Configuring Security Groups ensures that only the necessary traffic is allowed to and from your EKS worker nodes, enhancing the security of your EKS cluster.

3. **Setting Up Internet Gateway (IGW)**

An **Internet Gateway (IGW)** is a horizontally scaled, redundant, and highly available AWS resource that allows communication between your VPC and the internet. To enable EKS worker nodes to access the internet for tasks like pulling container images, you need to set up an Internet Gateway in your VPC. Here's how to do it:

1. **Create an Internet Gateway**:
   - Go to the AWS Management Console and navigate to the Amazon VPC service.
   - Click on "Internet Gateways" in the left-hand navigation pane.
   - Click on "Create Internet Gateway."
   - Provide a name for the Internet Gateway and click "Create Internet Gateway."

2. **Attach Internet Gateway to VPC**:
   - After creating the Internet Gateway, select the Internet Gateway in the list and click on "Attach to VPC."
   - Choose the VPC to which you want to attach the Internet Gateway and click "Attach."

3. **Update Route Tables**:
   - Go to "Route Tables" in the Amazon VPC service.
   - Identify the Route Table associated with the private subnets where your EKS worker nodes will be deployed.
   - Edit the Route Table and add a route with the destination `0.0.0.0/0` (all traffic) and the Internet Gateway ID as the target.

By setting up an Internet Gateway and updating the Route Tables, you provide internet access to your EKS worker nodes, enabling them to interact with external resources like container registries and external services.

4. **Configuring IAM Policies**

**Identity and Access Management (IAM)** is a service in AWS that allows you to manage access to AWS resources securely. IAM policies define permissions that specify what actions are allowed or denied on specific AWS resources. For your EKS cluster, you'll need to configure IAM policies to grant necessary permissions to your worker nodes and other resources. Here's how to do it:

1. **Create a Custom IAM Policy**:
   - Go to the AWS Management Console and navigate to the IAM service.
   - Click on "Policies" in the left-hand navigation pane.
   - Click on "Create policy."
   - Choose "JSON" as the policy language and define the permissions required for your EKS cluster. For example, you might need permissions for EC2 instances, Auto Scaling, Elastic Load Balancing, and accessing ECR (Elastic Container Registry).

2. **Attach the IAM Policy to IAM Roles**:
   - Go to "Roles" in the IAM service and select the IAM role that your EKS worker nodes will assume.
   - Click on "Attach policies" and search for the custom IAM policy you created in the previous step.
   - Attach the policy to the IAM role.

3. **Update EKS Worker Node Launch Configuration**:
   - When launching your EKS worker nodes, specify the IAM role ARN (Amazon Resource Name) of the IAM role that includes the necessary IAM policy.
   - The IAM role allows the worker nodes to authenticate with the EKS cluster and access AWS resources based on the permissions defined in the attached IAM policy.

By configuring IAM policies and associating them with IAM roles, you grant specific permissions to your EKS worker nodes, ensuring they can interact with AWS resources as needed while maintaining security and access control.

By completing these steps, your AWS environment is ready to host an Amazon EKS cluster. You can proceed with creating an EKS cluster using the AWS Management Console or AWS CLI as described in section 3.

