{{- define "neo4jHeadlessService.defaultChartImage" -}}
{{- $isEnterprise := required "neo4j.edition must be specified" .Values.neo4j.edition | regexMatch "(?i)enterprise" -}}
 {{- $imageName := "neo4j:" -}}
 {{/* .Chart.AppVersion is set to "-" for headless and loadbalancer service*/}}
 {{- if eq $.Chart.AppVersion "-" -}}
    {{- $imageName = printf "%s%s" $imageName $.Chart.Version -}}
 {{- else -}}
    {{- $imageName = printf "%s%s" $imageName $.Chart.AppVersion -}}
 {{- end -}}
 {{- if $isEnterprise -}}
    {{- $imageName = printf "%s%s" $imageName "-enterprise" -}}
 {{- end -}}
 {{- $imageName -}}
{{- end -}}


{{- define "neo4jHeadlessService.image" -}}
{{- template "neo4jHeadlessService.checkLicenseAgreement" . -}}
{{- $image := include "neo4jHeadlessService.defaultChartImage" . -}}
{{/* Allow override if a custom image has been specified */}}
{{- if .Values.image -}}
  {{- if .Values.image.customImage -}}
    {{- $image = .Values.image.customImage -}}
  {{- end -}}
{{- end -}}
{{ $image }}
{{- end -}}
