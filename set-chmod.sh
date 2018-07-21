#!/bin/bash
#
# fix-ps-perms.sh 1.06
#
# Fix PrestaShop 1.6.x permissions. 
# Should work with 1.7.x too, but not tested yet.
#
# BACKUP ALL YOUR DATA BEFORE RUNNING THIS SCRIPT
# Remember to configure the Setup section before you use this script.
#
# CALL:
# fix-ps-perms.sh prestashop_root_folder owner
# 
# E.g.: fix-ps-perms.sh domains/test.de/shop ftpuser1
#
# HISTORY:
# 1.00: Initial release 
# 1.01: Added AUTODETECT
# 1.02: Added fix for custom file permissions
# 1.05: Rewritten AUTODETECT, due to deprecated PrestaShop variables,
#       submitted path is trimmed now
# 1.06: Fixed find warning on Linux, more custom file permissions
#
# (c)2016-2018 Harald Schneider, h_schneider@marketmix.com
#
# Setup.start
#
# AUTODETECT:
# Set this to "Y" to get the admin folder from PrestaShop's configuration.
# "N" disables autodetection.
#
AUTODETECT=Y
PS_ROOT=$1                  # PrestaShop root directory
PS_OWNER=$2                 # Owner
PS_GROUP=psacln             # Group (e.g. psacln is default for HostEurope Root Server)
PS_WRITE_PERMS=775          # Write permissions (e.g. 775 for HostEurope Root Server)
if [ $AUTODETECT == "N" ]; then
echo
echo "Autodetect is OFF" 
PS_ADMIN=xxxxxxx          # Admin folder
fi
#
# Setup.end
# Trim trailing slash
PS_ROOT=$(echo $PS_ROOT | sed 's:/*$::')
if [ $# -ne 2 ]; then
echo "This script expects 2 arguments instead of $#"
echo
echo "USAGE:" 
echo "fix-ps-perms.sh prestashop_root_folder owner"
exit 10
fi
if [ $AUTODETECT == "Y" ]; then
echo 
echo "Autodetect is ON"
echo
PS_ADMIN="$(find $PS_ROOT -name get-file-admin.php -exec dirname {} \;)"
echo "Admin folder is '$PS_ADMIN'"
echo "Installed themes:"
for DIR in `find $PS_ROOT/themes -maxdepth 1 -mindepth 1 -type d`
do
echo "  '${DIR}"
done
echo
read -p "Are these folders correct and are you sure that you want to continue? [Y/N] " prompt
if [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "No" ]]; then
echo "PROCESSING ABORTED!"
exit 10
fi
else
PS_ADMIN=${PS_ROOT}/${PS_ADMIN}
fi
if [ ! -d $1 ]; then
echo "PROCESSING ABORTED:"
echo "The PrestaShop root folder '$1' doesn't exist!"
exit 10
fi
if [ ! -d ${PS_ADMIN} ]; then
echo "PROCESSING ABORTED:"
echo "The PrestaShop admin folder '$PS_ADMIN' doesn't exist!"
echo "Please check the script's setup section."
exit 10
fi
echo
echo "Clearing caches ..."
GLOBIGNORE=index.php
rm -R $PS_ROOT/cache/cachefs/* 2> /dev/null
rm -R $PS_ROOT/cache/smarty/cache/* 2> /dev/null
rm -R $PS_ROOT/cache/smarty/compile/* 2> /dev/null
rm -R $PS_ROOT/themes/$PS_THEME/cache/* 2> /dev/null
unset GLOBIGNORE
echo
echo "Setting permissions to safe defaults - this can take a while ..."
echo "  Changing ownership ..."
find $PS_ROOT -exec chown ${PS_OWNER}:${PS_GROUP} {} \;
echo "  Changing folder permissions ..."
find $PS_ROOT -type d -exec chmod 755 {} \;
echo "  Changing file permissions"
find $PS_ROOT -type f -exec chmod 644 {} \;
echo
echo "Setting frontend write permissions ..."
chmod -R $PS_WRITE_PERMS $PS_ROOT/config
chmod -R $PS_WRITE_PERMS $PS_ROOT/cache
chmod -R $PS_WRITE_PERMS $PS_ROOT/log
chmod -R $PS_WRITE_PERMS $PS_ROOT/img
chmod -R $PS_WRITE_PERMS $PS_ROOT/mails
chmod -R $PS_WRITE_PERMS $PS_ROOT/modules
chmod -R $PS_WRITE_PERMS $PS_ROOT/translations
chmod -R $PS_WRITE_PERMS $PS_ROOT/upload
chmod -R $PS_WRITE_PERMS $PS_ROOT/download
chmod -R $PS_WRITE_PERMS $PS_ROOT/classes/cache
echo
echo "Setting theme write permissions ..."
# Process all installed themes
for DIR in `find $PS_ROOT/themes -type d -mindepth 1 -maxdepth 1`
do
echo "  $DIR"
chmod -R $PS_WRITE_PERMS $DIR/lang
chmod -R $PS_WRITE_PERMS $DIR/pdf/lang
chmod -R $PS_WRITE_PERMS $DIR/cache
chmod -R $PS_WRITE_PERMS $DIR/modules
done
echo
echo "Setting backend write permissions ..."
chmod -R $PS_WRITE_PERMS $PS_ADMIN/autoupgrade
chmod -R $PS_WRITE_PERMS $PS_ADMIN/themes/default/template/controllers/modules
echo
echo "Setting custom file permissions ..."
chmod 777 $PS_ROOT/gmerchantcenter* 2> /dev/null
chmod 777 $PS_ROOT/*sitemap.xml 2> /dev/null
chmod 777 $PS_ROOT/modules/facebookproductsfeed/feeds 2> /dev/null
echo
echo "DONE!"
echo
exit 0
