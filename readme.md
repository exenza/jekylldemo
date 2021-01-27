Jekyll demo for AWS \
\
Sample CodeBuild build spec with standard CodeBuild image:

```
version: 0.1 

phases:
  install:
    commands:
      - gem install bundler
      - bundle install
  build:
    commands:
      - bundle exec jekyll build
      - aws s3 sync --acl public-read --delete _site/ s3://$DEPLOYBUCKET
      - aws cloudfront create-invalidation --distribution-id $CFDISTID --paths '/*
```
      
Build spec for custom docker image:

```
version: 0.1

phases:
  install:
    commands:
    - bundle install
  build:
    commands:
      - bundle exec jekyll build
      - aws s3 sync --acl public-read --delete _site/ s3://$DEPLOYBUCKET
      - aws cloudfront create-invalidation --distribution-id $CFDISTID --paths '/*'
  ```

Docker image used for ECR:\
https://github.com/joaoasrosa/ruby-jekyll-awscli-docker \
\
You will need correct policy for ECR:

```{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CodeBuildAccessPrincipal",
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ]
    },
    {
      "Sid": "CodeBuildAccessCrossAccount",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::[YOUR_AWS_ACCOUNT_ID]:root"
      },
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ]
    }
  ]
}
```
