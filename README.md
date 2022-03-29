# google-cloud-nat

[![Actions Status](https://github.com/netserf/google-cloud-nat/workflows/Terraform%20Lint/badge.svg)](https://github.com/netserf/google-cloud-nat/actions)
[![Actions Status](https://github.com/netserf/google-cloud-nat/workflows/Docs/badge.svg)](https://github.com/netserf/google-cloud-nat/actions)

A terraform module for turning up Google Cloud NAT when your infrastructure is
trapped inside a private network. This is useful when you need egress access to
the Internet for package updates, git repo cloning, etc., but your
infrastructure is using a private IP with no external IP mapping available.

For more information on Cloud NAT, see the [Google Cloud NAT docs](https://cloud.google.com/nat/docs/overview/).

## Build Environment

These instructions assume you already have Google Cloud access and you're
working in Google's Cloud Shell environment. From here clone the repo and
follow the build steps below.

```bash
PROJECT_ID="YOUR_PROJECT_ID"
gcloud config set project ${PROJECT_ID}
git clone https://github.com/netserf/google-cloud-nat.git
```

## Infrastructure Build

The following are the infrastructure build steps using terraform.

Note - terraform is available in the Cloud Shell.

```bash
cd terraform
```

Pull the providers:

```bash
terraform init
```

Review  the plan:

```bash
terraform plan
```

Apply the updates:

```bash
terraform apply
```

## Clean Up

```bash
terraform destroy
```

## TODOs

- Consider adding the infrastructure build to the deployment pipeline.
