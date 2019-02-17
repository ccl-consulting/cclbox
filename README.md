# [![Gitlab-CI](https://gitlab.com/ccl-consulting/cclbox/badges/master/build.svg)](https://gitlab.com/ccl-consulting/cclbox/pipelines)

# Packer

This repository contains files used by [Packer](https://www.packer.io/) to create images for Vagrant Cloud

## Variables available

    Optional variables and their defaults:

| Variables         | Value                     | Description                                      |
| ----------------- | ------------------------- | ------------------------------------------------ |
| VAGRANT_TOKEN     | "{{env `VAGRANT_TOKEN`}}" | Only when you want to upload in vagrant-cloud    |
| readme_vagrant    | CentOS 7.5.1804           | This the desciption you can see on vagrant cloud |
| organization      | CCL-Consulting            | The Organization use in Vagrant Cloud            |
| version           | 1.0.{{timestamp}}         | Version use in vagrant-cloud processors          |
| http              | http/centos/7             | path to kickstart                                |
| ks_file           | /centos7.cfg              | kickstart                                        |
| distribution      | centos7                   | name of the distribution                         |
| scripts_path      | scripts/centos/7          | path to shell scripts                            |
| name              | packer-centos-7-x86_64    | name of the vm                                   |
| shutdown          | sudo -S shutdown -P now"  | the shutdown command                             |
| iso_base_url      | iso                       | path to iso file                                 |
| iso_checksum_type | sha256                    | iso checksum type md5, sha256                    |
| username          | vagrant                   | username of the vagrant box                      |
| password          | vagrant                   | password of the vagrant box                      |
| disk_size         | 40960                     | the disk size: default 40Go                      |
| timeout           | 300m                      | timeout for ssh connection                       |
| headless          | true                      | use the GUI during the build                     |
| iso_checksum      | dde07d37647a1d2d9247e33f1 | Checksum of the iso file                         |

## Supported Operating System

| Operating System                        | Associated Template | Local Associated Template |
| --------------------------------------- | ------------------- | ------------------------- |
| CentOS 7 - Release 7.5.1804             | centos7.json        | centos7-local.json        |
| Ubuntu 14.04.5 LTS - Thrusty Thar       | ubuntu14.json       | ubuntu14-local.json       |
| Fedora Server 28                        | fedoraserver28.json | fedoraserver28-local.json |

## Examples with Vagrant-Cloud Post-processors

To create an image of CentOS 7.5 (1804) for virtualbox :

```shell
   $ export VAGRANT_TOKEN=yourtoken
   $ packer build --only=virtualbox-iso centos7.json
```

To create an image of CentOS 7.5 (1804) for kvm :

```shell
  $ export VAGRANT_TOKEN=yourtoken
  $ packer build --only=qemu centos7.json
```

> You need to use the virtualbox build with a CI/CD on Bare-Metal or on your own infrastructure

## Examples without Vagrant-Cloud Post-processors

To create an image of CentOS 7.5 (1804) for virtualbox :

```shell
  $ packer build --only=virtualbox-iso centos7-local.json
```

To create an image of CentOS 7.5 (1804) for kvm :

```shell
  $ packer build --only=qemu centos7-local.json
```

> To browse available plugins, run `gem list --remote vagrant-`

> To browse available actinium boxes [Here](https://app.vagrantup.com/ccl-consulting/)
