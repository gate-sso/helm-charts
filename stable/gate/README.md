# Gate Helm Chart

This chart bootstraps a single node Gate deployment on [Kubernetes](http://kubernetes.io) cluster using [Helm](https://helm.sh) package manager.

## Adding the Repo

You need to add gate-sso helm packages repository before installing the chart:

```bash
$ helm repo add gate-sso https://gate-sso.github.io/helm-packages
```

## Installing the Chart

To install the chart with the release name `gate-release`:

```bash
$ helm install --name gate-release gate-sso/gate
```

Run this command from this project directory to deploys Gate on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameter that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `gate-release` deployment:

```bash
$ helm delete gate-release
```

This command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Gate chart and their default values.

Parameter                           | Description                                             | Default
----------------------------------- | ------------------------------------------------------- | -------------
`replicas`                          | Node replicas (deployment)                              | `1`
`image.name`                        | `gate` image repository                                 | `gate`
`image.tag`                         | `gate` image tag                                        | `0.1.0`
`image.pullPolicy`                  | Image pull policy                                       | `IfNotPresent`
`service.type`                      | Service type                                            | `ClusterIP`
`service.annotations`               | Kubernetes annotations for service                      | `{}`
`service.loadBalancerIP`            | LoadBalancer service IP                                 | `nil`
`service.loadBalancerSourceRanges`  | Range of subnet that allowed to access service          | `nil`
`service.nodePort`                  | Set NodePort for service when using NodePort type       | `nil`
`rbac.create`                       | Set this to `true` to create RBAC resources             | `false`
`rbac.serviceAccountName`           | Name of serviceAccount when `rbac.create` is `false`    | `default`

Parameters in `config.*` map to `.env` variables defined in the [Gate github](https://github.com/gate-sso/gate)

You can copy [values.yaml](values.yaml) to `my-values.yaml` then specify the values for the parameters. Then you can use it to provide parameters while installing the chart. For example,

```bash
$ helm install --name gate-release -f my-values.yaml gate-sso/gate
```
