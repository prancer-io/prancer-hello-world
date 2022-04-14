import argparse
import configparser
import os

def exists_file(fname):
    """Check if path exists and is a file"""
    if fname and os.path.exists(fname) and os.path.isfile(fname):
        return True
    return False


def valid_config_ini(config_ini):
    """ Valid config ini path and load the file and check """
    config_data = None
    if exists_file(config_ini):
        config_data = configparser.ConfigParser(allow_no_value=True)
        config_data.read(config_ini)
    return True if config_data else False


def main(args):
    """ Parse args and update the config """
    parser = argparse.ArgumentParser(description='Process to add/delete config ini sections')
    parser.add_argument('--add', action='store_true', default=False, help='Add/Change else default is delete the configuration from the configuration file')
    parser.add_argument('--section', action='store', default=None, help='Config file section to add/update or delete')
    parser.add_argument('--key', action='store', default=None, help='Key to add/update or delete')
    parser.add_argument('--value', action='store', default=None, help='Value to add/update')
    parser.add_argument('config', action='store', default=None, help='Config file to be updated')
    pargs = parser.parse_args(args)
    print(pargs)
    if valid_config_ini(pargs.config):
       print("Valid ini: %s" % pargs.config)
       cfg= configparser.ConfigParser(allow_no_value=True)
       cfg.optionxform=str
       cfg.read(pargs.config)
       if pargs.add:
           if not cfg.has_section(pargs.section):
               cfg.add_section(pargs.section)
           cfg.set(pargs.section, pargs.key, pargs.value)
       else:
           if cfg.has_section(pargs.section):
               if pargs.key in cfg[pargs.section]:
                    cfg.remove_option(pargs.section, pargs.key)
               cfg.remove_section(pargs.section)
       with open(pargs.config, 'w') as configfile:
           cfg.write(configfile)

     
        

if __name__ == "__main__":
    import sys 
    main(sys.argv[1:])
