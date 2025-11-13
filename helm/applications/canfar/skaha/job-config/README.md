# Job Configuration Kubernetes files

A colletion of Kubernetes YAML declaration files used to configure Jobs from Skaha when a new
User Sesssion is requested.  These files are consumed, modified, and applied by the Skaha to
the Kubernetes cluster when a new Job is created.

Skaha will execute the `launch-xxx.yaml` to first create the Job.  Once the Job is running, Skaha
will execute the `service-xxx.yaml` to create a Service to expose the Job's Pod, if appropriate, then, 
finally the `ingress-xxx.yaml` to create an Ingress to expose the Service externally, if appropriate.  Only
`headless` Jobs will not have a Service or Ingress created for them.

These files are put into a `ConfigMap` at deployment time and mounted into the Skaha Pod(s) at runtime.
