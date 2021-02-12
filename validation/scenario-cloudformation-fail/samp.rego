package rule

default check_ref = false
check_ref  {
    resource := Resources.Ec2Instance.Properties.KeyName.Ref
    resource == "Key"
}
