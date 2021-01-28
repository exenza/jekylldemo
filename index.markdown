---
layout: home

---
Jekyll AWS Demo to demonstrate how custom Docker containers can dramatically improve build speed.

This website is served using AWS **Route53** routing to a **Cloudfront** distribution network using an S3 Bucket configured for **WebHosting** as a source.

![](/uploads/1.png)

In order to deploy this website to S3 it will need to be compiled as it's using Jekyll, a Ruby based static website generator.

We can then introduce **CodePipeline** and **CodeBuild** (using a generic Amazon Linux 2) to compile and build our static website:

![](/uploads/2.png)

Building times are however exceeding the 3 minutes, not really acceptable for such a small project! The long build time is due to:

    gem install bundler

Bundler requires a good amount of time to install all the dependencies on top of that the Amazon Linux 2 CodeBuild image include many development tools that we don't actually need!

Thanks to ECR (Elastic Container Registry) we are going to use a custom Docker with only the Ruby environment installed and pre-configured with Bundler!

The final architecture shown below can build our website in 40seconds, now that is a great improvement!

![](/uploads/3.png) 

All right then, sit tight and START BUILDING!