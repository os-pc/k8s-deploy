# k8s-deploy


Install steps:
1. Clone this repo.
2. Ensure you have ansible collections for terrform module.
3. Ensure you have the right python requirements setup.


### Setup the environment to run

```

$ virtualenv k8s
$ cd k8s
$ source bin/activate
$ git clone git@github.com:os-pc/k8s-deploy.git
$ cd k8s-deploy
$ pip install -r pip-requirements.txt
$ ansible-galaxy collection install community.general


Get your nova credentials
$ nova credentials


$ export OS_TENANT_ID='nova tenant id'
$ export OS_USERNAME='nova username'
$ export OS_AUTH_TOKEN='token part of nova credentials'

finally,
$ ansible-playbook rax_cluster.yaml -e region=IAD -vv

```
