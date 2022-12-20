# Docker Registries
Each of AWS, GCP, and Azure have their own container registries. This
document points to how to configure each in the Jenkinsfile.

The pre-requisite for each is to save the credentials to Jenkins,
and whatever steps are required to push a container to the registry is
copied within a Jenkinsfile.

## AWS
Amazon has [their own guide](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html) for how to create and push to one of their container
registries. Follow that to get a general idea, but there are a few details it
leaves out

- IAM, and not EC2, keys are used to authenticate pushes to the repository. So after
  creating the repo, go to the IAM console and create a new user
- Once created, download the .csv of their credentials. This is what will be used
  to authenticate with the docker repository.
- Then go to [this page](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) to configure the credentials with the aws cli. Use the base aws
  configure command and manually provide the "AWS Access Key ID" and "AWS Secret Access Key"
  fields.
- Now use those credentials to push to the docker repo with the docker push command shown
  for the repo in the Amazon Elastic Container Registry page.

## Azure
Microsoft has [a guide](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli?tabs=azure-cli) on how to push to their container registry.
In similar vein to setting up Jenkins, it's done primarily through CLI.

## GCP
Google has [a guide](https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling) on pushing to their container registry, but there are a couple
of things to do which deviate from the guide.

[###](###) Credential configuration
Follow the Service account key section of the above document.
- Create a service account under the project
- Grant it access to the artifactory service added to the project
- Create the key for the service acct and save it locally
- Encode it in base64 and upload the result to Jenkins.
- Use that to login on Jenkins with the credentials binding plugin as a secret file.

Then create a repo to the registry you added to the project.

Install gcloud to Jenkins and then have it run this command before pushing
```
gcloud auth configure-docker us-east1-docker.pkg.dev
```
