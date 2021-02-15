package rule

default check_value = false
check_value  {
    resource := input.parameters.enableRBAC.defaultValue
    resource == true
}
