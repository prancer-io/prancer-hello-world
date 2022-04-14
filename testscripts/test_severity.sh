#!/bin/bash
# source helloenv/bin/activate
# pip install -U pip
# pip install -U prancer-basic
prancer -v
echo "Run without severity, all should pass.."
prancer --db NONE severity_none_pass
retval=`echo $?`
if [ $retval -eq 1 ]; then
  echo "severity_none_pass test case failed..."
  exit 1
fi
prancer --db NONE severity_none_fail
retval=`echo $?`
if [ $retval -eq 0 ]; then
  echo "severity_none_fail test case returned 0..."
  exit 1
fi
python testscripts/updata_config_ini.py --add --section RESULT --key console_min_severity_error --value Medium config.ini
echo "Run with severity=Medium in config.ini, status should be 0 when 1 Low is failing.."
prancer --db NONE severity_low_fail
retval=`echo $?`
if [ $retval -eq 1 ]; then
  echo "severity_low_fail test case failed..."
  exit 1
fi
python testscripts/updata_config_ini.py --section RESULT --key console_min_severity_error --value Medium config.ini
echo "Run without severity in config.ini, status should be 1 as 1 Low is failing.."
prancer --db NONE severity_low_fail
retval=`echo $?`
if [ $retval -eq 0 ]; then
  echo "severity_low_fail test case failed..."
  exit 1
fi
python testscripts/updata_config_ini.py --add --section RESULT --key console_min_severity_error --value High config.ini
echo "Run with severity=High in config.ini, status should be 0 when 1 Medium and 1 Low is failing.."
prancer --db NONE severity_medium_low_fail
retval=`echo $?`
if [ $retval -eq 1 ]; then
  echo "severity_medium_low_fail test case failed..."
  exit 1
fi
python testscripts/updata_config_ini.py --section RESULT --key console_min_severity_error --value High config.ini
echo "Run without severity in config.ini, status should be 1 when 1 Medium and 1 Low is failing.."
prancer --db NONE severity_medium_low_fail
retval=`echo $?`
if [ $retval -eq 0 ]; then
  echo "severity_medium_low_fail test case failed..."
  exit 1
fi
exit 0
