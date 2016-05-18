This repository combines two things:

 - Scripts wrapping Duffy
 - Skeleton jenkins job builder macros for allocating machines
   and running Ansible

Quickstart
==========

First, create a file `jenkins.ini`:

```
[jenkins]
user=
password=
url=https://ci.centos.org
```

Fill in your user/password.

Run this step to prepare the templates.
```
make CENTOSCIPROJECTNAME=mysig CENTOSCINODE=my-sig-ci-slave01
```

Now, to update your jobs:

```
jenkins-jobs --conf jenkins.ini update jjb:/path/to/your/jobs
```

Look at the JJB in `jjb-demo` as a starting point.
