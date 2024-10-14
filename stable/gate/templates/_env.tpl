{{- define "gate.env" -}}
- name: RAILS_ENV
  value: {{ .Values.config.rails.environment }}
- name: RAILS_SERVE_STATIC_FILES
  value: {{ .Values.config.rails.serveStaticFiles | quote }}
- name: GATE_SERVER_URL
  value: {{ .Values.config.gateServerUrl }}
- name: SIGN_IN_TYPE
  value: {{ .Values.config.signInType }}
- name: GATE_OAUTH_CLIENT_ID
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateOauthClientId
- name: GATE_OAUTH_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateOauthClientSecret
- name: GATE_HOSTED_DOMAIN
  value: {{ .Values.config.gateHostedDomain }}
- name: GATE_HOSTED_DOMAINS
  value: {{ .Values.config.gateHostedDomains }}
- name: GATE_DB_HOST
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateDBHost
- name: GATE_DB_PORT
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateDBPort
- name: GATE_DB_NAME
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateDBName
- name: GATE_DB_USER
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateDBUser
- name: GATE_DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateDBPassword
- name: CACHE_HOST
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: cacheHost
- name: CACHE_PORT
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: cachePort
- name: SECRET_KEY_BASE
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: secretKeyBase
- name: SECRET_API_KEY
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: secretApiKey
- name: GATE_CONFIG_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateConfigSecret
- name: USER_ROLES
  value: {{ .Values.config.userRoles }}
- name: UID_BUFFER
  value: {{ .Values.config.uidBuffer | quote }}
- name: DEFAULT_HOST_PATTERN
  value: {{ .Values.config.defaultHostPattern }}
- name: PRODUCT_LIST
  value: {{ .Values.config.productList }}
- name: SAML_APPS
  value: {{ .Values.config.samlApps }}
- name: GATE_ORGANIZATION_NAME
  value: {{ .Values.config.gateOrganizationName }}
- name: GATE_ORGANIZATION_STATIC
  value: {{ .Values.config.gateOrganizationStatic }}
- name: GATE_VPN_SSL_CERT
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateVpnSslCert
- name: GATE_VPN_SSL_XSIGNED
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateVpnSslXsigned
- name: GATE_VPN_SSL_PVTKEY
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: gateVpnSslPrivateKey
- name: NEWRELIC_AGENT_ENABLED
  value: {{ .Values.config.newrelicAgentEnabled | quote }}
- name: NEWRELIC_LICENSE_KEY
  valueFrom:
    secretKeyRef:
      name: {{ template "gate.secretName" . }}
      key: newrelicLicenseKey
- name: NEWRELIC_APP_NAME
  value: {{ .Values.config.newrelicAppName }}
{{- range $k, $v := .Values.configmap }}
- name: {{ $k }}
  value: {{ $v | quote }}
{{- end }}
{{- end }}
