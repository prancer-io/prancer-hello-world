package rule

default rulepass = false
rulepass = true{
    resource := input.Resources[_]
    resource.Properties.CertificateTransparencyLoggingPreference ="ENABLED"
}
