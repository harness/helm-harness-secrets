# harness-secrets

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A Helm chart to create Harness secrets

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mongodb.password | string | `""` |  |
| postgresdb.adminPassword | string | `""` |  |
| sto.AppAuditJWTSecret | string | `""` |  |
| sto.appHarnessToken | string | `""` |  |
| timescaledb.adminPassword | string | `""` |  |
| timescaledb.postgresPassword | string | `""` |  |
| timescaledb.standbyPassword | string | `""` |  |

