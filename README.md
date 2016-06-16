# Packer builds

Packer version: 0.10


## General Requirements

Download the latest `Packer` from http://www.packer.io/downloads.html

Install `Virtualbox` 

Download `VBoxGuestAdditions` iso to `packer-minimal/` directory 

Install `aws-cli` 
http://docs.aws.amazon.com/cli/latest/userguide/installing.html


### Atlas account

1. Create an accout on https://atlas.hashicorp.com/ 
2. Get API token and paste it into template-secret-vars.json as atlas_token value




### AWS account

1. Create an accout on https://aws.amazon.com/ 
2. Get API keys andpaste those into template-secret-vars.json as access_key and secret_key
3. Create S3 bucket directory
4. Create VM Import Service Role  and policy for the service role , check also if your account have appropriate permitions , all information is on http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/VMImportPrerequisites.html#vmimport-service-role


## Files

### Packer main files:


`ami-vagrant-centos.json`

`atlas-vagrant-centos.json`


Packer files are parameterized, in orgder to  start build you need files with necessary values

### Packer general variables file

`vars-centos.7.1.json`

here you can change general variables like :

- iso url and checksum
- name of kickstart file 
- disk size
- aws region 
- s3 bucket name 
- box name on atlas 

### Packer secret variables file 

`template-secret-vars.json`

here need pass credentials to your AWS ans Atlas accounts  


`{
  "atlas_token": "atlas tocken here",
  "atlas_name": "atlas account name here",
  "access_key": "AWS key here",
  "secret_key": "AWS secret_key here"
}` 


### instalation plans are in `kickstarts` directory 

### post install scripts are in `scripts` directory 


## Build vagrant box and upload to atlas 

`$ ./packer build -var-file=vars-centos.7.1.json -var-file=template-secret-vars.json  atlas-vagrant-centos.json` 

## Build vagrant box and import as an ami to AWS

`$ ./packer build -var-file=vars-centos.7.1.json -var-file=template-secret-vars.json  ami-vagrant-centos.json`

There is a Vagrantfile for test your box, just change `config.vm.box` option 

Vagrant box is private by default . To be able use private box you need use vagrant login option :  https://vagrantcloud.com/help/vagrant/boxes/private

If you want use box without login you need make it public in Atlas website.

# Security information: 

- change root password in kickstart file 
- change user password in kickstart file and packer mainfile 
- change public-key in scripts/vagrant-key.sh  
- keep in secret you credentials to AWS and ATLAS


