package rule

default check_value = false
check_value  {
    resource := parameters.osDiskSizeGB.maxValue
    resource == 526

