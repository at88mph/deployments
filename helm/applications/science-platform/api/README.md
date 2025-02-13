# Science Platform API Helm Chart

This Helm chart deploys the Science Platform API, a scalable and configurable API service for the CANFAR Science Platform.

## Prerequisites

- Kubernetes 1.27+
- Helm 3+
- Persistent storage provisioner for stateful components (if required)

## Installation

To install the chart with the release name `science-platform-api`:

```bash
helm install science-platform-api ./science-platform-api
```

or from a Helm repository:

```bash
helm repo add science-platform https://images.opencadc.org/chartrepo/science-platform
helm install science-platform-api science-platform/api
```

## Configuration

The following table lists the configurable parameters of the chart and their default values:

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of replicas | `1` |
| `image.repository` | Container image repository | `images.opencadc.org/science-platform/api` |
| `image.tag` | Container image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `service.type` | Service type | `ClusterIP` |
| `service.port` | Service port | `8080` |
| `ingress.enabled` | Enable ingress controller | `false` |
| `ingress.annotations` | Ingress annotations | `{}` |
| `ingress.hosts` | List of ingress hosts | `[]` |
| `resources` | Resource requests and limits | `{}` |
| `nodeSelector` | Node selector constraints | `{}` |
| `tolerations` | Toleration settings | `[]` |
| `affinity` | Affinity settings | `{}` |

**Table 1:** Helm Chart values

To override any value, create a `values.yaml` file and specify your desired configuration:

```yaml
replicaCount: 3
image:
  repository: myrepo/science-platform-api
  tag: v1.0.0
  pullPolicy: IfNotPresent
service:
  type: LoadBalancer
  port: 80
```

Then install using:

```bash
$ helm install science-platform-api ./science-platform-api -f values.yaml
```

## Upgrading

To upgrade an existing deployment:

```bash
helm upgrade science-platform-api ./science-platform-api -f values.yaml
````

## Uninstalling

To remove the deployment:

```bash
helm uninstall science-platform-api
```

This removes all associated Kubernetes resources but does not delete persistent storage if used.

## Contributing

If you wish to contribute to this Helm chart, please submit a pull request to the repository with relevant updates and documentation.

## License

This Helm chart is licensed under the MIT License. See LICENSE for details.