package rule

default check_name = false
check_name  {
    resource := input.kind
    resource == "ServiceAccount"
}
