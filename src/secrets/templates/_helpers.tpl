{{- define "harnesssecrets.generateSecrets" }}
{{- $timescaledbAdminPassword := include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "timescaledbAdminPassword" "providedValues" (list "timescaledb.adminPassword") "length" 16 "context" $) }}
{{- $timescaledbPostgresPassword := include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "timescaledbPostgresPassword" "providedValues" (list "timescaledb.postgresPassword") "length" 16 "context" $) }}
{{- $timescaledbStandbyPassword := include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "timescaledbStandbyPassword" "providedValues" (list "timescaledb.standbyPassword") "length" 16  "context" $) }}
    mongodbUsername: YWRtaW4=
    mongodbPassword: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "mongodbPassword" "providedValues" (list "mongodb.password") "length" 16 "context" $) }}
    postgresdbAdminPassword: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "postgresdbAdminPassword" "providedValues" (list "postgresdb.adminPassword") "length" 16 "context" $) }}
    stoAppHarnessToken:  {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "stoAppHarnessToken" "providedValues" (list "sto.appHarnessToken") "length" 16 "context" $) }}
    stoAppAuditJWTSecret:  {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "stoAppAuditJWTSecret" "providedValues" (list "sto.appAuditJWTSecret") "length" 16 "context" $) }}
    timescaledbAdminPassword: {{ $timescaledbAdminPassword }}
    timescaledbPostgresPassword: {{ $timescaledbPostgresPassword }}
    timescaledbStandbyPassword:  {{ $timescaledbStandbyPassword }}
    PATRONI_SUPERUSER_PASSWORD: {{ $timescaledbPostgresPassword }}
    PATRONI_REPLICATION_PASSWORD: {{ $timescaledbStandbyPassword }}
    PATRONI_admin_PASSWORD: {{ $timescaledbAdminPassword }}
{{ if .Values.global.ngcustomdashboard.enabled }}
    lookerLicenseKey: {{ .Values.cdb.lookerLicenseKey | quote }}
    lookerMasterKey: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "lookerMasterKey" "providedValues" (list "cdb.lookerMasterKey") "length" 32 "context" $) }}
    lookerClientSecret: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "lookerClientSecret" "providedValues" (list "cdb.lookerClientSecret") "length" 24 "context" $) }}
    lookerTimescalePassword: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-secrets" "key" "lookerTimescalePassword" "providedValues" (list "cdb.lookerTimescalePassword") "length" 16 "context" $) }}
{{- end }}
{{- end }}
{{- define "harnesssecrets.generateLookerSecrets" }}
    lookerSdkClientId: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerSdkClientId" "providedValues" (list "cdb.lookerSdkClientId") "length" 16 "context" $) }}
    lookerSdkClientSecret: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerSdkClientSecret" "providedValues" (list "cdb.lookerSdkClientSecret") "length" 16 "context" $) }}
    lookerEmbedSecret: {{ include "common.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerEmbedSecret" "providedValues" (list "cdb.lookerEmbedSecret") "length" 16 "context" $) }}
{{- end }}