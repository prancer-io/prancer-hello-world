# Getting started
This section provides a set of quick start guidelines for running Prancer cloud validation framework on your system. You can follow them easily and get a grasp of how prancer cloud validation framework works.
The test cases ran in this quick start scenario are extremely simple and are only figured here as a means to quickly grasp the features of Prancer. If you want more detailed explanations, read on the reference documentation at https://docs.prancer.io .

## Overview 
Here are the steps we will go through:
- Prancer installation
- Clone the sample repository
- Run the tests
- Analyze the outputs

## Prerequisites
You can run these procedure on any linux based system. But for the simplicity, this tutorial is based on the Ubuntu distribution 18.04

## Prancer Installation
You can install prancer on your system with `pip` - [The Python Package Installer](https://pip.pypa.io/en/stable/)

`pip3 prancer-basic`

it will install all the prerequisites on your system and then install prancer-basic.

you can make sure the installation is completed successfully by running the following:
`prancer --version`
2020-05-18 21:57:16,269(cli_validator: 131) FRAMEWORDIR environment variable NOT SET, searching in current directory.

## Clone the Hello-World repository
For simplicity, we have put all the base files in a hello world repository on [github](https://github.com/prancer-io/prancer-hello-world). 
`git clone https://github.com/prancer-io/prancer-hello-world.git`


## Run sample tests
change directory to the cloned directory in the previous step:
`cd prancer-hello-world`

We have two sets of tests to run based on the git connector. One test will "pass" and the other test will "fail"

```
prancer git
prancer git-fails
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

## Analyze the outputs
The outputs will be saved in the `validation/git/` and `validation/git-fails`

`cat validation/git/output-test.json`

we have this output:

```
{
  "$schema": "",
  "contentVersion": "1.0.0.0",
  "fileType": "output",
  "timestamp": 1589904176221,
  "snapshot": "snapshot",
  "container": "git",
  "log": "",
  "test": "test.json",
  "results": [
    {
      "result": "passed",
      "snapshots": [
        {
          "id": "1",
          "path": "data/resource.json",
          "structure": "git",
          "reference": "master",
          "source": "gitConnector"
        }
      ],
      "testId": "1",
      "rule": "{1}.webserver.port=80"
    }
  ]
}
```

you see many details here. The header information contains filetype, timestamps and othter useful information. in the `results` section I can see the result of the test is `passed`

Now, I want to check the result of the other test.
`cat validation/git-fails/output-test.json`

and the output is:

```
{
  "$schema": "",
  "contentVersion": "1.0.0.0",
  "fileType": "output",
  "timestamp": 1589904534523,
  "snapshot": "snapshot",
  "container": "git-fails",
  "log": "",
  "test": "test.json",
  "results": [
    {
      "result": "failed",
      "snapshots": [
        {
          "id": "1",
          "path": "data/resource-fails.json",
          "structure": "git",
          "reference": "master",
          "source": "gitConnector"
        }
      ],
      "testId": "1",
      "rule": "{1}.webserver.port=80"
    }
  ]
}
```

Here you see that the result is failed.

You have completed the Hello-World!

# Hello World explanation
