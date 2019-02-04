# ibm-cos-go-example

``ibm-cos-go-example`` demonstrates how to use the IBM cloud object storage with the SDK of AWS S3.

## Quickstart

 - Create the credential file

 The credential file by default is stored in the file ``~/.aws/credentials``. The minimum content in the file should include ``aws_access_key_id`` and ``aws_secret_access_key``, e.g.,
```
[default]
aws_access_key_id = orn46373ugd656
aws_secret_access_key = EprhiehdugugeuhdsgduiwheudrlzabJFrcubg83b
```

 - Compile and run the program

         go get ./...
         make
         ./bin/cos
