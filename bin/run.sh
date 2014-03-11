#!/bin/bash

NODE_FILE="dev-env.json"
DEBUG_LEVEL="info"
COOKBOOK_TGZ="package.tgz"
CHEF_VERSION="11.4.4-2"
CHEF_DIR="/opt/chef"
VERBOSE=1
OK=0
E_ARGERROR=84
E_OPTERROR=85
E_CHEF_INSTALL_ERROR=66
E_COOKBOOK_ERROR=77

# print_help ()
# Prints help and exits.
# Parameter: $exit code
print_help () {
    echo "Usage: `basename $0` [options]"
    echo ""
    echo "Options:"
    echo "  -j PATH    path where node definition json is"
    echo "  -r URL     url to packaged cookbooks"
    echo "  -l         debug level for chef-solo"
    echo "  -h         this message"
    echo "  -v         verbose mode"
    exit $1
}

# install_chef_solo ()
# Install curl and the download and install chef-solo
install_chef_solo () {
    if [ ! -d $CHEF_DIR ]
    then
        log "Chef directory doesn't exist. Prepare to install chef"
        apt-get install -y curl
        log "Going to download and install chef-solo $CHEF_VERSION"
        curl -# -L http://www.opscode.com/chef/install.sh | sudo bash -s -- -v $CHEF_VERSION
        check_error "Couldn't install chef-solo" $E_CHEF_INSTALL_ERROR
    fi
}

# run_chef ()
# Run chef-solo with provided json and cookbooks
# Parameter: $debug_lvl $node_file $cookbook_tgz
run_chef () {
    local DEBUG=$1
    local NODE=$2
    local COOKBOOK=$3
    chef-solo -l $DEBUG -j $NODE -r $COOKBOOK
    check_error "Cooking failed" $E_COOKBOOK_ERROR
}

# check_error ()
# Check last exit status and if there was error
# Parameter: $msg
check_error () {
    local MSG=$1
    local EXIT_STATUS=$2
    if [ $? -gt 0 ]; then
        echo $MSG
        exit $EXIT_STATUS
    fi
}

# log ()
# Echoe's if VERBOSE is set to 1
# Parameter: $msg
log () {
    local MSG=$1
    if [ $VERBOSE -eq 1 ]
    then
        echo $MSG
    fi
}

while getopts ":j:r:l:hv" Option
do
    case $Option in
        j ) NODE_FILE=$OPTARG;;
        r ) COOKBOOK_TGZ=$OPTARG;;
        l ) DEBUG_LEVEL=$OPTARG;;
        h ) print_help $OK;;
        v ) VERBOSE=1;;
        \? ) echo "Unimplemented option chosen.";;
        : )  echo "-j, -r, -l needs args.";;
    esac
done

shift $((OPTIND-1))

install_chef_solo
run_chef $DEBUG_LEVEL $NODE_FILE $COOKBOOK_TGZ
