# Helm Chart README Template

## Chart Name

science-platform/science-platform

## Overview

A Helm chart to deploy and manage [application name] on Kubernetes. This chart provides a flexible and customizable way to configure your [application] for various use cases.

## Prerequisites

- Helm v3 or higher
- Kubernetes v1.20 or higher
- A working Kubernetes cluster
- [Optional] Access to a container registry (if custom images are used)

## Installation

### Add the Chart Repository

Add the chart repository to your Helm configuration:

```bash
helm repo add [repository-name] [repository-url]
helm repo update
```

### Install the Chart

To install the Chart with default values:

```bash
helm install [release-name] [repository-name]/[chart-name]
```

To install the chart with custom values:

```bash
helm install [release-name] [repository-name]/[chart-name] -f values.yaml
```

## Configuration

The chart comes with a default `values.yaml` file that contains configurable parameters. You can override these values by providing your own values.yaml or using the `--set` flag during installation.

This chart will install several sub-charts to deploy necessary services to the Kubernetes Cluster:

| Chart Name | Description | Documentation |
| ------------ | ----------- | ------------- |
| `base`  | Base chart to deploy common services like Namespaces, Cert-Manager, Traefik, etc. | [Base Helm Chart](../base/) |
| `posix-mapper` | API to manage UID and GID POSIX style mappings. | [POSIX Mapper Helm Chart](../posix-mapper/) |
| `skaha` | Main API to handle requests to create and list Sessions. | [Skaha Helm Chart](../skaha/) |
| `science-portal` | UI to interact with the `skaha` API. | [Science Portal Helm Chart](../science-portal/) |
| `cavern` | IVOA VOSpace API to handle requests to the Storage. | [Cavern Helm Chart](../cavern/) |
| `storage-ui` | UI to interact with `cavern` for Storage access. | [Storage UI Helm Chart](../storage-ui/) |


| Parameter | Description | Default | Required? |
| --------- | ----------- | ------- | --------- |
| `hostname` | The hostname to use for the application |  | true |
| `kubernetesClusterDomain` | The domain of the Kubernetes cluster, used to find services locally | `cluster.local` | false |

```yaml
hostname: science-platform.example.org
base:
  traefik:
    install: true
    logs:
      general:
        level: INFO
skaha:
  replicaCount: 1
  sessions:
    namespace: skaha-workload

```

## Upgrading the Chart

To upgrade an existing release:

```bash
helm upgrade [release-name] [repository-name]/[chart-name] -f values.yaml
```

## Uninstalling the Chart

To uninstall a release:

```bash
helm uninstall [release-name]
```

This removes all resources associated with the release but retains the persistent data, if any.
