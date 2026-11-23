# Automated AWS VPC Provisioning with Terraform and Remote State Management

## Project Overview

This project demonstrates the use of **Terraform Infrastructure as Code (IaC)** to provision and manage a custom Virtual Private Cloud (VPC) in Amazon Web Services (AWS).

It also implements remote Terraform state management using **Amazon S3**, with bucket versioning enabled, and **Amazon DynamoDB** for state locking.

The objective was to build a repeatable and manageable cloud networking foundation while applying infrastructure management practices used in real-world Cloud and DevOps environments.

Rather than relying entirely on manual configuration through the AWS Management Console, this project uses Terraform to define infrastructure as code and introduces remote state management to support safer infrastructure collaboration and change management.

## Project Objectives

- Provision a custom AWS VPC using Terraform.
- Configure a public subnet for network connectivity.
- Attach an Internet Gateway to the VPC.
- Configure route tables to support public network routing.
- Configure an Amazon S3 bucket as the remote Terraform state backend.
- Enable S3 bucket versioning to maintain previous state versions.
- Implement state locking using Amazon DynamoDB.
- Apply Infrastructure as Code principles to cloud infrastructure provisioning.

## Architecture and AWS Resources

The project uses the following AWS services and infrastructure components:

| Component | Purpose |
|---|---|
| Amazon VPC | Provides an isolated virtual network environment |
| Public Subnet | Provides a subnet for resources requiring public network connectivity |
| Internet Gateway | Enables communication between the VPC and the internet |
| Route Table | Defines network traffic routing |
| Amazon S3 | Stores Terraform state remotely |
| S3 Versioning | Preserves previous versions of the Terraform state file |
| Amazon DynamoDB | Supports Terraform state locking |

## Technologies Used

- **Amazon Web Services (AWS):** VPC, Subnets, Internet Gateway, Route Tables, S3 and DynamoDB
- **Terraform:** Infrastructure as Code
- **Cloud Networking:** VPC networking, subnet configuration and routing
- **Remote State Management:** S3 backend and DynamoDB state locking

## Implementation

### 1. Remote State Infrastructure

Created an Amazon S3 bucket to serve as the remote backend for Terraform state management.

S3 bucket versioning was enabled to preserve previous versions of the state file and provide a recovery mechanism for earlier state versions.

Amazon DynamoDB was configured to support Terraform state locking, helping prevent concurrent Terraform operations from modifying the same state simultaneously.

### 2. VPC Provisioning

Used Terraform to define the custom AWS VPC and its networking components.

The infrastructure includes:

- A custom Virtual Private Cloud.
- A public subnet.
- An Internet Gateway.
- Route table configuration.

### Terraform Remote Backend Configuration

This project uses an Amazon S3 remote backend to store Terraform state and Amazon DynamoDB to implement state locking.

The following example represents the backend configuration used during the project. Resource identifiers have been replaced with placeholders.

```hcl
terraform {
  backend "s3" {
    bucket         = "YOUR-S3-BUCKET-NAME"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "YOUR-DYNAMODB-TABLE-NAME"
    encrypt        = true
  }
}
```

**Configuration details**

| Argument | Description |
|---|---|
| `bucket` | S3 bucket used for remote Terraform state storage |
| `key` | Object path where the Terraform state file is stored |
| `region` | AWS region containing the backend resources |
| `dynamodb_table` | DynamoDB table used for Terraform state locking |
| `encrypt` | Enables server-side encryption of the remote state object |

**Why remote state management matters**

- Centralises Terraform state instead of relying exclusively on a local state file.
- Supports collaboration by allowing authorised users and automation workflows to access shared state.
- Helps prevent conflicting Terraform operations through state locking.
- Supports recovery of previous state versions when S3 bucket versioning is enabled.

**Note on the locking implementation**

This project demonstrates DynamoDB-based state locking. HashiCorp has since deprecated the `dynamodb_table` backend argument and recommends native Amazon S3 state locking using `use_lockfile = true` for new implementations.

This distinction is important when comparing this project with current Terraform best practices.

