package rule

default check_boot = false
check_boot  {
    resource := input.resources[_].properties.disks[_].boot
    resource == true
}
