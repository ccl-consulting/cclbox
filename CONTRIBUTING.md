# CONTRIBUTING

## HowTo Update Vagrant Box under KVM Hypervisor
If you want to Update the CCL-Consulting Vagrant box
  - Make a Pull Request with updated code

> Otherwise by default the build is done by our CI/CD the first day of each month at 01:00 AM

## HowTo Add New Operating System Vagrant Box under KVM Hypervisor
If you want to add new Operating System to the CCL-Consulting Vagrant box
  - Make a Pull Request with :
    - The new local and GCP Template for example: `ubuntu14.json & ubuntu14-local.json`
    - Adapt the CircleCI Config to build the box automatically with the CI/CD
      - Add command to add new GCP VM for example: `ccl-consulting-build-box-4`
      - Add Job to build the box
      - Add to the Schedule Workflow and PR Workflow
      - Add Validate Template to the job and the Workflow
    - Add the build-<DistributionMajorversion>.sh script to build your OS for example `build-ubuntu14.sh`

> The convention name is : '<DistributionMajorversion>' like centos7 or ubuntu14
