{{/* Shared labels for postgres */}}
{{- define "postgres.labels" -}}
app.kubernetes.io/name: {{ .Values.global.postgres.labelName | default "postgres" }}
app.kubernetes.io/component: "database"
{{- template "adminer-global.labels" . }}
{{- end -}}
