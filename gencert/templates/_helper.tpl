{{/*
Generate certificates 
see: https://medium.com/nuvo-group-tech/move-your-certs-to-helm-4f5f61338aca
*/}}

{{- define "gencert.fqsvc" -}}
{{-  ( printf "%s.%s" .Values.servicename .Release.Namespace ) -}}
{{- end -}}

{{- define "gencert.gen-certs" -}}
{{- $altNames := list ( include "gencert.fqsvc" . ) ( printf "%s.svc" (include "gencert.fqsvc" .) ) -}}
{{- $ca := genCA "gencert-ca" 365 -}}
{{- $cert := genSignedCert .Values.servicename nil $altNames 365 $ca -}}
{{/* set $.Values "ca" $cert.Cert */}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
ca: {{ $ca.Cert | b64enc }}
{{- end -}}
