{{/*
Return the chart name.
*/}}
{{- define "redis.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Return a fullname for resources.
*/}}
{{- define "redis.fullname" -}}
{{ include "redis.name" . }}-{{ .Release.Name }}
{{- end }}
