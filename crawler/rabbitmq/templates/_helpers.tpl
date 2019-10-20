{{- define "rmq.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "rmq-management.fullname" -}}
{{- printf "%s-%s-%s" .Release.Name .Chart.Name "management" }}
{{- end -}}