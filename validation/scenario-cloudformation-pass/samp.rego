package rule

default check_ref = false
check_value  {
    resource := Resources.Ec2Instance.Properties.KeyName.Ref
    resource == "KeyPair"
}

