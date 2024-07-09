{{- define "neo4jLoadbalancer.name" -}}
  {{- required "neo4j.name is required" .Values.neo4j.name }}
{{- end -}}

{{- define "neo4jLoadbalancer.appName" -}}
  {{- required "neo4j.name is required" .Values.neo4j.name }}
{{- end -}}
