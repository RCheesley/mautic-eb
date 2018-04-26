#!/usr/bin/env bash
# Rebuild all assets in place to test composer changes and prep for release.

BASEDIR=$(dirname "$BASH_SOURCE")
cd $BASEDIR/../
BASEDIR=$( pwd )

echo ; echo "Pulling mautic-eb"
git pull

bash ./scripts/core-patches.sh

echo ; echo "Re-cloning all custom plugins"
rm -rf ./plugins/MauticContactClientBundle
git clone -b master https://github.com/TheDMSGroup/mautic-contact-client.git ./plugins/MauticContactClientBundle
rm -rf ./plugins/MauticContactSourceBundle
git clone -b master https://github.com/TheDMSGroup/mautic-contact-source.git ./plugins/MauticContactSourceBundle
rm -rf ./plugins/MauticEnhancerBundle
git clone -b master https://github.com/TheDMSGroup/mautic-enhancer.git ./plugins/MauticEnhancerBundle
rm -rf ./plugins/MauticExtendedFieldBundle
git clone -b master https://github.com/TheDMSGroup/mautic-extended-field.git ./plugins/MauticExtendedFieldBundle
rm -rf ./plugins/MauticContactLedgerBundle
git clone -b master https://github.com/TheDMSGroup/mautic-contact-ledger.git ./plugins/MauticContactLedgerBundle
rm -rf ./plugins/MauticUSStateNormalizerBundle
git clone -b master https://github.com/TheDMSGroup/mautic-usstate-normalizer.git ./plugins/MauticUSStateNormalizerBundle

echo ; echo "Updating other Mautic customizations for mautic-eb."
rm -rf ./mautic_custom
git clone -b master https://github.com/TheDMSGroup/mautic-eb-custom.git ./mautic_custom
composer custom
composer assets