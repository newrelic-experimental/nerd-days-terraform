# Nerd Days: Reducing toil with Terraform

## Requirements

To get the most value out of the following, you should have a basic understanding of Terraform (HCL semantics are not covered), and a New Relic account that you can test with.

* Terraform > 0.13.0
* New Relic Account
  * User with Admin role
  * Application reporting to New Relic


## References

* [New Relic Provider for Terraform Repo](https://github.com/newrelic/terraform-provider-newrelic)
* [New Relic Provider for Terraform documentation](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)
* [Nerd Days 2020 Presentation Slide deck](docs/Reducing-Toil-With-Terraform.pdf)


# Initial Setup

This lab sets up the basics needed to connect to New Relic via Terraform.

## Setup

* These labs require that you already have a New Relic agent deployed. If you don't have New Relic integrated yet, check out [New Relic's introduction documentation](https://docs.newrelic.com/docs/using-new-relic/welcome-new-relic/get-started/introduction-new-relic) to get started there, then head back over here to get started with the New Relic Terraform Provider using the examples provided.
* [Install Terraform](https://www.terraform.io/intro/getting-started/install.html?_ga=2.164025788.269660441.1594650089-1818784635.1574706678) and read the Terraform getting started guide that follows. This guide will assume a basic understanding of Terraform.
* Locate your Personal API key by following [New Relic's Personal API key docs](https://docs.newrelic.com/docs/apis/get-started/intro-apis/types-new-relic-api-keys#personal-api-key).
* Locate your Admin's API key by following [New Relic's Admin API key docs](https://docs.newrelic.com/docs/apis/get-started/intro-apis/types-new-relic-api-keys#admin).

## Environment

It is recommended to store secrets in Environmental variables for these labs instead of the `main.tf` file.


### Environment setup for bash:

```bash
export NEW_RELIC_ACCOUNT_ID=
export NEW_RELIC_API_KEY=
export NEW_RELIC_REGION="US"   # or "EU"
```

## Steps

1. Configure environment or set values in main.tf
1. Run `terraform init`
1. Run `terraform plan`



# Labs

* Each lab builds on the previous, so you'll need to ensure that they are working
before moving on.
* Each `lab*` directory is a module, so moving to the next lab involves
  uncommenting the module import in the root `main.tf` file.


## Instructions

* [Lab 1](lab1/README.md): Entities
* [Lab 2](lab2/README.md): Alert Policies
* [Lab 3](lab3/README.md): Alert Conditions
* [Lab 4](lab4/README.md): Entity Tags
* [Lab 5](lab5/README.md): Dashboards



