# k8s-deploy


Install steps:
1. Clone this repo.
2. Ensure you have ansible collections for terrform module.
3. Ensure you have the right python requirements setup.


### Install bits

```
$ git clone git@github.com:os-pc/k8s-deploy.git
$ cd k8s-deploy
$ python -m venv .venv
$ source .venv/bin/activate
$ pip install -r pip-requirements.txt
$ cd kubespray
$ ansible-galaxy collection install community.general
```


### Getting OpenStack credentials

```
$ nova credentials
```
or
```
$ OS_CLOUD=<mycloud> openstack token issue
```


### Setup the environment to run
$ export OS_TENANT_ID='nova tenant id / openstack project_id'
$ export OS_USERNAME='nova username'
$ export OS_AUTH_TOKEN='token id'

### Building the cluster

```
$ ansible-playbook rax_cluster.yaml -e region=IAD -vv

```

Available regions to build:
- IAD, DFW, ORD, LON, HKG, SYD

Optional flags to the `rax_cluster.yaml` playbook:
- `-e pub_key_file=/path/to/ssh/public/key` allows you to set a different SSH key than `$HOME/.ssh/id_rsa.pub`
