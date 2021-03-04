# Getting started
This getting started guide provides a set of quick start guidelines for running [Prancer Basic](https://github.com/prancer-io/cloud-validation-framework) on your system. You can follow them quickly and get a grasp of how the Prancer platform works in Basic Edition.
The scenario cases ran in this quick start guide are extremely simple and are only figured here as a means to grasp the features of Prancer quickly. 

## Introduction
To simulate a real-world scenario, we have some configuration files in our Hello World repository. We have two JSON resources available. In one of them, `data/resource-pass.json`, the webserver is configured to service at port 80. In the other resource, `data/resource-fail.json`, the webserver is supposed to service at port 443. We will run the test to see if the webserver is running on port 80.

## Overview 
Here are the steps we will go through:
- Prerequisites
- Prancer installation
- Clone the `Hello World` repository
- Run the tests
- Review the outputs

## Prerequisites
You can run these procedures on any Linux-based system. But for simplicity, this tutorial is based on the Ubuntu distribution 20.04

These are the prerequisites:
- OS: any Linux-based system
- `python` 3.6.8 / 3.8 or 3.9 -[Python website](https://www.python.org/downloads/)
- `pip` 3 - [The Python Package Installer](https://pip.pypa.io/en/stable/)

## Prancer Installation
You can install Prancer on your system with the following command:
`# pip3 install prancer-basic`

it will install all the prerequisites on your system and then install prancer-basic executables.

you can make sure the installation is completed successfully by running the following command:

```
# prancer --version
Prancer 1.0.39
```

## Clone the Hello-World repository
For simplicity, we have put all the base files in a hello world repository on [github](https://github.com/prancer-io/prancer-hello-world). Clone the repo:

`# git clone https://github.com/prancer-io/prancer-hello-world.git`

## Run sample tests
change the directory to the cloned directory in the previous step:
`# cd prancer-hello-world`

We have two sets of tests to run based on the filesystem connector. One test will "pass" and the other test will "fail"

```
# prancer scenario-pass
# prancer scenario-fail
```

after each run, you see a summary like this:

```
Run Stats: {
  "start": "2020-05-19 09:02:55",
  "end": "2020-05-19 09:02:56",
  "errors": [],
  "host": "prancer-machine-01",
  "timestamp": "2020-05-19 09:02:55",
  "jsonsource": false,
  "database": 0,
  "singletest": false,
  "log": "/tmp/prancer-hello-world/log/20200519-090254.log",
  "duration": "1 seconds"
}
```

## Review the outputs
The outputs will be saved in the `validation/scenario-pass/` and `validation/scenario-fail`

```
# cat validation/scenario-pass/output-test.json 
{
  "$schema": "",
  "contentVersion": "1.0.0.0",
  "fileType": "output",
  "timestamp": 1612284070247,
  "snapshot": "snapshot",
  "container": "scenario-pass",
  "log": "",
  "test": "test.json",
  "results": [
    {
      "result": "passed",
      "snapshots": [
        {
          "id": "1",
          "structure": "filesystem",
          "reference": "master",
          "source": "connector",
          "collection": "webserver",
          "type": "json",
          "region": "",
          "paths": [
            "data/resource-pass.json"
          ]
        }
      ],
      "autoRemediate": false,
      "testId": "1",
      "rule": "{1}.webserver.port=80",
      "status": "enable"
    }
  ]
}
```

you see many details here. The header information contains filetype, timestamps and other useful information. in the `results` section, you can see the result of the test is `passed`

Now, let's check the result of the other test.

```
# cat validation/scenario-fail/output-test.json 
{
  "$schema": "",
  "contentVersion": "1.0.0.0",
  "fileType": "output",
  "timestamp": 1612284084137,
  "snapshot": "snapshot",
  "container": "scenario-fail",
  "log": "",
  "test": "test.json",
  "results": [
    {
      "result": "failed",
      "snapshots": [
        {
          "id": "1",
          "structure": "filesystem",
          "reference": "master",
          "source": "connector",
          "collection": "webserver",
          "type": "json",
          "region": "",
          "paths": [
            "data/resource-fail.json"
          ]
        }
      ],
      "autoRemediate": false,
      "testId": "1",
      "rule": "{1}.webserver.port=80",
      "status": "enable"
    }
  ]
}
```

Here you see that the result is failed.

*congratulations!* You have completed the prancer Hello-World!

You can find out more information about prancer platform at [Prancer docs](https://docs.prancer.io) .