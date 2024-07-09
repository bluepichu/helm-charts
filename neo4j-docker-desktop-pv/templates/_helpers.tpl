{{- define "neo4jDockerDesktopPv.appName" -}}
  {{ required "neo4j.name is required" .Values.neo4j.name }}
{{- end -}}
