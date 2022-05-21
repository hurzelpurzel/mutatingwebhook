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

{{/*
Generate certificates for mtwebhook api server 
see: https://medium.com/nuvo-group-tech/move-your-certs-to-helm-4f5f61338aca
*/}}
{{- define "mtwebhook.gen-certs" -}}
{{- $altNames := list ( printf "%s.%s" (include "mtwebhook.name" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "mtwebhook.name" .) .Release.Namespace ) -}}
{{- $ca := genCA "mtwebhook-ca" 365 -}}
{{- $cert := genSignedCert ( include "mtwebhook.name" . ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}
{{/*
Lookup ca
*/}}
{{- define "mtwebhook.lookup-ca" -}}
(lookup "v1" "Secret" (.Release.Namespace) (include "mtwebhook.secretname" .).data.tls.crt
{{- end -}}