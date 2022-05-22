{{/*
Expand the name of the chart.
*/}}
{{- define "mtwebhook.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
secretname
*/}}
{{- define "mtwebhook.secretname" -}}
{{ template "mtwebhook.name" . }}-certs
{{- end -}}
{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mtwebhook.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mtwebhook.fqsvc" -}}
{{-  ( printf "%s.%s" (include "mtwebhook.name" .) .Release.Namespace ) -}}
{{- end -}}

