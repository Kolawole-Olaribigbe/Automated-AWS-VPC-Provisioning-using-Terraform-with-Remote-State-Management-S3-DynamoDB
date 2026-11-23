# Automated AWS VPC Provisioning Using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using **Terraform** to provision and manage AWS networking infrastructure.

The project focuses on creating a Virtual Private Cloud (VPC), configuring a public subnet, and establishing internet connectivity through an Internet Gateway and route table.

It also explores Terraform remote state management using Amazon S3 and DynamoDB.

**Project status:** Infrastructure deployed during the learning exercise and subsequently destroyed to avoid ongoing AWS costs.

## Technologies Used

- Amazon Web Services (AWS)
- Terraform
- Amazon VPC
- Amazon EC2 networking
- Amazon S3
- Amazon DynamoDB
- Linux
- AWS CLI

## Infrastructure Architecture

The Terraform configuration defines the following infrastructure:

- **VPC:** A virtual private cloud using the CIDR block `10.0.0.0/16`.
- **Public Subnet:** A subnet using `10.0.1.0/24`.
- **Internet Gateway:** Provides an internet gateway for the VPC.
- **Route Table:** Configures a default route (`0.0.0.0/0`) through the Internet Gateway.
- **Route Table Association:** Associates the public subnet with the route table.
- **Public IP Assignment:** Enables automatic public IPv4 address assignment for instances launched in the public subnet.

## Terraform Project Structure

```text
.
├── backend.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars.example
├── .gitignore
└── README.md
```

## Terraform Configuration

The project uses separate Terraform files to organize infrastructure configuration:

| File | Purpose |
|---|---|
| `main.tf` | Defines AWS networking resources |
| `provider.tf` | Configures the AWS provider |
| `variables.tf` | Declares input variables |
| `outputs.tf` | Defines infrastructure outputs |
| `backend.tf` | Configures remote Terraform state |
| `terraform.tfvars.example` | Provides an example variable configuration |
| `.gitignore` | Excludes sensitive and generated files |

## Remote State Management

The project explores remote Terraform state storage using:

- **Amazon S3:** Stores Terraform state remotely.
- **Amazon DynamoDB:** Used for state locking in the original backend configuration.

Remote state management helps provide centralized state storage and supports collaboration when multiple users work with Terraform infrastructure.

The original backend resources were deleted during project cleanup. The backend configuration is retained as part of the learning project, but remote backend initialization requires recreating the necessary AWS resources.

## Key Learning Outcomes

Through this project, I gained practical experience with:

- Infrastructure as Code using Terraform.
- AWS VPC and subnet configuration.
- Internet Gateway and route table configuration.
- Public subnet networking.
- Terraform variables and outputs.
- AWS provider configuration.
- Remote Terraform state management concepts.
- AWS CLI authentication and profile configuration.
- Infrastructure lifecycle management and cost-conscious resource cleanup.

## Infrastructure Cleanup

All AWS resources associated with this project were deleted after the learning exercise to avoid ongoing cloud infrastructure costs.

Consequently:

- The AWS infrastructure is no longer running.
- The original S3 remote state bucket and DynamoDB table are no longer available.
- Terraform backend initialization requires recreating the backend resources.
- The project configuration and documentation are retained for portfolio demonstration and future reference.

No continuously running AWS infrastructure is required to review this repository.

## Security Considerations

- AWS credentials are not included in the repository.
- Terraform state files are excluded from version control.
- Local `.tfvars` files containing sensitive values are excluded.
- An example variables file is provided without actual credentials or secrets.

## Conclusion

This project provided hands-on experience with Terraform and AWS networking, reinforcing important Infrastructure as Code concepts and the practical considerations involved in managing cloud resources.

It also strengthened my understanding of cloud