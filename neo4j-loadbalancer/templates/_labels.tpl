{{- define "neo4jLoadbalancer.labels" -}}
    {{- with .labels -}}
        {{- range $name, $value := . }}
{{ $name | quote}}: {{ $value | quote }}
        {{- end -}}
    {{- end -}}
{{- end }}

{{- define "neo4jLoadbalancer.annotations" -}}
    {{- with . -}}
        {{- range $name, $value := . }}
{{ $name | quote }}: {{ $value | quote }}
        {{- end -}}
    {{- end -}}
{{- end }}
