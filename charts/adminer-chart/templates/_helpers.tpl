{{/* Shared labels for everyone */}}
{{- define "adminer-global.labels" }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end -}}

{{/* Shared labels for adminer */}}
{{- define "adminer.labels" -}}
app.kubernetes.io/name: {{ .Values.adminer.labelName | default "adminer" }}
app.kubernetes.io/component: "frontend"
{{- template "adminer-global.labels" . }}
{{- end -}}

{{/* Shared labels for postgres */}}
{{- define "adminer-postgres.labels" -}}
app.kubernetes.io/name: {{ .Values.postgres.labelName | default "postgres" }}
app.kubernetes.io/component: "database"
{{- template "adminer-global.labels" . }}
{{- end -}}
