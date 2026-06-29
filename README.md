# Terraform with AWS 

Welcome to the comprehensive Terraform with AWS video course! This repository contains all code samples and documentation corresponding to each  lesson.

<details>
<summary> 📋 Prerequisites</summary>
  
- [AWS free account or subscription](https://aws.amazon.com/free/)
- AWS Fundamentals
- OSI model and protocols - SSH, HTTP, HTTPS, TCP,UDP, SMTP, etc
- Visual Studio Code or preferred IDE installed
- Git installed and working knowledge of Git and Github
- Linux or Mac or WSL(Windows Subsystem for Linux)
- Linux and Shell scripting
- Basic understanding of YAML and JSON
- [Deployment Strategies](https://youtu.be/uj0qDN1EWus)
- [Networking Fundamentals](https://youtu.be/yUhzvVrwkV8)
- [IP Addressing](https://youtu.be/G1azmL5-eQI)
  
</details>

## 📚 Course Curriculum

<details>
<summary> Module 1: Core Concepts</summary>

#### Day1: Introduction to Terraform
- Understanding Infrastructure as Code (IaC)
- Why we need IaC
- What is Terraform and its benefits
- Challenges with the traditional approach
- Terraform Workflow
- Installing Terraform
- [Code Sample](/lessons/day01/)

#### Day2: Terraform Provider
- Terraform Providers
- Provider version v/s Terraform core version
- Why version matters
- Version constraints
- Operators for versions
- [Code Sample](/lessons/day02/)

#### Day3: VPC and S3 Bucket
- Authentication and Authorization to AWS resources
- Creating VPC
- S3 bucket management
- Understanding dependencies
- [Code Sample](/lessons/day03/)

#### Day4: State file management - Remote Backend
- How Terraform updates Infra
- Terraform state file
- State file best practices
- Remote backend setup
- State management
- [Code Sample](/lessons/day04/)

#### Day5: Variables
- Input variables
- Output variables
- Locals
- Variable precedence
- Variable files (tfvars)
- [Code Sample](/lessons/day05/)

#### Day6: File Structure
- Terraform file organization
- Sequence of file loading
- Best practices for structure
- [Code Sample](/lessons/day06/)

#### Day7: Type constraints in Terraform
- String, number, bool
- Map, set, list, Tuple, Objects
- [Code Sample](/lessons/day07/)

#### Day8: Meta-arguments
- Understanding count
- for_each loop
- for loop
- Practical examples
- [Code Sample](/lessons/day08)

#### Day9: The Lifecycle meta-arguments
- create before destroy
- prevent destroy
- ignore changes
- replace triggered by
- custom condition
- [Code Sample](/lessons/day09)

#### Day10: Dynamic Blocks and expressions
- Dynamic blocks
- Conditional expressions
- Splat Expressions
- practical examples
- [Code Sample](/lessons/day10)

#### Day11: Functions in Terraform
- Built-in functions
- Practical examples
- tasks for practice
- [Code Sample](/lessons/day11)

#### Day12: Functions in Terraform(Continue..)
- Built-in functions
- Practical examples
- tasks for practice
- [Code Sample](/lessons/day12)

#### Day13: Data Sources
- Using data sources
- Practical examples
- [Code Sample](/lessons/day13)

</details>

<details>
<summary>Module 2: AWS resources using Terraform</summary>

#### Day14: Static Website Hosting ( Mini Project 1 )
- S3 static website hosting
- CloudFront distribution
- [Code Sample](/lessons/day14)


#### Day15: VPC and Peering ( Mini Project 2 )
- Virtual Private Cloud Creation
- VPC peering setup
- [Code Sample](/lessons/day15)

#### Day16: IAM Authentication ( Mini Project 3 )
- Authentication methods
- IAM roles and policies
- Service accounts
- [Code Sample](/lessons/day16)

#### Day17: AWS Web Apps ( Mini Project 4 )
- Elastic Beanstalk creation
- Configuration
- Deployment
- [Code Sample](/lessons/day17)

#### Day18: AWS Lambda ( Mini Project 5 )
- Lambda function setup
- Configuration
- [Code Sample](/lessons/day18)

#### Day19: Terraform Provisioners ( Mini Project 6 )
- What are provisioners and their use case
- Local vs remote vs file provisioners
- Demo of all three provisioners
- [Code Sample](/lessons/day19)

#### Day20: EKS Cluster ( Real-time Project 1)
- Kubernetes cluster setup
- EKS cluster with managed node groups
- Custom module usage
- Custom module creation for EKS, Secrets Manager, IAM etc
- Networking and security configuration
- [Code Sample](/lessons/day20)

#### Day21: AWS Policy and Governance ( Mini Project 7 )
- Policy creation
- Governance setup
- [Code Sample](/lessons/day21)

#### Day22: RDS Database ( Mini Project 8 )
- Database creation
- Configuration
- [Code Sample](/lessons/day22)

#### Day23: AWS Monitoring ( Mini Project 9 )
- CloudWatch metrics alerts
- SNS topics
- CloudWatch logs
- Log alerts
- [Code Sample](/lessons/day23)

#### Day24: High available/scalable Infrastructure Deployment ( Mini Project 10 )

- Creating EC2 Instances
- Auto Scaling Groups
- Security Groups
- Application Load Balancer, NAT Gateway, Elastic IP, Auto Scaling rules etc
- [Code Sample](/lessons/day24)

</details>

<details>
<summary>Module 3: Advanced Concepts</summary>

#### Day25: Terraform Import (Real-time project 2)
- Different ways of importing AWS resource to Terraform
- Terraform Import
- Importing a live infrastructure to Terraform using Terraform Import
- AWS Config
- Importing a live infrastructure to Terraform using AWS Config
- Terraformer
- [Code Sample](/lessons/day25)

#### Day26: Terraform Cloud and Workspaces
- Cloud setup
- Workspace management
- [Code Sample](/lessons/day26)

#### Day27: AWS DevOps with Terraform (Real-time project 3)
- CI/CD pipeline setup
- Automation
- [Code Sample](/lessons/day27)


#### Day28: 3-Tier Architecture (Real-time project 5)
- Complete architecture setup
- Web tier, Application tier, Database tier
- Load balancing and auto-scaling
- Best practices
- [Code Sample](/lessons/day29)

#### Day29: GitOps with Terraform (Real-time project 4)

- GitOps workflow implementation
- ArgoCD setup with Terraform
- Git-based infrastructure management
- Automated deployments
- [Code Sample](/lessons/day30)


###  Terrafrom Drift Detection using Terraform Cloud
- Drift detection setup
- Monitoring infrastructure changes
- [Code Sample](/lessons/day31)

</details>


## 🔗 Resources
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Course Support Forum]()




