# AWS Config

we'll use AWS Config to detect compliant and non-compliant ec2 instances for below rule.
- compliant ec2 instance has monitoring enabled
- non-compliant ec2 instance does not have monitoring enabled

Step 1: Set Up AWS Config

    Log in to your AWS Management Console.

    Navigate to the AWS Config service.

    Click on "Get started" if you're using AWS Config for the first time.

    Configure the delivery channel settings, which include specifying an Amazon S3 bucket where AWS Config will store configuration history.

    Choose the resource types you want AWS Config to monitor. In this case, select "Amazon EC2 Instances."

Step 2: Create a Custom Config Rule

    Navigate to the AWS Config console.

    In the left navigation pane, click on "Rules."

    Click on the "Add rule" button.

    Choose "Create a custom rule."

    Give your rule a name and description (e.g., "Monitoring for EC2 Instances").

    For "Scope of changes," choose "Resources."

    Define the rule trigger. You can use AWS Lambda as the trigger source. If you haven't already created a Lambda function for this rule, create one that checks whether monitoring is enabled for an EC2 instance. The Lambda function will return whether the resource is compliant or not based on monitoring status.

Step 3: Define the Custom Rule in AWS Config

    Choose your Lambda function from the dropdown list as the evaluator for the rule.

    Specify the trigger type (e.g., "Configuration changes").

    Save the rule.

Step 4: Monitor and Alert

    AWS Config will now continuously evaluate your EC2 instances against the rule you've created.

    If any EC2 instance is found without monitoring enabled, the custom rule's Lambda function will mark it as non-compliant.