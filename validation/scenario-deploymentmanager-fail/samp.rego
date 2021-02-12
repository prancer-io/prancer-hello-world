package rule

default check_boot = false
check_boot  {
    resource := resources.properties.boot
    resource == false
}