For further information, see the [official Terraform S3 backend documentation](https://developer.hashicorp.com/terraform/language/backend/s3).

### 4. Infrastructure Deployment

Applied the Terraform configuration to provision the defined infrastructure in AWS.

The implementation demonstrates how infrastructure resources can be described, managed and provisioned through code.

### 5. Infrastructure Verification

The project includes screenshots documenting the implementation process and the AWS resources created during deployment.

These provide visual evidence of the infrastructure configuration and deployment workflow.

## Key Engineering Concepts Demonstrated

Through this project, I applied and explored several important Cloud and DevOps engineering concepts:

- **Infrastructure as Code:** Defining cloud resources using Terraform instead of relying entirely on manual provisioning.
- **Cloud Networking:** Building a VPC with subnet, Internet Gateway and route table configurations.
- **Remote State Management:** Storing Terraform state remotely using Amazon S3.
- **State Versioning:** Enabling S3 versioning to preserve previous state file versions.
- **State Locking:** Using DynamoDB to support controlled Terraform state operations.
- **Infrastructure Management:** Organising cloud infrastructure around repeatable, code-driven provisioning practices.

## Project Evidence

Screenshots documenting the implementation are included in this repository.

They provide evidence of the AWS resource configuration, Terraform implementation and remote state management setup.

## Skills Demonstrated

`AWS` · `Terraform` · `Infrastructure as Code` · `Amazon VPC` · `Cloud Networking` · `Amazon S3` · `DynamoDB` · `Remote State Management` · `State Locking` · `Cloud Infrastructure Provisioning`

## Conclusion

This project strengthened my practical understanding of AWS networking and Terraform-based infrastructure provisioning.

It also provided hands-on experience with remote state management, S3 versioning and DynamoDB state locking—important concepts for managing cloud infrastructure in collaborative and production-oriented environments.

It represents part of my continued development as an **Aspiring Cloud Infrastructure and DevOps Engineer**, with a focus on automation, infrastructure reliability and modern cloud engineering practices.

## Current Infrastructure Status

**Status: Project preserved in GitHub; AWS infrastructure destroyed.**

The AWS resources created for this project have since been intentionally
deleted to avoid ongoing cloud costs. This includes the VPC infrastructure
and the S3 bucket and DynamoDB table previously used for Terraform remote
state management.

The Terraform configuration is retained as a portfolio and learning
reference. No live AWS infrastructure is currently running for this project.

To deploy the infrastructure again:

1. Create a new S3 bucket for Terraform remote state.
2. Enable versioning on the S3 bucket.
3. Create the required DynamoDB table for state locking, in line with the
   backend configuration.
4. Update the example variables with the new resource names.
5. Run `terraform init` and review the configuration before applying.

**Note:** Recreating the backend resources and deploying the infrastructure
will incur AWS charges. Review AWS pricing before proceeding.

Step 1 — Create S3 Bucket
- Enable versioning
<img width="1339" height="616" alt="Screenshot 2026-04-08 172241" src="https://github.com/user-attachments/assets/72d2cabb-4ef4-4194-8f33-10b4d3502a86" />

Step 2 — Create DynamoDB Table
- Table name: terraform-rermote-table
- Partition key: LockID
<img width="1333" height="616" alt="Screenshot 2026-04-08 172621" src="https://github.com/user-attachments/assets/e3364629-9f57-4411-98bc-3c2f06cdb011" />

 - Initialize Terraform
<img width="841" height="262" alt="Screenshot 2026-04-08 173620" src="https://github.com/user-attachments/assets/9befd672-248c-4aae-a0f9-8afa8332e9d1" />

- Plan
<img width="841" height="239" alt="Screenshot 2026-04-08 173854" src="https://github.com/user-attachments/assets/71ba09b6-6578-49d1-9676-e8362ca5aa89" />

- Apply
<img width="846" height="261" alt="Screenshot 2026-04-08 174047" src="https://github.com/user-attachments/assets/1115bd0c-cd58-4ce0-a999-b32f5d2b27bf" />

🌐 Infrastructure Screenshots

- 🟦 VPC
<img width="1327" height="452" alt="Screenshot 2026-04-08 174218" src="https://github.com/user-attachments/assets/ad1a2d5c-de1a-4d60-b3ea-ccf7cb10106a" />
<img width="1342" height="409" alt="Screenshot 2026-04-08 174424" src="https://github.com/user-attachments/assets/468afdd0-b1b4-4ef3-8977-9a65b29ed479" />

- 🌍 Subnet
<img width="1345" height="614" alt="Screenshot 2026-04-08 174558" src="https://github.com/user-attachments/assets/f8098114-e594-4375-b953-42e89472e9c8" />

- 🌐 Route Table
<img width="1341" height="619" alt="Screenshot 2026-04-08 174754" src="https://github.com/user-attachments/assets/1918b964-67c8-472d-a6dc-49ace0bfc4b1" />

- 🌍 Internet Gateway
<img width="1343" height="618" alt="Screenshot 2026-04-08 174859" src="https://github.com/user-attachments/assets/7353faa6-fe53-4f5d-8a4d-3c73668ee343" />

- 📦 Terraform State in S3
<img width="1342" height="614" alt="Screenshot 2026-04-08 175045" src="https://github.com/user-attachments/assets/48b7002a-66c0-4d05-ab64-5c2f973c7752" />

- 🔒 DynamoDB Lock
<img width="1341" height="617" alt="Screenshot 2026-04-08 175815" src="https://github.com/user-attachments/assets/83f7fc46-d920-4e79-bfe4-241fa016f2a8" />

<img width="1341" height="613" alt="Screenshot 2026-04-08 175642" src="https://github.com/user-attachments/assets/d41005ac-49e9-447c-aeee-ae152f124021" />

