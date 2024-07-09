{{- define "neo4jReverseProxy.fullname" -}}
    {{- if .Values.fullnameOverride -}}
        {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
        {{- if .Values.nameOverride -}}
            {{- $name := default .Chart.Name .Values.nameOverride -}}
            {{- if contains $name .Release.Name -}}
                {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
            {{- else -}}
                {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
            {{- end -}}
       {{- else -}}
            {{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
       {{- end -}}
    {{- end -}}
{{- end -}}

{{- define "neo4jReverseProxy.annotations" -}}
    {{- if not (empty .) }}
annotations:
        {{- with . -}}
            {{- range $name, $value := . }}
    {{ $name | quote }}: {{ $value | quote }}
            {{- end }}
        {{- end -}}
    {{- end }}
{{- end }}

{{- define "neo4jReverseProxy.ingress.tls" -}}
    {{- if and $.Values.reverseProxy.ingress.tls.enabled $.Values.reverseProxy.ingress.tls.config }}
tls: {{ toYaml $.Values.reverseProxy.ingress.tls.config | nindent 2 }}
    {{- end }}
{{- end -}}

{{- define "neo4jReverseProxy.reverseProxy.port" -}}
    {{- if $.Values.reverseProxy.ingress.tls.enabled }}
        {{- printf "%d" 443 -}}
    {{- else -}}
        {{- printf "%d" 80 -}}
    {{- end -}}
{{- end -}}

{{- define "neo4jReverseProxy.reverseProxy.ingressName" -}}
{{- $ingressName := printf "%s-reverseproxy-ingress" (include "neo4jReverseProxy.fullname" .) -}}
{{- printf "$(kubectl get ingress/%s -n %s -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"  $ingressName .Release.Namespace -}}
{{- end -}}

{{- define ".neo4j.ingress.host" -}}
{{- if and (not (kindIs "invalid" $.Values.reverseProxy.ingress.host)) (not (empty $.Values.reverseProxy.ingress.host)) }}
host: {{ $.Values.reverseProxy.ingress.host | quote }}
{{- end }}
{{- end -}}
