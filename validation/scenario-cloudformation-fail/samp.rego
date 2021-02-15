package rule

default rulepass = false
rulepass = true{
    input.Resources[_].Properties.KeyName.Ref="KeyName"
}
