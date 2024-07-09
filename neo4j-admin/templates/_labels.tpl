{{- define "neo4jAdmin.labels" -}}
    {{- with . -}}
        {{- range $name, $value := . }}
{{ $name }}: "{{ $value }}"
        {{- end -}}
    {{- end -}}
{{- end }}

{{- define "neo4jAdmin.annotations" -}}
    {{- with . -}}
        {{- range $name, $value := . }}
{{ $name }}: "{{ $value }}"
        {{- end -}}
    {{- end -}}
{{- end }}

{{- define "neo4jAdmin.nodeSelector" -}}
{{- if and (not (kindIs "invalid" .Values.nodeSelector) ) (not (empty .Values.nodeSelector) ) }}
{{ printf "nodeSelector" | indent 10 }}: {{ .Values.nodeSelector | toYaml | nindent 12 }}
{{- end }}
{{- end }}
