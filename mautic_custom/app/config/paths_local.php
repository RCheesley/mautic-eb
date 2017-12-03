<?php
/**
 * Override internal paths when multisite is in use.
 */
if (isset($GLOBALS['mautic_eb_mult_site'])) {
    $paths = array_merge($paths, [
        // @todo - folders must be created and permissions set for new sites.
        'themes'       => 'multi/' . $GLOBALS['mautic_eb_mult_site']['id'] . '/themes',
        'assets'       => 'multi/' . $GLOBALS['mautic_eb_mult_site']['id'] . '/media',
        'local_config' => 'multi/' . $GLOBALS['mautic_eb_mult_site']['id'] . '/config/local.php',
    ]);
}