# Jenkis on Cloud Providers
It is possible to easily set up Jenkins to run on AWS, Azure, and GCP.

## AWS
The basic idea is to provision a VM and install Jenkins on that.

The Jenkins website has [a guide](https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/) for how to install Jenkins on AWS.

## Azure
Similar to AWS; spin up a VM and install Jenkins to that.

Microsoft's website has [a guide](https://learn.microsoft.com/en-us/azure/developer/jenkins/configure-on-linux-vm) for how to do that.
The first time the cloud shell is used it must be on a chromium-based browser.

## GCP
Google has the easiest way to spin up a Jenkins instance of the 3. It has a way to
select a pre-configured image to dpeloy to your project.

1. Start a new GCP project.
2. In the search bar for the project, type "Jenkins" and hit enter.
3. A list should appear. Select the one that reads "A continuous integration and delivery tool".
4. The Jenkins instance can be managed and viewed from the "Deployment Manager" portion
   of the GCP project.
5. Access the Jenkins instance from the IP address given on the Deployment Manager page.

The difference between GCP's Jenkins this way vs Azure and AWS is that GCP starts
costing money immediately, whereas AWS and Azure don't because they allow the VM
to be deployed for free, at least initially.
