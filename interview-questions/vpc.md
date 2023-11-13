### 1. What is Amazon Virtual Private Cloud (VPC)?
Amazon VPC is a logically isolated section of the AWS Cloud where you can launch resources in a virtual network that you define. It allows you to control your network environment, including IP addresses, subnets, and security settings.

### 2. What are the key components of Amazon VPC?
Key components of Amazon VPC include subnets, route tables, network access control lists (ACLs), security groups, and Virtual Private Gateways (VPGs).

### 3. How does Amazon VPC work?
Amazon VPC enables you to create a private and secure network within AWS. You define IP ranges for your VPC, create subnets, and configure network security.

### 4. What are VPC subnets?
VPC subnets are segments of the VPC's IP address range. They allow you to isolate resources and control access by creating public and private subnets.

### 5. How can you connect your on-premises network to Amazon VPC?
You can establish a Virtual Private Network (VPN) connection or use AWS Direct Connect to connect your on-premises network to Amazon VPC.

### 6. What is a VPC peering connection?
VPC peering allows you to connect two VPCs together, enabling resources in different VPCs to communicate as if they were on the same network.

### 7. What is a route table in Amazon VPC?
A route table defines the rules for routing traffic within a VPC. It determines how traffic is directed between subnets and to external destinations.

### 8. How do security groups work in Amazon VPC?
Security groups act as virtual firewalls for your instances, controlling inbound and outbound traffic. They can be associated with instances and control their network access.

### 9. What are network access control lists (ACLs) in Amazon VPC?
Network ACLs are stateless filters that control inbound and outbound traffic at the subnet level. They provide an additional layer of security to control traffic flow.

### 10. How can you ensure private communication between instances in Amazon VPC?
You can create private subnets and configure security groups to allow communication only between instances within the same subnet, enhancing network security.

### 11. What is the default VPC in Amazon Web Services?
The default VPC is a pre-configured VPC that is created for your AWS account in each region. It simplifies instance launch but doesn't provide the same level of isolation as custom VPCs.

### 12. Can you peer VPCs in different regions?
No, VPC peering is limited to VPCs within the same region. To connect VPCs across regions, you would need to use VPN or AWS Direct Connect.

### 13. How can you control public and private IP addresses in Amazon VPC?
Amazon VPC allows you to allocate private IP addresses to instances automatically. Public IP addresses can be associated with instances launched in public subnets.

### 14. What is a VPN connection in Amazon VPC?
A VPN connection allows you to securely connect your on-premises network to your Amazon VPC using encrypted tunnels over the public internet.

### 15. What is an Internet Gateway (IGW) in Amazon VPC?
An Internet Gateway enables instances in your VPC to access the internet and allows internet traffic to reach instances in your VPC.

### 16. How can you ensure high availability in Amazon VPC?
You can design your VPC with subnets across multiple Availability Zones (AZs) to ensure that your resources remain available in the event of an AZ outage.

### 17. How does Amazon VPC provide isolation?
Amazon VPC provides isolation by allowing you to define and manage your own virtual network environment, including subnets, route tables, and network ACLs.

### 18. Can you modify a VPC after creation?
While you can modify certain attributes of a VPC, such as its IP address range and subnets, some attributes are immutable, like the VPC's CIDR block.

### 19. What is a default route in Amazon VPC?
A default route in a route table directs traffic to the Internet Gateway (IGW), allowing instances in public subnets to communicate with the internet.

### 20. What is the purpose of the Amazon VPC Endpoint?
An Amazon VPC Endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services without needing an internet gateway or VPN connection.