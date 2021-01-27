Jekyll demo for AWS \
Sample CodeBuild build spec with standard CodeBuild image: \
```version: 0.1 

phases:
  install:
    commands:
      - gem install bundler
      - bundle install
  build:
    commands:
      - bundle exec jekyll build
      - aws s3 sync --acl public-read --delete _site/ s3://[YOUR_BUCKET_NAME]
      - aws cloudfront create-invalidation --distribution-id [CLOUDFRONT_DIST_ID] --paths '/*```
     
