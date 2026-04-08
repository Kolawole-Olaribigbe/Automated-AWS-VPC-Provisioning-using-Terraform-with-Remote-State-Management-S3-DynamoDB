# Automated-AWS-VPC-Provisioning-using-Terraform-with-Remote-State-Management-S3-DynamoDB

This project demonstrates how to provision a custom Virtual Private Cloud (VPC) in Amazon Web Services using Terraform, while implementing a remote backend for secure state management.

The project includes:

- Custom VPC
- Public subnet
- Internet Gateway
- Route Table configuration
- Remote backend using S3
- State locking using DynamoDB

This reflects real-world Infrastructure as Code (IaC) practices used by Cloud and DevOps Engineers.

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

