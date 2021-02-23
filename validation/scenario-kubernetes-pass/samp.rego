package rule

default check_name = false
check_name = true{
    input.metadata.name="myapp-pod"
}
