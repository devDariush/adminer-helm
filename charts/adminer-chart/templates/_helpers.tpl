{{/* Shared labels for adminer */}}
{{- define "adminer.labels" -}}
app.kubernetes.io/name: {{ .Values.global.adminer.labelName | default "adminer" }}
app.kubernetes.io/component: "frontend"
{{- template "adminer-global.labels" . }}
{{- end -}}
