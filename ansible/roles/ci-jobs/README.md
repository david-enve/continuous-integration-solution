# Ansible role 

Create a new jenkins job using ansible roles

## Requirements

Requires `python-jenkins` module. Such module can be install with `pip install python-jenkins` command
If `pip` module is missing as well, then you can install it using `sudo apt-get install python-pip` command before

## Which services are create

```
- Use this ansible role to create a new jenkins job
```

## How to run the ansible role 
```
sudo ansible-playbook -vvv play.run-ci-jobs.yml -e host=localhost -e job=$JOB_NAME
```

## Aditional notes

`host=localhost` corresponds to the ci server where ansible will deployed the new jobs
`$JOB_NAME` variable corresponds to new desired job's name
Template `ci-jobs.xml` contains the basic information to be used in the job creation process liks `description` and `build` step to execute all needed commands

## Author Information

DevOps guys
