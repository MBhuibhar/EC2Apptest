resource "aws_iam_role" "iam_role_ecs_terraform" {
  name = "pite-dldeb-${var.env}-ecs-iam-role"
  
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": [ "ecs-tasks.amazonaws.com"]
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

# #################################################################
# # AWS IAM role policy
# #################################################################

data "aws_iam_policy" "SecretsManagerReadWrite" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

data "aws_iam_policy" "AmazonSQSFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "CloudWatchAgentServerPolicy" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

data "aws_iam_policy" "AmazonSNSFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}

resource "aws_iam_policy" "pite-dldeb-Pull_image_dlake" {
  name = "pite-dldeb-${var.env}-Pull_image_dlake"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:GetRepositoryPolicy",
          "ecr:GetLifecyclePolicy"
        ],
        "Resource" : "arn:aws:ecr:*:${var.account_id}:repository/*"
      },
      {
        "Sid" : "VisualEditor1",
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetRegistryPolicy",
          "ecr:DescribeRegistry",
          "ecr:GetAuthorizationToken"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_policy" "pite-dldeb-infra-setup-policy" {
  name = "pite-dldeb-${var.env}-infra-setup-policy"

  policy = jsonencode({
    "Statement" : [
      {
        "Action" : [
          "ec2:CreateNetworkInterface"
        ],
        "Condition" : {
          "StringEquals" : {
            "aws:RequestTag/AmazonMSKConnectManaged" : "true"
          }
        },
        "Effect" : "Allow",
        "Resource" : "arn:aws:ec2:*:*:network-interface/*",
        "Sid" : "VisualEditor2"
      },
      {
        "Action" : [
          "ec2:CreateNetworkInterface"
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:ec2:*:*:subnet/*",
          "arn:aws:ec2:*:*:security-group/*"
        ],
        "Sid" : "VisualEditor3"
      },
      {
        "Action" : [
          "ec2:CreateTags"
        ],
        "Condition" : {
          "StringEquals" : {
            "ec2:CreateAction" : "CreateNetworkInterface"
          }
        },
        "Effect" : "Allow",
        "Resource" : "arn:aws:ec2:*:*:network-interface/*",
        "Sid" : "CreateTags"
      },
      {
        "Action" : [
          "ec2:DescribeNetworkInterfaces",
          "ec2:CreateNetworkInterfacePermission",
          "ec2:AttachNetworkInterface",
          "ec2:DetachNetworkInterface",
          "ec2:DeleteNetworkInterface"
        ],
        "Condition" : {
          "StringEquals" : {
            "ec2:ResourceTag/AmazonMSKConnectManaged" : "true"
          }
        },
        "Effect" : "Allow",
        "Resource" : "arn:aws:ec2:*:*:network-interface/*"
      },
      {
        "Action" : [
          "s3:*",
          "s3-object-lambda:*"
        ],
        "Condition" : {
          "StringEquals" : {
            "ec2:CreateAction" : "CreateNetworkInterface"
          }
        },
        "Effect" : "Allow",
        "Resource" : "*",
        "Sid" : "s3fullaccess"
      }
    ],
    "Version" : "2012-10-17"
  })
}

resource "aws_iam_policy" "pite-dldeb-pullfromecr" {
  name = "pite-dldeb-${var.env}-pullfromecr"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetRegistryPolicy",
          "ecr:DescribeImageScanFindings",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:GetDownloadUrlForLayer",
          "ecr:DescribeRegistry",
          "ecr:DescribePullThroughCacheRules",
          "ecr:DescribeImageReplicationStatus",
          "ecr:GetAuthorizationToken",
          "ecr:ListTagsForResource",
          "ecr:ListImages",
          "ecr:BatchGetRepositoryScanningConfiguration",
          "ecr:GetRegistryScanningConfiguration",
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetRepositoryPolicy",
          "ecr:GetLifecyclePolicy"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# #################################################################
# # AWS IAM role policy attachment
# #################################################################

resource "aws_iam_role_policy_attachment" "SecretsManagerReadWrite" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.SecretsManagerReadWrite.arn
}

resource "aws_iam_role_policy_attachment" "AmazonSQSFullAccess" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.AmazonSQSFullAccess.arn
}

resource "aws_iam_role_policy_attachment" "CloudWatchAgentServerPolicy" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.CloudWatchAgentServerPolicy.arn
}

resource "aws_iam_role_policy_attachment" "AmazonSNSFullAccess" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.AmazonSNSFullAccess.arn
}

resource "aws_iam_role_policy_attachment" "Pull_image_dlake" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = aws_iam_policy.pite-dldeb-Pull_image_dlake.arn
}

resource "aws_iam_role_policy_attachment" "pite-dldeb-infra-setup-policy_dlake" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = aws_iam_policy.pite-dldeb-infra-setup-policy.arn
}

resource "aws_iam_role_policy_attachment" "pite-dldeb-pullfromecr_dlake" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = aws_iam_policy.pite-dldeb-pullfromecr.arn
}
