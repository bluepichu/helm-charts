{{- define "neo4jPersistentVolume.appName" -}}
  {{ required "neo4j.name is required" .Values.neo4j.name }}
{{- end -}}
